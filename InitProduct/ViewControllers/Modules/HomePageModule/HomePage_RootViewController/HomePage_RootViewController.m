//
//  HomePage_RootViewController.m
//  InitProduct
//
//  Created by Joe on 15/11/23.
//  Copyright © 2015年 Joe.Wu. All rights reserved.
//

#import "HomePage_RootViewController.h"
#import "LoginViewController.h"

@interface HomePage_RootViewController ()

@end

@implementation HomePage_RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setRightNaviItemWithTitle:@"登录" imageName:nil];

}

- (void)rightItemTapped {
 
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kLoginViewViewNotification" object:nil];
}
@end
