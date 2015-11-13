//
//  ApplyingViewController.m
//  Publishingtask
//
//  Created by lanye on 13-12-3.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "ApplyingViewController.h"
#import "ReWardFenleiViewController.h"
#import "AppDelegate.h"
#import "DownloadTaskxuanshang.h"
#import "UIImageView+WebCache.h"
@interface ApplyingViewController ()

@end

@implementation ApplyingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _arr= [[NSMutableArray alloc]initWithCapacity:0];
        _nameArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    _status=1;
    _uid=[[[NSUserDefaults standardUserDefaults]objectForKey:@"uid"]intValue];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DownloadOver) name:@"xuanshangDownloadOver" object:nil];
    [[DownloadTaskxuanshang shareDownload]startDownload:_uid status:_status];
    
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

    self.backscroll.contentSize = CGSizeMake(320, 170*[_nameArr count]+500);
    
    [self.segmented addTarget:self action:@selector(select:) forControlEvents:UIControlEventValueChanged];
   
    applyingtableview = [[UITableView alloc]initWithFrame:CGRectMake(10, 55, 300,170*[_nameArr count]) style:UITableViewStyleGrouped];
    applyingtableview.delegate =self;
    applyingtableview.dataSource = self;
    applyingtableview.sectionHeaderHeight = 5.0;
    applyingtableview.sectionFooterHeight = 5.0;
    applyingtableview.scrollEnabled = NO;
    applyingtableview.showsVerticalScrollIndicator = NO;
    [self.backscroll addSubview:applyingtableview];
    
    selectingtableview = [[UITableView alloc]initWithFrame:CGRectMake(10, 55 +170*[_nameArr count], 300, 300) style:UITableViewStyleGrouped];
    selectingtableview.delegate =self;
    selectingtableview.dataSource = self;
    selectingtableview.scrollEnabled = NO;
    selectingtableview.sectionHeaderHeight = 5.0;
    selectingtableview.sectionFooterHeight = 5.0;
    [self.backscroll addSubview:selectingtableview];
    
    renwuingtableview = [[UITableView alloc]initWithFrame:CGRectMake(10, 55, 300, 300) style:UITableViewStyleGrouped];
    renwuingtableview.delegate =self;
    renwuingtableview.dataSource = self;
    renwuingtableview.scrollEnabled = NO;
    renwuingtableview.sectionHeaderHeight = 5.0;
    renwuingtableview.sectionFooterHeight = 5.0;
    renwuingtableview.hidden = YES;
    [self.backscroll addSubview:renwuingtableview];
    
    AppDelegate *homeApp = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (homeApp.isIos6) {
        UIView *backView = [[UIView alloc]init];
        [applyingtableview setBackgroundView:backView];
        [applyingtableview setBackgroundColor:[UIColor clearColor]];
        
        UIView *backView1 = [[UIView alloc]init];
        [selectingtableview setBackgroundView:backView1];
        [selectingtableview setBackgroundColor:[UIColor clearColor]];
        
        UIView *backView2 = [[UIView alloc]init];
        [renwuingtableview setBackgroundView:backView2];
        [renwuingtableview setBackgroundColor:[UIColor clearColor]];
    }
    
    
}

#pragma mark 通知
-(void)DownloadOver
{
    NSMutableArray *arr1 = [DownloadTaskxuanshang shareDownload].mutableArry ;
    for (Taskxuanshang *thisModel in arr1) {
        [_arr addObject:thisModel];
        [_nameArr addObject:thisModel.name];
    }
    [applyingtableview reloadData];
}

#pragma mark -
#pragma mark leftButtonClick

-(void)mleftBarBttonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -

-(void)select:(id)sender
{
    UISegmentedControl *seg=(UISegmentedControl *)sender;
    NSInteger indexclick = seg.selectedSegmentIndex;
    if (indexclick ==0) {
     
        renwuingtableview.hidden = YES;
        applyingtableview.hidden = NO;
        selectingtableview.hidden = NO;

    }
     if (indexclick ==1) {
         renwuingtableview.hidden = NO;
         applyingtableview.hidden = YES;
         selectingtableview.hidden = YES;

    }
    if (indexclick == 2) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"页面建设中" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == applyingtableview) {
         return 5.0;
    }
    if (tableView == renwuingtableview) {
        return 5.0;
    }
    return 10.0;
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView ==applyingtableview) {
        return 160.0;
    }
    return 115.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   
    if (tableView ==applyingtableview) {
        return [_nameArr count];
    }
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == applyingtableview) {
        applyingcell *applyingcell = [applyingtableview dequeueReusableCellWithIdentifier:@"applyingcell"];
        if (applyingcell == nil) {
            applyingcell = [[[NSBundle mainBundle]loadNibNamed:@"applyingcell" owner:self options:nil]lastObject];
            applyingcell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 去掉圆角边框
            applyingcell.selectionStyle = UITableViewCellSelectionStyleGray;//使点击cell的单元格不变颜色
            applyingcell.layer.borderWidth =0.5f;
            applyingcell.layer.borderColor = [UIColor lightGrayColor].CGColor;
            
            applyingcell.imagebackview.layer.borderWidth = 0.5f;
            applyingcell.imagebackview.layer.borderColor = [UIColor lightGrayColor].CGColor;
            
            applyingcell.xiugai.layer.borderWidth = 0.5f;
            applyingcell.xiugai.layer.borderColor = [UIColor lightGrayColor].CGColor;
            
            applyingcell.cancel.layer.borderWidth = 0.5f;
            applyingcell.cancel.layer.borderColor = [UIColor lightGrayColor].CGColor;
            
            applyingcell.dele.layer.borderWidth = 0.5f;
            applyingcell.dele.layer.borderColor = [UIColor lightGrayColor].CGColor;
            [applyingcell.dele addTarget:self action:@selector(alert) forControlEvents:UIControlEventTouchUpInside];
            [applyingcell.xiugai addTarget:self action:@selector(xiugai) forControlEvents:UIControlEventTouchUpInside];
        }
        
        Taskxuanshang *thisModel = [_arr objectAtIndex:indexPath.section];
        applyingcell.finish_time.text = thisModel.finish_time;
        applyingcell.name.text = thisModel.name;
        applyingcell.c_price.text = thisModel.c_price;
        
        return applyingcell;
    }
    if (tableView == selectingtableview) {
        selectingcell *selectingcell = [selectingtableview dequeueReusableCellWithIdentifier:@"selectingcell"];
        if (selectingcell == nil) {
            selectingcell =[[[NSBundle mainBundle]loadNibNamed:@"selectingcell" owner:self options:nil]lastObject];
        }
       // selectingcell.selectionStyle = UITableViewCellSelectionStyleNone;//使点击cell的单元格不变颜色
        selectingcell.backgroundColor = [UIColor whiteColor];//设置背景颜色为白色
        selectingcell.selectionStyle = UITableViewCellSelectionStyleGray;//设置点击颜色为灰色
        selectingcell.selectedBackgroundView.frame = CGRectMake(0, 0, 300, 120);//背景颜色的范围
        selectingcell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 去掉圆角边框
        selectingcell.imagebackview.layer.borderWidth = 0.5f;
        selectingcell.imagebackview.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        selectingcell.layer.borderWidth =0.5f;
        selectingcell.layer.borderColor = [UIColor lightGrayColor].CGColor;
        return selectingcell;
    }
    
    if (tableView == renwuingtableview) {
        RenwuingCell *renwuingcell = [renwuingtableview dequeueReusableCellWithIdentifier:@"renwuingcell"];
        if (renwuingcell == nil) {
            renwuingcell =[[[NSBundle mainBundle]loadNibNamed:@"RenwuingCell" owner:self options:nil]lastObject];
        }
        if (indexPath.section == 0) {
            renwuingcell.laterlable.hidden = NO;
        }else{
            renwuingcell.forelable.hidden = NO;
         renwuingcell.renwulable.text = @"完成，待确认";
            
            renwuingcell.backgroundColor = [UIColor whiteColor];//设置背景颜色为白色
            renwuingcell.selectionStyle = UITableViewCellSelectionStyleGray;//设置点击颜色为灰色
            renwuingcell.selectedBackgroundView.frame = CGRectMake(0, 0, 300, 120);//背景颜色的范围
            renwuingcell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 去掉圆角边框
            renwuingcell.imagebackview.layer.borderWidth = 0.5f;
            renwuingcell.imagebackview.layer.borderColor = [UIColor lightGrayColor].CGColor;
            
            //renwuingcell.selectionStyle = UITableViewCellSelectionStyleNone;//使点击cell的单元格不变颜色
            renwuingcell.layer.borderWidth =0.5f;
            renwuingcell.layer.borderColor = [UIColor lightGrayColor].CGColor;
        }
       
        return renwuingcell;
    }
    UITableViewCell *cells =nil;
    return cells;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (tableView == selectingtableview) {
        DetailApplyingViewController *detailapplying = [[DetailApplyingViewController alloc]init];
        [self.navigationController pushViewController:detailapplying animated:YES];
    }
//    if (tableView == applyingtableview) {
//        DetailApplyingViewController *detailapplying = [[DetailApplyingViewController alloc]init];
//        [self.navigationController pushViewController:detailapplying animated:YES];
//    }
    
    if (tableView == renwuingtableview) {
        if (indexPath.section == 0) {
            DetailRenwuingViewController *detailrenwu = [[DetailRenwuingViewController alloc]init];
            [self.navigationController pushViewController:detailrenwu animated:YES];
        }else{
            RenwuSureViewController *renwusure = [[RenwuSureViewController alloc]init];
            [self.navigationController pushViewController:renwusure animated:YES];
        
        }
       
    }
}

-(void)alert
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"是否删除" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [alert show];
}
-(void)xiugai
{
    rewardCtl = [[ReWardFenleiViewController alloc]init];
    
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(rewardCtlLeftButtonClick) forControlEvents:UIControlEventTouchUpInside];
     rewardCtl.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    [self.navigationController pushViewController:rewardCtl animated:YES];
}

-(void)rewardCtlLeftButtonClick{
    [rewardCtl.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
