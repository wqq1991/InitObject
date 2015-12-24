//
//  NSObject+HandleAmount.m
//  InitProduct
//
//  Created by Joe on 15/12/24.
//  Copyright © 2015年 Joe.Wu. All rights reserved.
//

#import "NSString+HandleAmount.h"

@implementation NSString (HandleAmount)

#pragma mark 小数保留小数点后N位有效小数 eg： 45.6330  to 45.63 / 45.6 / 45.633
/*
 *保留N位有效小数  value:小数数值 point:需要保留几位有效小数
 */
+ (NSString *)doubleToPointString:(double )value afertPoint:(NSUInteger )length {
    
    double doubleNumber = value;
    
    NSNumberFormatter *nFormat = [[NSNumberFormatter alloc] init];
    
    [nFormat setNumberStyle:NSNumberFormatterNoStyle];
    
    [nFormat setMaximumFractionDigits:length];
    
    return [nFormat stringFromNumber:[NSNumber numberWithDouble:doubleNumber]];
}

#pragma mark 现金字符转化为数字 eg： 123,456,33.00  to 12345633.00
/*
 *现金字符转化为数字 eg： 123,456,33.00  to 12345633.00
 */
+ (double)cashStrToNum:(NSString *)cashStr {
    
    //去掉逗号
    NSString *numStr = [cashStr stringByReplacingOccurrencesOfString:@"," withString:@""];
    
    double num = numStr.doubleValue;
    
    return num;
}

#pragma mark 数字转化为现金  可选保留几位小数   eg: 12345633.00 to 123,456,33.00
/*
 *数字转化为现金  可选保留几位小数 eg: 12345633.00 to 123,456,33.00
 */
+ (NSString *)numberToCashStr:(double)value afertPoint:(NSUInteger )length {

    NSNumberFormatter *nFormat = [[NSNumberFormatter alloc] init];
    
    [nFormat setNumberStyle:NSNumberFormatterDecimalStyle];
    
    [nFormat setMaximumFractionDigits:length];
    
    return [nFormat stringFromNumber:[NSNumber numberWithDouble:value]];
}

#pragma mark 把0到9的数字转化为大写数字  eg: 0to零 "1" to @"一"
/**
 *  把0到9的数字转化为大写数字  eg: 0to零 "1" to @"一"
 */
+ (NSString *)convertDigitalToCapital:(NSInteger )number
{

//    NSNumberFormatter *nFormat = [[NSNumberFormatter alloc] init];
//    
//    [nFormat setNumberStyle:NSNumberFormatterSpellOutStyle];                  //此方法有地区限制
//
//    return [nFormat stringFromNumber:[NSNumber numberWithInteger:number]];
    
    NSString *result = @"";
    
    if (number <= 9 && number >= 0)
    {
        NSArray *array = @[@"零",@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九"];
        result = [array objectAtIndex:number];
    }
    return result;
    
}

#pragma mark 把0到9的数字转化为中文大写数字  eg: 0to零 "1" to @"壹"
/**
 *  把0到9的数字转化为中文大写数字  eg: 0to零 "1" to @"壹"
 */
+ (NSString *)convertDigitalToChineseCapital:(NSInteger )number
{
    NSString *result = @"";
    if (number <= 9 && number >= 0)
    {
        NSArray *array = @[@"零", @"壹", @"贰", @"叁", @"肆", @"伍", @"陆", @"柒", @"捌", @"玖"];
        result = [array objectAtIndex:number];
    }
    return result;
}

#pragma mark 把现金string转化为金额String，对整数加入逗号,并且保留两位小数 eg: "1123456.22" to "1,123,456.22"
/**
 *  把现金string转化为金额String，对整数加入逗号,并且保留两位小数 eg: "1123456.22" to "1,123,456.22"
 */
+ (NSString *)stringToCash:(NSString *)cash
{
    //去掉千分符
    double cashDouble = [self cashStrToNum:cash];
    
    NSString *cashString = [NSNumber numberWithDouble:cashDouble].stringValue;
    return cashString;
}

@end




