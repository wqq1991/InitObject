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

    double a = 100234.02350;
    
    NSLog(@"result = %@",[NSString doubleToPointString:a effectiveLengthDecimal:2]);
    
    NSLog(@"result2 = %@",[NSString convertDigitalToCapital:0]);
    
    NSLog(@"result3 = %@",[NSString doubleToPointString:a fixedLengthDecimal:3]);
}

- (void)rightItemTapped {
 
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kLoginViewViewNotification" object:nil];
}
@end
