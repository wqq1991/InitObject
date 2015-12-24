//
//  HomePage_RootViewController.m
//  InitProduct
//
//  Created by Joe on 15/11/23.
//  Copyright © 2015年 Joe.Wu. All rights reserved.
//

#import "HomePage_RootViewController.h"
#import "LoginViewController.h"
#import "NSString+HandleAmount.h"

@interface HomePage_RootViewController ()

@end

@implementation HomePage_RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setRightNaviItemWithTitle:@"登录" imageName:nil];

    double a = 100234.0234;
    
    NSLog(@"result = %@",[NSString doubleToPointString:a afertPoint:2]);
    
    NSLog(@"result2 = %@",[NSString convertDigitalToCapital:0]);
}

- (void)rightItemTapped {
 
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kLoginViewViewNotification" object:nil];
}
@end
