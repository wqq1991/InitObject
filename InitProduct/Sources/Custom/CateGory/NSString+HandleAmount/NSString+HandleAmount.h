//
//  NSObject+HandleAmount.h
//  InitProduct
//
//  Created by Joe on 15/12/24.
//  Copyright © 2015年 Joe.Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HandleAmount)

#pragma mark 小数保留小数点后N位有效小数 eg： 45.6330  to 45.63 / 45.6 / 45.633
/*
 *保留N位有效小数(如:18.10 to 18.1)  value:小数数值 point:需要保留几位有效小数
 */
+ (NSString *)doubleToPointString:(double )value effectiveLengthDecimal:(NSUInteger )length;

/*
 *保留N位小数(如:18.1 to 18.10)  value:小数数值 point:需要保留固定的几位小数
 */
+ (NSString *)doubleToPointString:(double )value fixedLengthDecimal:(NSUInteger )length;
 
#pragma mark 现金字符转化为数字 eg： 123,456,33.00  to 12345633.00
/*
 *现金字符转化为数字 eg： 123,456,33.00  to 12345633.00
 */
+ (double)cashStrToNum:(NSString *)cashStr;

#pragma mark 数字转化为现金  可选保留几位小数   eg: 12345633.00 to 123,456,33.00
/*
 *数字转化为现金  可选保留几位小数 eg: 12345633.00 to 123,456,33.00
 */
+ (NSString *)numberToCashStr:(double)value afertPoint:(NSUInteger )length;

#pragma mark 把0到9的数字转化为大写数字  eg: 0to零 "1" to @"一"
/**
 *  把0到9的数字转化为大写数字  eg: 0to零 "1" to @"一"
 */
+ (NSString *)convertDigitalToCapital:(NSInteger )number;


#pragma mark 把0到9的数字转化为中文大写数字  eg: 0to零 "1" to @"壹"
/**
 *  把0到9的数字转化为中文大写数字  eg: 0to零 "1" to @"壹"
 */
+ (NSString *)convertDigitalToChineseCapital:(NSInteger )number;

#pragma mark 把现金string转化为金额String，对整数加入逗号,并且保留两位小数 eg: "1123456.22" to "1,123,456.22"
/**
 *  把现金string转化为金额String，对整数加入逗号,并且保留两位小数 eg: "1123456.22" to "1,123,456.22"
 */
+ (NSString *)stringToCash:(NSString *)cash;
@end
