/********************************************************************
 文件名称 : BaseViewController.m 文件
 作   者 : WuQiaoqiao
 创建时间 : 15/3/10
 文件描述 : 类
 *********************************************************************/

#import "BaseViewController.h"
//#import "MBProgressHUD.h"

//#import "MobClick.h"

#define kLoadFailReloadNotification @"kLoadFailReloadNotificationKey"
#define kNavItemFontSize 15.0f
#define kNavItemFontColor [UIColor darkGrayColor]

@interface BaseViewController ()
<UIGestureRecognizerDelegate>
{
//    MBProgressHUD *hud;
}
@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
//        [MobClick beginLogPageView:self.navigationItem.title];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
//    [MobClick endLogPageView:self.navigationItem.title];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
//    self.view.backgroundColor = UIColorFromRGB(0xF4F4F7);
    
//    [MobClick event:self.title];
    
    /**
     *  @author qiaoqiao.wu, 15-05-18 17:05:59
     *
     *  增加手势返回响应
     *
     *  @param interactivePopGestureRecognizer interactivePopGestureRecognizer description
     *
     *  @return return value description
     */ 
}

#pragma mark --------------------Navigation设置--------------------

/**
 *  设置导航条的图片
 *
 *  @param backgroundImage icon图片
 */
-(void)setNavigationBarBackgroundImage:(UIImage *)backgroundImage
{
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage
                                                  forBarMetrics:UIBarMetricsDefault];
}

#pragma mark ---------------------按钮事件--------------------
- (void)leftItemTapped
{
    [self popViewControllerAnimated:YES];
}

- (void)rightItemTapped
{
    [self popViewControllerAnimated:YES];
    
}

/**
 *  设置左边按钮；title和图片目前只能二选一，title优先级高于图片
 *
 *  @param title     title description
 *  @param imageName imageName description
 */
- (void)setLeftNaviItemWithTitle:(NSString *)title imageName:(NSString *)imageName
{
    
    if (title && title.length > 0)
    {
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(leftItemTapped)];
        self.navigationItem.leftBarButtonItem = leftItem;
        
        /**
         *  @author qiaoqiao.wu, 15-05-18 17:05:54
         *
         *  修改leftItem字体大小和颜色
         */
        NSDictionary *textAttributes = @{
                           NSFontAttributeName: [UIFont systemFontOfSize:kNavItemFontSize],
                           NSForegroundColorAttributeName:kNavItemFontColor,
                           };
        
        [leftItem setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
        [leftItem setTitleTextAttributes:textAttributes forState:UIControlStateHighlighted];
        return;
        
    }else if (imageName)
    {
        UIImage *leftImage = [UIImage imageNamed:imageName];
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton setImage:leftImage forState:UIControlStateNormal];
        leftButton.frame = CGRectMake(0, 0, leftImage.size.width, leftImage.size.height);
        [leftButton addTarget:self action:@selector(leftItemTapped) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        self.navigationItem.leftBarButtonItem = leftItem;
        return;
    }
}

/**
 *  设置右边按钮；title和图片目前只能二选一，title优先级高于图片
 *
 *  @param title     title description
 *  @param imageName imageName description
 */
- (void)setRightNaviItemWithTitle:(NSString *)title imageName:(NSString *)imageName
{
    
    if (title && title.length > 0)
    {
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(rightItemTapped)];
        self.navigationItem.rightBarButtonItem = rightItem;
        
        /**
         *  @author qiaoqiao.wu, 15-05-18 17:05:17
         *
         *  修改rightItem字体大小和颜色
         */
        NSDictionary *textAttributes = @{
                                         NSFontAttributeName: [UIFont systemFontOfSize:kNavItemFontSize],
                                         NSForegroundColorAttributeName:kNavItemFontColor,
                                         };
        
        [rightItem setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
        [rightItem setTitleTextAttributes:textAttributes forState:UIControlStateHighlighted];
        
        return;
    }else if (imageName)
    {
        UIImage *rightImage = [UIImage imageNamed:imageName];
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightButton setImage:rightImage forState:UIControlStateNormal];
        rightButton.frame = CGRectMake(0, 0, rightImage.size.width, rightImage.size.height);
        [rightButton addTarget:self action:@selector(rightItemTapped) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
        self.navigationItem.rightBarButtonItem = rightItem;
        return;
    }
}

/**
 *  @author qiaoqiao.wu
 *
 *  自定义左边的按钮
 *
 *  @param leftButton leftButton description
 */
- (void)setLeftNaviItemWithButton:(UIButton *)leftButton
{
    [leftButton addTarget:self action:@selector(leftItemTapped) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}

/**
 *  @author qiaoqiao.wu
 *
 *  自定义右边的按钮
 *
 *  @param rightButton rightButton description
 */
- (void)setRightNaviItemWithButton:(UIButton *)rightButton
{
    [rightButton addTarget:self action:@selector(rightItemTapped) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

#pragma mark --------------------PUSH POP--------------------

/**
 *  自定义Push 方法
 *
 *  @param viewController viewController description
 *  @param animated       animated description
 */

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self.navigationController pushViewController:viewController animated:animated];
}

/**
 *  自定义Pop 方法
 *
 *  @param animated animated description
 */
-(void)popViewControllerAnimated:(BOOL)animated
{
    [self.navigationController popViewControllerAnimated:animated];
}

#pragma mark --------------------等待提示显示--------------------

/**
 *  显示动态指示页面,duration时间后消失
 *
 *  @param title    title description
 *  @param duration duration description
 */
-(void)showActivityIndicatorViewWithTitle:(NSString *)title
                                 duration:(NSTimeInterval )duration
{
//    [self hideActivityIndicatorView];
//    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.mode = MBProgressHUDModeText;
//    
//    //设置边框大小
//    hud.margin = 10.f;
//    
//    hud.userInteractionEnabled = NO;
//    hud.labelText = title;
//    hud.removeFromSuperViewOnHide = YES;
//    [hud hide:YES afterDelay:2.0];
    
//    JWIndicatorView *jwIndicatorView = [JWIndicatorView showJWIndicatorInView:self.view afterDelay:duration];
//    jwIndicatorView.labelText = title;
//    jwIndicatorView.labelFont = [UIFont fontOfPingFangSCOfSize:14.0f];
//    jwIndicatorView.backgroundColor = kThemeColor;
    
}

/**
 *  显示动态指示页面,不消失,需要手动调用
 *
 *  @param title title description
 */
-(void)showActivityIndicatorViewWithTitle:(NSString *)title
{
//    [self hideActivityIndicatorView];
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
//    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.mode = MBProgressHUDModeIndeterminate;
//    hud.labelText = title;
//    //设置边框大小
//    hud.margin = 10.f;
//    hud.removeFromSuperViewOnHide = YES;
}

/**
 *  消失动态指示页面
 */
-(void)hideActivityIndicatorView
{
//    NSArray *subArray = self.view.subviews;
//    for (NSInteger i = subArray.count-1; i >= 0; i--)
//    {
//        UIView *subView = [subArray objectAtIndex:i];
//        if ([subView isKindOfClass:[MBProgressHUD class]])
//        {
//            [subView removeFromSuperview];
//            subView = nil;
//        }
//    }
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

/**
 *加载失败,重新加载
 */
- (void)ifLoadFailTapToReload {
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
