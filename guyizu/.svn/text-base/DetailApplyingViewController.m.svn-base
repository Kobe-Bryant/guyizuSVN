//
//  DetailApplyingViewController.m
//  Publishingtask
//
//  Created by lanye on 13-12-3.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "DetailApplyingViewController.h"
#import "AppDelegate.h"
@interface DetailApplyingViewController ()

@end

@implementation DetailApplyingViewController

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
    [customLab setText:@"我发布的任务"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    self.backscroll.contentSize = CGSizeMake(320, 650);
    self.sheetview.layer.borderWidth = 0.5f;
    self.sheetview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    selectingtableview = [[UITableView alloc]initWithFrame:CGRectMake(10, 47, 300, 124.5) style:UITableViewStyleGrouped];
    selectingtableview.delegate =self;
    selectingtableview.dataSource = self;
    selectingtableview.scrollEnabled = NO;
    [self.backscroll addSubview:selectingtableview];
    
    applicantstableview = [[UITableView alloc]initWithFrame:CGRectMake(10, 216, 300, 498) style:UITableViewStyleGrouped];
    applicantstableview.delegate =self;
    applicantstableview.dataSource = self;
    applicantstableview.scrollEnabled = NO;
     applicantstableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.backscroll addSubview:applicantstableview];
    
    self.detailSegment = [[UISegmentedControl alloc]initWithItems:@[@"待选定",@"任务中",@"已结束"]];
    self.detailSegment.frame = CGRectMake(10, 15, 300, 29);
    self.detailSegment.selectedSegmentIndex = 0;
    [self.detailSegment setEnabled:NO forSegmentAtIndex:1];
    [self.detailSegment setEnabled:NO forSegmentAtIndex:2];
    self.detailSegment.tintColor = [UIColor colorWithRed:0/255.0 green:160/255.0 blue:211/255.0 alpha:1.0];
    [self.detailSegment addTarget:self action:@selector(segSelect:) forControlEvents:UIControlEventValueChanged];
    [self.backscroll addSubview:self.detailSegment];
    
    AppDelegate *homeApp = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (homeApp.isIos6) {
        UIView *backView = [[UIView alloc]init];
        [selectingtableview setBackgroundView:backView];
        [selectingtableview setBackgroundColor:[UIColor clearColor]];
        
        UIView *backView1 = [[UIView alloc]init];
        [applicantstableview setBackgroundView:backView1];
        [applicantstableview setBackgroundColor:[UIColor clearColor]];
       self.detailSegment.segmentedControlStyle = UISegmentedControlStyleBar;
    }
    
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

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView ==applicantstableview) {
        return 0.5;
    }
    return 10.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView ==selectingtableview) {
        return 115.0;
    }
    return 100.0;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    if (tableView ==selectingtableview) {
        return 1;
    }
    return 4;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == selectingtableview) {
        selectingcell *selectingcell = [selectingtableview dequeueReusableCellWithIdentifier:@"selectingcell"];
        if (selectingcell == nil) {
            selectingcell =[[[NSBundle mainBundle]loadNibNamed:@"selectingcell" owner:self options:nil]lastObject];
        }
        
        selectingcell.backgroundColor = [UIColor whiteColor];//设置背景颜色为白色
        selectingcell.selectionStyle = UITableViewCellSelectionStyleGray;//设置点击颜色为灰色
        selectingcell.selectedBackgroundView.frame = CGRectMake(0, 0, 300, 120);//背景颜色的范围
        selectingcell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 去掉圆角边框

        selectingcell.imagebackview.layer.borderWidth =0.5f;
        selectingcell.imagebackview.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        selectingcell.layer.borderWidth =0.5f;
        selectingcell.layer.borderColor = [UIColor lightGrayColor].CGColor;
        return selectingcell;
    }
    if (tableView == applicantstableview) {
    detailapplyingcell *detailapplyingcell = [applicantstableview dequeueReusableCellWithIdentifier:@"detailapplyingcell"];
        
        if (detailapplyingcell == nil) {
            detailapplyingcell =[[[NSBundle mainBundle]loadNibNamed:@"detailapplyingcell" owner:self options:nil]lastObject];
            
            UIView *blackView3 = [[UIView alloc]initWithFrame:CGRectMake(0, detailapplyingcell.frame.size.height-0.5 , 300, 0.5)];
            blackView3.backgroundColor = [UIColor lightGrayColor];
            [detailapplyingcell addSubview:blackView3];
            
            UIView *blackView1 = [[UIView alloc]initWithFrame:CGRectMake(0,detailapplyingcell.frame.origin.y,0.5 , 132)];
            blackView1.backgroundColor = [UIColor lightGrayColor];
            [detailapplyingcell addSubview:blackView1];
            
            UIView *blackView2 = [[UIView alloc]initWithFrame:CGRectMake(299,detailapplyingcell.frame.origin.y,0.5 , 132)];
            blackView2.backgroundColor = [UIColor lightGrayColor];
            [detailapplyingcell addSubview:blackView2];
        }
       // detailapplyingcell.selectionStyle = UITableViewCellSelectionStyleNone;//使点击cell的单元格不变颜色
        [detailapplyingcell.imageView setContentMode:UIViewContentModeScaleAspectFit];//适应图片的大小
        
        detailapplyingcell.backgroundColor = [UIColor whiteColor];//设置背景颜色为白色
        detailapplyingcell.selectionStyle = UITableViewCellSelectionStyleGray;//设置点击颜色为灰色
        detailapplyingcell.selectedBackgroundView.frame = CGRectMake(0, 0, 300, 120);//背景颜色的范围
        detailapplyingcell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 去掉圆角边框 selectingcell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 去掉圆角边框
//        if (indexPath.row ==0) {
//            detailapplyingcell.bidimage.image =[UIImage imageNamed:@"member_r39_c3.png"];
//        }else{
//            detailapplyingcell.bidimage.image = [UIImage imageNamed:@"member_r37_c11.png"];}
       
        
        return detailapplyingcell;
    }

    UITableViewCell *cells =nil;
    return cells;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (tableView == applicantstableview) {
        PersonDetailViewController *persondetail = [[PersonDetailViewController alloc]init];
        [self.navigationController pushViewController:persondetail animated:YES];
    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
