//
//  RootTabBarViewController.m
//  InitProduct
//
//  Created by Joe on 15/11/23.
//  Copyright © 2015年 Joe.Wu. All rights reserved.
//

#import "RootTabBarViewController.h"

#pragma mark - RootViewControllers - 
#import "LoginViewController.h"
#import "HomePage_RootViewController.h"
#import "Product_RootViewController.h"
#import "MyWealth_RootViewController.h"
#import "More_RootViewController.h"
#import "CustomNavigationController.h"


#define Image_OffSet_Y 3
#define Title_OffSet_Y 5
#define SliderViewHeight 49

@interface RootTabBarViewController ()
<UITabBarControllerDelegate>
{
     UIImageView *sliderBgView;
}
@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    加载视图控制器
    [self setupViewControllers];
    
    [self setupItems];
    
    //数据初始化
    [self setupDatas];
    
    //初始化所有的通知
    [self setupNotifications];
    
    //    添加滑块视图
    [self addSliderView];
}

// 初始化所有的数据
- (void)setupDatas {
    
    self.currentIndex = self.selectedIndex;
    self.delegate = self;
    
}

//初始化所有的通知
- (void)setupNotifications {
    
    //登录页面显示通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginAction:) name:@"kLoginViewViewNotification" object:nil];
    
}

//加载视图控制器
- (void)setupViewControllers {
    
    CustomNavigationController *homeModuleNav = [[UIStoryboard storyboardWithName:@"HomePageModule" bundle:nil] instantiateViewControllerWithIdentifier:@"HomePageModuleNav"];
    
    CustomNavigationController *ProductModuleNav = [[UIStoryboard storyboardWithName:@"ProductModule" bundle:nil] instantiateViewControllerWithIdentifier:@"ProductModuleNav"];
    
     CustomNavigationController *MyWealthModuleNav = [[UIStoryboard storyboardWithName:@"MyWealthModule" bundle:nil] instantiateViewControllerWithIdentifier:@"MyWealthModuleNav"];
    
     CustomNavigationController *MoreModuleNav = [[UIStoryboard storyboardWithName:@"MoreModule" bundle:nil] instantiateViewControllerWithIdentifier:@"MoreModuleNav"];
    
    [self setViewControllers:@[homeModuleNav,ProductModuleNav,MyWealthModuleNav,MoreModuleNav]];
    
    
}

//    设置 UITabbar 的样式.
- (void)setupItems
{
    self.tabBar.translucent = NO; // 设置UITabbar 不透明
    
    NSArray *tabBarItemImages = @[@"first", @"second", @"third", @"four"];  //    图片名称数组
    
    
    NSArray *tabBarItemTitles = @[@"精品推荐", @"理财产品", @"我的财富", @"更多信息"];  //    item 名称数组
    NSInteger index = 0;
    
    //遍历tab的所有items 分别设置它们的属性.
    for (UITabBarItem *item in [[self tabBar] items]) {
        
        UIImage *selectedimage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                       [tabBarItemImages objectAtIndex:index] ]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UIImage *unselectedimage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                         [tabBarItemImages objectAtIndex:index]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setImage:unselectedimage];            //设置item未选中的背景图片.
        [item setSelectedImage:selectedimage];      //设置item选中时的背景图片.
        
        //        [item setImageInsets:UIEdgeInsetsMake(-Image_OffSet_Y, 0, Image_OffSet_Y, 0)]; //设置item背景图片的偏移.
        
        //        [item setTitlePositionAdjustment:UIOffsetMake(0, -Title_OffSet_Y)];
        
        //        设置未选中时的item字体大小和颜色
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]}
                            forState:UIControlStateNormal];
        //        设置选中时的item字体大小和颜色
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}
                            forState:UIControlStateSelected];
        
        [item setTitle:[tabBarItemTitles objectAtIndex:index]];
        
        index++;
    }
}


#pragma mark --------- 添加滑块 和 背景 -----------

- (void)addSliderView {
    
    NSUInteger count = [self.tabBar.items count];
    
    CGSize tabBarSize = self.tabBar.frame.size;
    tabBarSize.height = SliderViewHeight;
    
    UIImageView *sliderView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.tabBar.frame.size.height - SliderViewHeight, tabBarSize.width / count, tabBarSize.height)];
    sliderView.backgroundColor = [UIColor purpleColor];
    
//    [self.tabBar insertSubview:sliderView belowSubview:(UIView *)[self.tabBar.items firstObject]];
    [self.tabBar insertSubview:sliderView atIndex:0];
    
    sliderBgView = sliderView;
    
    CGRect tabBarFrame = self.tabBar.frame;
    tabBarFrame.size.height = SliderViewHeight;
    tabBarFrame.origin.y = self.tabBar.frame.size.height - SliderViewHeight;
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:tabBarFrame];
//    bgImageView.backgroundColor = [UIColor grayColor];
    [self.tabBar insertSubview:bgImageView belowSubview:sliderView];
    
}

#pragma mark --------- 滑块的动画处理 -----------
- (void)moveSliderViewAndAnimation:(NSUInteger )currentIndex
                     selectedIndex:(NSUInteger)selectedIndex {
    
    if (currentIndex != selectedIndex && sliderBgView) {
        
        CGRect rect = sliderBgView.frame;
        rect.size.height = SliderViewHeight;
        
        [UIView animateWithDuration:0.35f
                              delay:0
             usingSpringWithDamping:0.8f
              initialSpringVelocity:0
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
             
            sliderBgView.frame = CGRectMake( rect.size.width * selectedIndex, self.tabBar.frame.size.height - SliderViewHeight, rect.size.width, rect.size.height);
            
        } completion:nil];
         
    }
}


// ITEM 切换的时候调用的方法
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    NSUInteger tempIndex = 0;
    
    for (UITabBarItem *tempItem in self.tabBar.items) {
        
        if (item == tempItem) {
            
            self.selectedIndex = tempIndex;
            
            self.currentIndex = tempIndex;
            
        }
        tempIndex ++;
    }
    
//    CATransition* animation = [CATransition animation];
//    [animation setDuration:0.5f];
//    [animation setType:kCATransitionFade];
//    [animation setSubtype:kCATransitionFromRight];
//    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
//    [[self.view layer]addAnimation:animation forKey:@"switchView"];
    
}

//当设置SelectedIndex 的时候执行.
- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    
    [self moveSliderViewAndAnimation:self.currentIndex
                       selectedIndex:self.selectedIndex];
    
    self.currentIndex = selectedIndex;
}

#pragma mark ------  登录事件  --------
- (void)loginAction:(NSNotification *)notification {
    
    CustomNavigationController *LoginViewModuleNav = [[UIStoryboard storyboardWithName:@"LoginModule" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginModule"];

    [self presentViewController:LoginViewModuleNav animated:YES completion:nil];
}

@end
