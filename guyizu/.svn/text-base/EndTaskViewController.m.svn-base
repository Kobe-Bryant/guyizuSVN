//
//  EndTaskViewController.m
//  MyApplying
//
//  Created by lanye on 13-12-5.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "EndTaskViewController.h"
@interface EndTaskViewController ()


@property (strong, nonatomic) IBOutlet UIView *endtaskbackview;
@property (strong, nonatomic) IBOutlet UIView *backview;

@end

@implementation EndTaskViewController

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
    
    self.endbackscroll.contentSize = CGSizeMake(320, 600);
    self.endtaskbackview.layer.borderWidth = 0.5f;
    self.endtaskbackview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.backview.layer.borderWidth = 0.5f;
    self.backview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.endSegment = [[UISegmentedControl alloc]initWithItems:@[@"待选定",@"任务中",@"已结束"]];
    self.endSegment.frame = CGRectMake(10, 15, 300, 29);
    self.endSegment.segmentedControlStyle = UISegmentedControlStyleBar;
    self.endSegment.selectedSegmentIndex = 2;
    [self.endSegment setEnabled:NO forSegmentAtIndex:0];
    [self.endSegment setEnabled:NO forSegmentAtIndex:1];
    self.endSegment.tintColor = [UIColor colorWithRed:0/255.0 green:160/255.0 blue:211/255.0 alpha:1.0];
    [self.endSegment addTarget:self action:@selector(segSelect:) forControlEvents:UIControlEventValueChanged];
    [self.endbackscroll addSubview:self.endSegment];
}

-(void)segSelect:(id)sender
{
    UISegmentedControl *seg=(UISegmentedControl *)sender;
   
    NSInteger index = seg.selectedSegmentIndex;
    if (index == 0) {
        NSLog(@"0");
//        MyDetailApplyViewController *mydetail = [[MyDetailApplyViewController alloc]init];
//        if (seg.superview.tag ==602) {
//            [self.navigationController pushViewController:mydetail animated:YES];
//        }
    }
    if (index == 1) {
        NSLog(@"1");
   //     MyApplyingViewController *myapply = [[MyApplyingViewController alloc]init];
//        if (seg.superview.tag ==601 || seg.superview.tag ==602)
//        {
//            [self.navigationController pushViewController:myapply animated:YES];
//        }
    }
    if (index == 2) {
        NSLog(@"2");
        
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

- (IBAction)submit:(id)sender {
    
    PendingtaskViewController *pend = [[PendingtaskViewController alloc]init];
    [self.navigationController pushViewController:pend animated:YES];
}
@end
