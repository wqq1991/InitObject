/********************************************************************
 文件名称 : UIFont+Category.h 文件
 作 者   :
 创建时间 : 2012-00-00
 文件描述 : UIFont扩展类
 *********************************************************************/
#import <UIKit/UIKit.h>

@interface UIFont (Category)


+ (UIFont *)fontOfHeitiScOfSize:(float)size;

+ (UIFont *)fontOfArialOfSize:(float)size;
 
+ (UIFont *)fontOfMediumOfSize:(float)size;

+ (UIFont *)fontOfPingFangSCOfSize:(float)size;

/**
 *  输出所有的字体名称
 */
+ (void)enumerateFonts;

@end
