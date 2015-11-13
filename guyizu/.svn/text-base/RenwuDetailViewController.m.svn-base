//
//  RenwuDetailViewController.m
//  Publishingtask
//
//  Created by lanye on 13-12-6.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "RenwuDetailViewController.h"
@interface RenwuDetailViewController ()

@end

@implementation RenwuDetailViewController

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
    //构建nav
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"待选定任务"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    self.backscroll.contentSize = CGSizeMake(320, 600);
    self.backview.layer.borderWidth = 0.5f;
    self.backview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.DerenwuSegment = [[UISegmentedControl alloc]initWithItems:@[@"待选定",@"任务中",@"已结束"]];
    self.DerenwuSegment.frame = CGRectMake(10, 15, 300, 29);
    self.DerenwuSegment.segmentedControlStyle = UISegmentedControlStyleBar;
    self.DerenwuSegment.selectedSegmentIndex = 1;
    [self.DerenwuSegment setEnabled:NO forSegmentAtIndex:0];
    [self.DerenwuSegment setEnabled:NO forSegmentAtIndex:2];
    self.DerenwuSegment.tintColor = [UIColor colorWithRed:0/255.0 green:160/255.0 blue:211/255.0 alpha:1.0];
    [self.DerenwuSegment addTarget:self action:@selector(segSelect:) forControlEvents:UIControlEventValueChanged];
    [self.backscroll addSubview:self.DerenwuSegment];
    
}

-(void)segSelect:(id)sender
{
    UISegmentedControl *seg=(UISegmentedControl *)sender;
    NSInteger index = seg.selectedSegmentIndex;
    if (index == 0) {
        NSLog(@"00");
    }
    if (index == 1) {
        NSLog(@"11");
        
    }
    if (index == 2) {
        NSLog(@"22");
    }
    
}

#pragma mark -
#pragma mark leftButtonClick

-(void)mleftBarBttonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
