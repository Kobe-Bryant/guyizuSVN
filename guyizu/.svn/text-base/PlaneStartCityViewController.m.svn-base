//
//  PlaneStartCityViewController.m
//  谷蚁族
//
//  Created by Macsyf on 13-12-30.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "PlaneStartCityViewController.h"

@interface PlaneStartCityViewController ()

@end

@implementation PlaneStartCityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)returnaction
{[[NSUserDefaults standardUserDefaults] objectForKey:@"uid"];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    self.navigationController.navigationBar.titleTextAttributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20],NSFontAttributeName, nil];
    self.title=@"出发城市";
    UIButton* button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(0, 0, 11, 20);
    [button setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(returnaction) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:button] animated:YES];
    _viewone.layer.cornerRadius=5;
    _lableone.backgroundColor=[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    _viewtwo.layer.borderColor=[UIColor lightGrayColor].CGColor;
    _viewtwo.layer.borderWidth=0.5f;
    _viewtwo.backgroundColor=[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    _lableone.layer.borderWidth=0.5f;
    _lableone.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonone:(UIButton *)sender {
}

- (IBAction)buttontwo:(UIButton *)sender {
}
@end
