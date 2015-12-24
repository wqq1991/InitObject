//
//  NSObject+HandleAmount.m
//  InitProduct
//
//  Created by Joe on 15/12/24.
//  Copyright © 2015年 Joe.Wu. All rights reserved.
//

#import "NSObject+HandleAmount.h"

@implementation NSString (HandleAmount)

/*
 保留N位有效小数  value:小数数值 point:需要保留几位有效小数
 */
- (NSString *)doubleToPointString:(double )value point:(NSInteger )point {
    
    double doubleNumber = value;
    
    NSNumberFormatter *nFormat = [[NSNumberFormatter alloc] init];
    
    [nFormat setNumberStyle:NSNumberFormatterDecimalStyle];
    
    [nFormat setMaximumFractionDigits:point];
    
    return [nFormat stringFromNumber:[NSNumber numberWithDouble:doubleNumber]];
}

@end




