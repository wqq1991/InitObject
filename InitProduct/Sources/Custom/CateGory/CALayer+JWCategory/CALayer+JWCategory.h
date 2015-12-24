//
//  CALayer+JWCateGory.h
//  InitProduct
//
//  Created by Joe on 15/11/23.
//  Copyright © 2015年 Joe.Wu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (JWCateGory)

/**
 *  Xib 设置 borderColor UIColor to CGColor
 *
 *  @param color UIColor
 */
- (void)setBorderColorFromUIColor:(UIColor *)color;
@end
