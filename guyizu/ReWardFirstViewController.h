//
//  ReWardFirstViewController.h
//  guyizu
//
//  Created by 蓝叶软件 on 11/26/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeveyTabBarController.h"
#import "OtherViewController.h"

@interface ReWardFirstViewController : UIViewController<LeveyTabBarControllerDelegate>
{
    LeveyTabBarController *_leveyTabBarController;
    OtherViewController *otherCtl3;
    UINavigationController *nav4;
}

@property (nonatomic, strong) LeveyTabBarController *leveyTabBarController;


@end
