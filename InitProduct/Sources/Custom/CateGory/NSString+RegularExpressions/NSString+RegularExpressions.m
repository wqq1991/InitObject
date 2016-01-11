//
//  NSString+RegularExpressions.m
//  InitProduct
//
//  Created by Joe on 16/1/8.
//  Copyright © 2016年 Joe.Wu. All rights reserved.
//

#import "NSString+RegularExpressions.h"

/**************************************
 *
 *   验证方法返回BOOL (是: YES 否:NO)
 *
 **************************************/

@implementation NSString (RegularExpressions)

/**
 *  检测是否中文,或者合法名字
 *
 *  @param chars chars description
 */
- (BOOL)isIncludeChineseCharsOfString:(NSString *)chars {
    
    NSString *charsRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",charsRegex];
    
    return [passWordPredicate evaluateWithObject:chars];
}

/**
 *  是否合法的网络名称 / 昵称
 *
 *  @param nickname nickname description
 *
 *  @return return value description
 */
+ (BOOL) isLawfulNickname:(NSString *)nickname {
    
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}

/**
 *  是否合法身份证号
 *
 *  @param idCard idCard description
 *
 *  @return return value description
 */
+ (BOOL) isLawfulIdCard: (NSString *)idCard {
    
    BOOL flag;
    
    if (idCard.length <= 0) {
        
        flag = NO;
        
        return flag;
    }
    
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    
    return [identityCardPredicate evaluateWithObject:idCard];
}

/**
 *  是否合法的密码组合
 *
 *  @param passWord passWord description
 *
 *  @return return value description
 */
+ (BOOL) isLawfulPassword:(NSString *)passWord {
    
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    
    return [passWordPredicate evaluateWithObject:passWord];
}

/**
 *  是否合法的用户名 (不包含特殊字符)
 *
 *  @param name name description
 *
 *  @return return value description
 */
+ (BOOL) isLawfulUserName:(NSString *)name {
    
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    
    BOOL B = [userNamePredicate evaluateWithObject:name];
    
    return B;
}

/**
 *  是否合法的车牌号
 *
 *  @param carNo carNo description
 *
 *  @return return value description
 */
+ (BOOL) isLawfulCarNo:(NSString *)carNo {
    
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    
    NSLog(@"carTest is %@",carTest);
    
    return [carTest evaluateWithObject:carNo];
}

/**
 *  是否合法的电子邮箱地址
 *
 *  @param email email description
 *
 *  @return return value description
 */
+ (BOOL) isLawfulEmail:(NSString *)email {

    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
   
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
    
}

/**
 *  是否合法的手机号
 *
 *  @param mobile mobile description
 *
 *  @return return value description
 */
+ (BOOL) isLawfulMobile:(NSString *)mobile {
    
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    return [phoneTest evaluateWithObject:mobile];
}

/**
 *  是否合法手机号 (更严谨)
 *
 *  @param mobileNum mobileNum description
 *
 *  @return return value description
 */
+ (BOOL)isLawfulMobileNumber:(NSString *)mobileNum {
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

@end
