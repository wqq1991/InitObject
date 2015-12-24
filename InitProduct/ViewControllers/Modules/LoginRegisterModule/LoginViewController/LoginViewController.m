//
//  LoginViewController.m
//  InitProduct
//
//  Created by Joe on 15/11/23.
//  Copyright © 2015年 Joe.Wu. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setLeftNaviItemWithTitle:@"取消" imageName:nil];
}

- (void)leftItemTapped {

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"RegisterViewControllerId"]) {
        
        RegisterViewController *registerVC = segue.destinationViewController;
        registerVC.title = @"注册啊";
    } 
}

@end
