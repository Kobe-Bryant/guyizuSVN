//
//  JinDuViewController.m
//  谷蚁族
//
//  Created by Macsyf on 13-12-27.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "JinDuViewController.h"
#import "JinDuCell.h"
#import "DownloadListView.h"
#import "ReWardJinDuView.h"
@interface JinDuViewController ()
{
    ReWardJinDuView* jinduview;
}
@end

@implementation JinDuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)leftClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)topSearchClick
{
    //搜索；
    
}
-(void)notificationaction:(NSNotification*)sender
{
    jinduview=sender.object[0];
    [_tableview reloadData];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"hometolistview" object:Nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //navigation
     jinduview=[ReWardJinDuView new];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationaction:) name:@"hometolistview" object:nil];
    DownloadListView* listview=[DownloadListView shareDownload];
    [listview startrewardjinduDownload:_sid];
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    UIButton *rightButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton2 setBackgroundImage:[UIImage imageNamed:@"life_top_search.png"] forState:UIControlStateNormal];
    rightButton2.frame = CGRectMake(0, 0, 20, 20);
    [rightButton2 addTarget:self action:@selector(topSearchClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barbutton2 = [[UIBarButtonItem alloc]initWithCustomView:rightButton2];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:barbutton2, nil];
    //标题label
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    [customLab setTextColor:[UIColor whiteColor]];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setText:@"悬赏分类"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    _scrollview.contentSize=CGSizeMake(320,600);
    _tableview.delegate=self;
    _tableview.dataSource=self;
    _tableview.scrollEnabled=NO;
    UIView* backview=[UIView new];
    backview.backgroundColor=[UIColor whiteColor];
    [_tableview setTableFooterView:backview];
    _tableview.backgroundColor=[UIColor whiteColor];
    

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JinDuCell* cell=[tableView dequeueReusableCellWithIdentifier:@"JinDuCell"];
    if(cell==Nil)
    {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"JinDuCell" owner:self options:nil]lastObject];
    }
    switch (indexPath.row%5) {
        case 0:
            cell.renwulable.text=@"发布任务 :";
            if([jinduview.publish_time isEqualToString:@""])
            {
                cell.finishimage.hidden=YES;
                cell.timelable.text=@"....";
            }
            else
            {
                cell.timelable.text=jinduview.publish_time;
            }
            break;
        case 1:
            cell.renwulable.text=@"应征任务 :";
            if([jinduview.apply_time isEqualToString:@""])
            {
                cell.finishimage.hidden=YES;
                cell.timelable.text=@"....";
            }
            else
            {
                cell.timelable.text=jinduview.apply_time;
            }
            break;
        case 2:
            cell.renwulable.text=@"选定任务 :";
            if([jinduview.select_time isEqualToString:@""])
            {
                cell.finishimage.hidden=YES;
                cell.timelable.text=@"....";
            }
            else
            {
                cell.timelable.text=jinduview.select_time;
            }
            break;
        case 3:
            cell.renwulable.text=@"完成任务 :";
            if([jinduview.finish_time isEqualToString:@""])
            {
                cell.finishimage.hidden=YES;
                cell.timelable.text=@"....";
            }
            else
            {
                cell.timelable.text=jinduview.finish_time;
            }
            break;
        case 4:
            cell.renwulable.text=@"结束任务 :";
            if([jinduview.end_time isEqualToString:@""])
            {
                cell.finishimage.hidden=YES;
                cell.timelable.text=@"....";
            }
            else
            {
                cell.timelable.text=jinduview.end_time;
            }
            break;
        default:
            break;
    }
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
