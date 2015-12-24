//
//  UIButton+JWCategory.m
//  InitProduct
//
//  Created by Joe on 15/11/24.
//  Copyright © 2015年 Joe.Wu. All rights reserved.
//

#import "UIButton+JWCategory.h"
#import "UIFont+Category.h"
#import <objc/runtime.h>

@implementation UIButton (JWCategory)


+ (void)load {
    
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    
    method_exchangeImplementations(imp, myImp);
}


- (id)myInitWithCoder:(NSCoder*)aDecode
{
    [self myInitWithCoder:aDecode];
    
    if (self) {
        
        if ([self isKindOfClass:[UIButton class]] && self.tag == 0) {
            
            UIButton *button = (UIButton *)self;
            
            button.titleLabel.font = [UIFont systemFontOfSize:button.titleLabel.font.pointSize];
            
        }
        
    }
    return self;
}



@end
