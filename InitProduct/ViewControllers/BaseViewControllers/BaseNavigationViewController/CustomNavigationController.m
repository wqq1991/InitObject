/********************************************************************
 文件名称 : BaseNavigationViewController.m 文件
 作   者 : WuQiaoqiao
 创建时间 : 15/4/21
 文件描述 : 类
 *********************************************************************/

#import "CustomNavigationController.h"

@interface CustomNavigationController ()
<UINavigationControllerDelegate,UIGestureRecognizerDelegate>
@end

@implementation CustomNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.interactivePopGestureRecognizer.delegate = self;
    self.delegate = self;
    
}

- (void)dealloc {
 
    self.interactivePopGestureRecognizer.delegate = nil;
    self.delegate = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
        self.interactivePopGestureRecognizer.enabled = NO;
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UINavigationControllerDelegate methods
- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{

    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {

        if ([navigationController.viewControllers count] == 1) {

            navigationController.interactivePopGestureRecognizer.enabled = NO;
        
        } else {

            navigationController.interactivePopGestureRecognizer.enabled = YES;
        }
    }
}

@end
