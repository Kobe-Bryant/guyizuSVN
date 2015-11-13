//
//  ReWardFirstViewController.m
//  guyizu
//
//  Created by 蓝叶软件 on 11/26/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import "ReWardFirstViewController.h"
#import "ReWardFenleiViewController.h"
#import "UserViewController.h"
#import "OtherViewController.h"
#import "LeveyTabBarController.h"
#import "YingzhengViewController.h"
#import "AppDelegate.h"
#import "DengluViewController.h"

@interface ReWardFirstViewController ()

@end

@implementation ReWardFirstViewController

@synthesize leveyTabBarController = _leveyTabBarController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //创建视图控制器
    
    //分类
    ReWardFenleiViewController *fenleiCtl = [[ReWardFenleiViewController alloc]init];
    fenleiCtl.isFenlei = YES;
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:fenleiCtl];

    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    fenleiCtl.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    

    //悬赏发布分类
    ReWardFenleiViewController *rewardSendCtl = [[ReWardFenleiViewController alloc]init];
    rewardSendCtl.isFenlei = NO;
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:rewardSendCtl];
    
    UIButton *leftbutton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton2 setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton2.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton2 addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    rewardSendCtl.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton2];
    

    
    //会员中心
    UserViewController *yonghuCtl = [[UserViewController alloc]initWithNibName:@"UserViewController" bundle:nil];
    nav4 = [[UINavigationController alloc]initWithRootViewController:yonghuCtl];
    
    UIButton *leftbutton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton3 setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton3.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton3 addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    yonghuCtl.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton3];

    
    otherCtl3 = [[OtherViewController alloc]init];
    
    //创建底层图片
    NSMutableDictionary *imgDic = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic setObject:[UIImage imageNamed:@"home.png"] forKey:@"Default"];
	[imgDic setObject:[UIImage imageNamed:@"home_click.png"] forKey:@"Highlighted"];
	[imgDic setObject:[UIImage imageNamed:@"home_click.png"] forKey:@"Seleted"];
    
    NSMutableDictionary *imgDic2 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic2 setObject:[UIImage imageNamed:@"sort.png"] forKey:@"Default"];
	[imgDic2 setObject:[UIImage imageNamed:@"sort_click.png"] forKey:@"Highlighted"];
	[imgDic2 setObject:[UIImage imageNamed:@"sort_click.png"] forKey:@"Seleted"];
    
    NSMutableDictionary *imgDic3 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic3 setObject:[UIImage imageNamed:@"iuuse.png"] forKey:@"Default"];
	[imgDic3 setObject:[UIImage imageNamed:@"iuuse_click.png"] forKey:@"Highlighted"];
	[imgDic3 setObject:[UIImage imageNamed:@"iuuse_click.png"] forKey:@"Seleted"];
    
    NSMutableDictionary *imgDic4 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic4 setObject:[UIImage imageNamed:@"member.png"] forKey:@"Default"];
	[imgDic4 setObject:[UIImage imageNamed:@"member_click.png"] forKey:@"Highlighted"];
	[imgDic4 setObject:[UIImage imageNamed:@"member_click.png"] forKey:@"Seleted"];
    
    NSArray *imgArr = [NSArray arrayWithObjects:imgDic, imgDic2, imgDic3, imgDic4, nil];
	NSArray *ctrlArr = [NSArray arrayWithObjects:otherCtl3, nav2, nav3, nav4, nil];
    
	_leveyTabBarController = [[LeveyTabBarController alloc] initWithViewControllers:ctrlArr imageArray:imgArr];

	[_leveyTabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"menu_bg.png"]];
	[_leveyTabBarController setTabBarTransparent:YES];
	[self.view addSubview:_leveyTabBarController.view];
    _leveyTabBarController.delegate = self;
    
    _leveyTabBarController.selectedIndex = 1;


    AppDelegate *homeApp = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (homeApp.isIos6) {
        
        [nav2.navigationBar setBackgroundImage:[UIImage imageNamed:@"123.png"] forBarMetrics:UIBarMetricsDefault];
        [nav3.navigationBar setBackgroundImage:[UIImage imageNamed:@"123.png"] forBarMetrics:UIBarMetricsDefault];
        [nav4.navigationBar setBackgroundImage:[UIImage imageNamed:@"123.png"] forBarMetrics:UIBarMetricsDefault];
    }else{
        [nav2.navigationBar setBackgroundImage:[UIImage imageNamed:@"111"] forBarMetrics:UIBarMetricsDefault];
        [nav3.navigationBar setBackgroundImage:[UIImage imageNamed:@"111"] forBarMetrics:UIBarMetricsDefault];
        [nav4.navigationBar setBackgroundImage:[UIImage imageNamed:@"111"] forBarMetrics:UIBarMetricsDefault];
    }

}

#pragma mark -

-(void)mleftBarBttonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)tabBarController:(LeveyTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
  
}

-(BOOL)tabBarController:(LeveyTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    if (viewController == otherCtl3) {
        [self.navigationController popViewControllerAnimated:YES];
        return NO;
    }else if (viewController == nav4){
        BOOL islog = [[NSUserDefaults standardUserDefaults] boolForKey:@"islogin"];
        if (islog) {
            return YES;
        }else{
            DengluViewController *dengluCtl = [[DengluViewController alloc]initWithNibName:@"DengluViewController" bundle:nil];
            UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:dengluCtl];
            [self presentViewController:nav animated:NO completion:nil];
            _leveyTabBarController.selectedIndex = 0;
            return NO;
        }
    }
    
    return YES;
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
