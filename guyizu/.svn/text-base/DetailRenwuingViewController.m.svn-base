//
//  DetailRenwuingViewController.m
//  Publishingtask
//
//  Created by lanye on 13-12-6.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "DetailRenwuingViewController.h"
#import "AppDelegate.h"
@interface DetailRenwuingViewController ()

@end

@implementation DetailRenwuingViewController

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
    
    selecttableview = [[UITableView alloc]initWithFrame:CGRectMake(10, 47, 300, 124.5) style:UITableViewStyleGrouped];
    selecttableview.delegate =self;
    selecttableview.dataSource = self;
    selecttableview.scrollEnabled = NO;
    [self.backscroll addSubview:selecttableview];
    
    applytableview = [[UITableView alloc]initWithFrame:CGRectMake(10, 216, 300, 498) style:UITableViewStyleGrouped];
    applytableview.delegate =self;
    applytableview.dataSource = self;
    applytableview.scrollEnabled = NO;
    applytableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.backscroll addSubview:applytableview];
    
    self.renwuSegment = [[UISegmentedControl alloc]initWithItems:@[@"待选定",@"任务中",@"已结束"]];
    self.renwuSegment.frame = CGRectMake(10, 15, 300, 29);
    self.renwuSegment.selectedSegmentIndex = 1;
    [self.renwuSegment setEnabled:NO forSegmentAtIndex:0];
    [self.renwuSegment setEnabled:NO forSegmentAtIndex:2];
    self.renwuSegment.tintColor = [UIColor colorWithRed:0/255.0 green:160/255.0 blue:211/255.0 alpha:1.0];
    [self.renwuSegment addTarget:self action:@selector(segSelect:) forControlEvents:UIControlEventValueChanged];
    [self.backscroll addSubview:self.renwuSegment];
    
    AppDelegate *homeApp = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (homeApp.isIos6) {
        UIView *backView = [[UIView alloc]init];
        [applytableview setBackgroundView:backView];
        [applytableview setBackgroundColor:[UIColor clearColor]];
        
        UIView *backView1 = [[UIView alloc]init];
        [selecttableview setBackgroundView:backView1];
        [selecttableview setBackgroundColor:[UIColor clearColor]];
        self.renwuSegment.segmentedControlStyle = UISegmentedControlStyleBar;
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
    if (tableView ==applytableview) {
        return 0.5;
    }
    return 10.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView ==selecttableview) {
        return 115.0;
    }
    return 100.0;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView ==selecttableview) {
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
    if (tableView == selecttableview) {
        selectingcell *selectingcell = [selecttableview dequeueReusableCellWithIdentifier:@"selectingcell"];
        if (selectingcell == nil) {
            selectingcell =[[[NSBundle mainBundle]loadNibNamed:@"selectingcell" owner:self options:nil]lastObject];
        }
        selectingcell.selectionStyle = UITableViewCellSelectionStyleGray;//设置点击颜色为灰色
        selectingcell.selectedBackgroundView.frame = CGRectMake(0, 0, 300, 120);//背景颜色的范围
        selectingcell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 去掉圆角边
        selectingcell.imagebackview.layer.borderWidth =0.5f;
        selectingcell.imagebackview.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        selectingcell.layer.borderWidth =0.5f;
        selectingcell.layer.borderColor = [UIColor lightGrayColor].CGColor;
        return selectingcell;
    }
    if (tableView == applytableview) {
        detailapplyingcell *detailapplyingcell = [applytableview dequeueReusableCellWithIdentifier:@"detailapplyingcell"];
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
        //detailapplyingcell.selectionStyle = UITableViewCellSelectionStyleNone;//使点击cell的单元格不变颜色
         detailapplyingcell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 去掉圆角边
        detailapplyingcell.selectionStyle = UITableViewCellSelectionStyleGray;//设置点击颜色为灰色
        detailapplyingcell.selectedBackgroundView.frame = CGRectMake(0, 0, 300, 120);//背景颜色的范围
        [detailapplyingcell.imageView setContentMode:UIViewContentModeScaleAspectFit];
        
               if (indexPath.row ==0) {
                detailapplyingcell.bidimage.image =[UIImage imageNamed:@"member_r39_c3.png"];
                }else{
                    detailapplyingcell.bidimage.image = [UIImage imageNamed:@"member_r37_c11.png"];}
        
        
        return detailapplyingcell;
    }
    
    UITableViewCell *cells =nil;
    return cells;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (tableView ==applytableview) {
        if (indexPath.row == 0) {
            RenwuDetailViewController *renwudetail = [[RenwuDetailViewController alloc]init];
            [self.navigationController pushViewController:renwudetail animated:YES];
        }
      
    }
  
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
