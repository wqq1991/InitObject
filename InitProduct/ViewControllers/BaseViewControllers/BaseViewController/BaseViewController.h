/********************************************************************
 文件名称 : BaseViewController.h 文件
 作   者 : WuQiaoqiao
 创建时间 : 15/3/10
 文件描述 : 类
 *********************************************************************/

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


#pragma mark ---------------------按钮事件--------------------
/**
 导航栏LeftButton 的事件方法
 */
- (void)leftItemTapped;

/**
 导航栏RightButton 的事件方法
 */
- (void)rightItemTapped;

#pragma mark --------------------Navigation设置--------------------

/**
 *  设置导航条的图片
 *
 *  @param backgroundImage icon图片
 */
-(void)setNavigationBarBackgroundImage:(UIImage *)backgroundImage;

/**
 *  设置左边按钮；title和图片目前只能二选一，title优先级高于图片
 *
 *  @param title     title description
 *  @param imageName imageName description
 */
- (void)setLeftNaviItemWithTitle:(NSString *)title imageName:(NSString *)imageName;

/**
 *  设置右边按钮；title和图片目前只能二选一，title优先级高于图片
 *
 *  @param title     title description
 *  @param imageName imageName description
 */
- (void)setRightNaviItemWithTitle:(NSString *)title imageName:(NSString *)imageName;

/**
 *  @author qiaoqiao.wu
 *
 *  自定义左边的按钮
 *
 *  @param leftButton leftButton description
 */
- (void)setLeftNaviItemWithButton:(UIButton *)leftButton;

/**
 *  @author qiaoqiao.wu
 *
 *  自定义右边的按钮
 *
 *  @param rightButton rightButton description
 */
- (void)setRightNaviItemWithButton:(UIButton *)rightButton;

#pragma mark --------------------PUSH POP--------------------
/**
 *  自定义Push 方法
 *
 *  @param viewController viewController description
 *  @param animated       animated description
 */

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

/**
 *  自定义Pop 方法
 *
 *  @param animated animated description
 */
-(void)popViewControllerAnimated:(BOOL)animated;

#pragma mark --------------------等待提示显示--------------------

/**
 *  显示动态指示页面,duration时间后消失
 *
 *  @param title    title description
 *  @param duration duration description
 */
-(void)showActivityIndicatorViewWithTitle:(NSString *)title
                                 duration:(NSTimeInterval )duration;


/**
 *  显示动态指示页面,不消失,需要手动调用
 *
 *  @param title title description
 */
-(void)showActivityIndicatorViewWithTitle:(NSString *)title;

/**
 *  消失动态指示页面
 */
-(void)hideActivityIndicatorView;

/**
 *加载失败,重新加载;\
 */
- (void)ifLoadFailTapToReload;
@end
