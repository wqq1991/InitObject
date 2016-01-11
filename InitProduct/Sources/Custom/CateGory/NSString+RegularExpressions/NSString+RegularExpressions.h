//
//  NSString+RegularExpressions.h
//  InitProduct
//
//  Created by Joe on 16/1/8.
//  Copyright © 2016年 Joe.Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RegularExpressions)

/**
 *  检测是否中文,或者合法名字
 *
 *  @param chars chars description
 */
- (BOOL)isIncludeChineseCharsOfString:(NSString *)chars;

/**
 *  是否合法的网络名称 / 昵称
 *
 *  @param nickname nickname description
 *
 *  @return return value description
 */
+ (BOOL) isLawfulNickname:(NSString *)nickname;

/**
 *  是否合法身份证号
 *
 *  @param idCard idCard description
 *
 *  @return return value description
 */
+ (BOOL) isLawfulIdCard: (NSString *)idCard;

/**
 *  是否合法的密码组合
 *
 *  @param passWord passWord description
 *
 *  @return return value description
 */
+ (BOOL) isLawfulPassword:(NSString *)passWord;

/**
 *  是否合法的用户名 (不包含特殊字符)
 *
 *  @param name name description
 *
 *  @return return value description
 */
+ (BOOL) isLawfulUserName:(NSString *)name;

/**
 *  是否合法的车牌号
 *
 *  @param carNo carNo description
 *
 *  @return return value description
 */
+ (BOOL) isLawfulCarNo:(NSString *)carNo;

/**
 *  是否合法的电子邮箱地址
 *
 *  @param email email description
 *
 *  @return return value description
 */
+ (BOOL) isLawfulEmail:(NSString *)email;

/**
 *  是否合法的手机号
 *
 *  @param mobile mobile description
 *
 *  @return return value description
 */
+ (BOOL) isLawfulMobile:(NSString *)mobile;

/**
 *  是否合法手机号 (更严谨)
 *
 *  @param mobileNum mobileNum description
 *
 *  @return return value description
 */
+ (BOOL)isLawfulMobileNumber:(NSString *)mobileNum;

@end
