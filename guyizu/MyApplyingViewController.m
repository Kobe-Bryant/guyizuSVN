//
//  MyApplyingViewController.m
//  MyApplying
//
//  Created by lanye on 13-12-5.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "MyApplyingViewController.h"
#import "AppDelegate.h"
#import "DownloadMyApply.h"
#import "UIImageView+WebCache.h"
@interface MyApplyingViewController ()

@end
@implementation MyApplyingViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _arry = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DownloadOver) name:@"myapplyDownloadOver" object:nil];
    [[DownloadMyApply shareDownload]startDownload];
    //构建nav
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"我的应征"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;

    self.backscroll.contentSize = CGSizeMake(320, 600);

    _applyingtable = [[UITableView alloc]initWithFrame:CGRectMake(10, 55, 300, 330) style:UITableViewStyleGrouped];
    _applyingtable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _applyingtable.delegate =self;
    _applyingtable.dataSource = self;
    _applyingtable.scrollEnabled = NO;
    _applyingtable.sectionFooterHeight = 5.0;
    _applyingtable.sectionHeaderHeight = 5.0;
    [self.backscroll addSubview:_applyingtable];
    
    _taskingtable = [[UITableView alloc]initWithFrame:CGRectMake(10, 55, 300, 330) style:UITableViewStyleGrouped];
    _taskingtable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _taskingtable.delegate =self;
    _taskingtable.dataSource = self;
    _taskingtable.hidden = YES;
    _taskingtable.scrollEnabled = NO;
    _taskingtable.sectionFooterHeight = 5.0;
    _taskingtable.sectionHeaderHeight = 5.0;
    [self.backscroll addSubview:_taskingtable];
    _endedtable = [[UITableView alloc]initWithFrame:CGRectMake(10, 55, 300, 330) style:UITableViewStyleGrouped];
     _endedtable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _endedtable.delegate =self;
    _endedtable.dataSource = self;
    _endedtable.hidden = YES;
    _endedtable.scrollEnabled = NO;
    _endedtable.sectionFooterHeight = 5.0;
    _endedtable.sectionHeaderHeight = 5.0;
    [self.backscroll addSubview:_endedtable];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"待选定",@"任务中",@"已结束"]];
    segment.segmentedControlStyle = UISegmentedControlStyleBar;
    segment.frame = CGRectMake(10, 15, 300, 29);
    segment.selectedSegmentIndex = 0;
    
   // NSLog(@"%@",segment.subviews);
    //for (UIView *obj in segment.subviews) {
//        NSLog(@"%@",obj);
//    }
//    [[segment.subviews firstObject] removeFromSuperview];
//    UIView *view1 = [segment.subviews objectAtIndex:0];
//    for (UIView *obj in view1.subviews) {
//        [obj removeFromSuperview];
//    }
    segment.tintColor = [UIColor colorWithRed:0/255.0 green:160/255.0 blue:211/255.0 alpha:1.0];
    [segment addTarget:self action:@selector(segSelect:) forControlEvents:UIControlEventValueChanged];
    [self.backscroll addSubview:segment];
    
    AppDelegate *homeApp = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (homeApp.isIos6) {
        UIView *backView = [[UIView alloc]init];
        [_applyingtable setBackgroundView:backView];
        [_applyingtable setBackgroundColor:[UIColor clearColor]];
        
        UIView *backView1 = [[UIView alloc]init];
        [_taskingtable setBackgroundView:backView1];
        [_taskingtable setBackgroundColor:[UIColor clearColor]];
        
        UIView *backView2 = [[UIView alloc]init];
        [_endedtable setBackgroundView:backView2];
        [_endedtable setBackgroundColor:[UIColor clearColor]];
    }

}

#pragma mark-通知
-(void)DownloadOver
{
    NSMutableArray *arr = [DownloadMyApply shareDownload].mutableArray;
    for (appleModel *thisModel in arr) {
        [_arry addObject:thisModel];
    }
    [_applyingtable reloadData];
}

-(void)segSelect:(id)sender
{
    UISegmentedControl *seg=(UISegmentedControl *)sender;
    NSLog(@"myapply ----%@",seg.superview);
    switch (seg.selectedSegmentIndex) {
        case 0:
            _endedtable.hidden = YES;
            _applyingtable.hidden = NO;
            _taskingtable.hidden = YES;
         
            break;
        case 1:
            _applyingtable.hidden = YES;
            _taskingtable.hidden = NO;
            _endedtable.hidden = YES;
      
            break;
        case 2:
            _applyingtable.hidden = YES;
            _taskingtable.hidden = YES;
            _endedtable.hidden = NO;
     
            break;
        default:
            break;
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
    return 7.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView ==_applyingtable) {
        return 144.0;
    }
     return 117.0;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == _applyingtable) {
        return _arry.count;
    }return 2;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _applyingtable) {
        MyApplyingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (cell ==nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"MyApplyingCell" owner:self options:nil]lastObject];
            cell.layer.masksToBounds = YES;
            cell.layer.borderWidth = 0.5f;
            cell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 去掉圆角边
            cell.selectionStyle = UITableViewCellSelectionStyleGray;//设置点击颜色为灰色
            cell.selectedBackgroundView.frame = CGRectMake(0, 0, 300, 120);//背景颜色的范围
            
            cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
            cell.myapplybackview.layer.borderWidth = 0.5f;
            cell.myapplybackview.layer.borderColor = [UIColor lightGrayColor].CGColor;
        }
        appleModel *model = [_arry objectAtIndex:indexPath.section];
        cell.name.text = model.name;
        cell.c_price.text = model.c_price;
        cell.apply_price.text = model.apply_price;
        cell.apply_desc.text = model.apply_desc;
        cell.addtime.text = model.addtime;
        
        NSString *str =[NSString stringWithFormat:@"http://www.guyizu.com/%@",model.thumb];
        NSURL *url = [NSURL URLWithString:str];
        [cell.thumb setImageWithURL:url];
        return cell;
    }
    if (tableView == _taskingtable) {
        TaskingCell *taskcell = [tableView dequeueReusableCellWithIdentifier:@"taskcell"];
        if (taskcell ==nil) {
            taskcell = [[[NSBundle mainBundle]loadNibNamed:@"TaskingCell" owner:self options:nil]lastObject];
        
        }
        if (indexPath.section == 0) {
            taskcell.tasklable.text =@"任务完成，待确认";
        }
        taskcell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 去掉圆角边
        taskcell.selectionStyle = UITableViewCellSelectionStyleGray;//设置点击颜色为灰色
        taskcell.selectedBackgroundView.frame = CGRectMake(0, 0, 300, 120);//背景颜色的范围
        taskcell.layer.borderWidth = 0.5f;
        taskcell.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        taskcell.taskbackview.layer.borderWidth = 0.5f;
        taskcell.taskbackview.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        return taskcell;
    }
    if (tableView == _endedtable) {
        TaskingCell *endedcell = [tableView dequeueReusableCellWithIdentifier:@"endedcell"];
        if (endedcell ==nil) {
            endedcell = [[[NSBundle mainBundle]loadNibNamed:@"TaskingCell" owner:self options:nil]lastObject];
        }
        endedcell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 去掉圆角边
        endedcell.selectionStyle = UITableViewCellSelectionStyleGray;//设置点击颜色为灰色
        endedcell.selectedBackgroundView.frame = CGRectMake(0, 0, 300, 120);//背景颜色的范围
        endedcell.taskbackview.layer.borderWidth = 0.5f;
        endedcell.taskbackview.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        endedcell.tasklable.text =@"任务完成，待付款";
        endedcell.layer.borderWidth = 0.5f;
        endedcell.layer.borderColor = [UIColor lightGrayColor].CGColor;
        return endedcell;
    }
    UITableViewCell *cells = nil;
    return cells;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (tableView == _endedtable) {
        EndTaskViewController *endtask = [[EndTaskViewController alloc]init];
        [self.navigationController pushViewController:endtask animated:YES];
        
        
    }
    if (tableView == _applyingtable) {
        MyDetailApplyViewController *mydetailapply = [[MyDetailApplyViewController alloc]init];
        [self.navigationController pushViewController:mydetailapply animated:YES];
    }
 
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
