//
//  RenwuSureViewController.m
//  Publishingtask
//
//  Created by lanye on 13-12-6.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "RenwuSureViewController.h"
@interface RenwuSureViewController ()

@end

@implementation RenwuSureViewController

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
    self.backscroll.contentSize = CGSizeMake(320, 600);
    self.backview.layer.borderWidth = 0.5f;
    self.backview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"待选定任务"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
}
-(void)mleftBarBttonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)FinishButton:(id)sender {
    TaskSuessViewController *tasksuess = [[TaskSuessViewController alloc]init];
    [self.navigationController pushViewController:tasksuess animated:YES];
}

- (IBAction)ApplyButton:(id)sender {
    
    TaskViewController *task = [[TaskViewController alloc]init];
    [self.navigationController pushViewController:task animated:YES];
}
@end
