//
//  UILabel+JWCategory.m
//  InitProduct
//
//  Created by Joe on 15/11/24.
//  Copyright © 2015年 Joe.Wu. All rights reserved.
//

#import "UILabel+JWCategory.h"
#import <objc/runtime.h>

#define STHeitiWithSize(fontSize) [UIFont fontWithName:@"STHeitiSC-Medium" size:fontSize]
#define PingFangSCWithSize(fontSize) [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize] != nil ? [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize] : STHeitiWithSize(fontSize)

@implementation UILabel (JWCategory)

+ (void)load {
    
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    
    method_exchangeImplementations(imp, myImp);
}


- (id)myInitWithCoder:(NSCoder*)aDecode
{
    [self myInitWithCoder:aDecode];
    
    if (self) {
        
        if ([self isKindOfClass:[UILabel class]] && self.tag == 0) {
            
            UILabel *label = (UILabel *)self;
            
            label.font = PingFangSCWithSize(label.font.pointSize);
            
        }
        
    }
    return self;
}

@end
