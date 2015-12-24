//
//  CALayer+JWCateGory.m
//  InitProduct
//
//  Created by Joe on 15/11/23.
//  Copyright © 2015年 Joe.Wu. All rights reserved.
//

#import "CALayer+JWCateGory.h"

@implementation CALayer (JWCateGory)

/**
 *  Xib 设置 borderColor UIColor to CGColor
 *
 *  @param color UIColor
 */
- (void)setBorderColorFromUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
    
    NSLog(@"%@",NSStringFromCGRect(self.bounds));
}



@end
