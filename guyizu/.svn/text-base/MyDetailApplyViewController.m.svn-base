//
//  MyDetailApplyViewController.m
//  MyApplying
//
//  Created by lanye on 13-12-5.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "MyDetailApplyViewController.h"
@interface MyDetailApplyViewController ()

@end

@implementation MyDetailApplyViewController

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
    
    self.backscroll.contentSize = CGSizeMake(320, 700);
    
    self.backview.layer.borderWidth = 0.5f;
    self.backview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.imagebackview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.imagebackview.layer.borderWidth = 0.5f;
    
    self.detailSegment = [[UISegmentedControl alloc]initWithItems:@[@"待选定",@"任务中",@"已结束"]];
    self.detailSegment.frame = CGRectMake(10, 15, 300, 29);
    self.detailSegment.segmentedControlStyle = UISegmentedControlStyleBar;
    self.detailSegment.selectedSegmentIndex = 0;
    [self.detailSegment setEnabled:NO forSegmentAtIndex:1];
    [self.detailSegment setEnabled:NO forSegmentAtIndex:2];
    self.detailSegment.tintColor = [UIColor colorWithRed:0/255.0 green:160/255.0 blue:211/255.0 alpha:1.0];
    [self.detailSegment addTarget:self action:@selector(segSelect:) forControlEvents:UIControlEventValueChanged];
    [self.backscroll addSubview:self.detailSegment];
    
}

-(void)segSelect:(id)sender
{
    UISegmentedControl *seg=(UISegmentedControl *)sender;
    NSInteger index = seg.selectedSegmentIndex;
    if (index == 0) {
        NSLog(@"00");
//        if (seg.superview.tag ==601) {
//            return;
//        }
    }
    if (index == 1) {
        NSLog(@"11");
//        MyApplyingViewController *myapply = [[MyApplyingViewController alloc]init];
//         if (seg.superview.tag ==601 || seg.superview.tag ==602)
//         {
//             [self.navigationController pushViewController:myapply animated:YES];
//         }
    }
    if (index == 2) {
        NSLog(@"22");
//        EndTaskViewController *endtask = [[EndTaskViewController alloc]init];
//        if (seg.superview.tag ==601) {
//            [self.navigationController pushViewController:endtask animated:YES];
//        }
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
