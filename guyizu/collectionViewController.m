//
//  collectionViewController.m
//  Mycollection
//
//  Created by lanye on 13-12-2.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "collectionViewController.h"
#import "ContentViewController.h"
#import "RewardContentViewController.h"
#import "AppDelegate.h"
#import "DownloadShoucang.h"
#import "UIImageView+WebCache.h"
@interface collectionViewController ()

@end

@implementation collectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        titlelablearr = [[NSMutableArray alloc]initWithObjects:@"任务进行中",@"已选标", nil];
        endlablearr = [[NSMutableArray alloc]initWithObjects:@"线上任务",@"深圳－福田区 距离：1.3Km",nil];
        endimagearr = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"member_r21_c3.png"],[UIImage imageNamed:@"member_r27_c16.png"],nil];
        
        _arry = [[NSMutableArray alloc]initWithCapacity:0];
        _nameArry = [[NSMutableArray alloc]initWithCapacity:0];
        _taskarry = [[NSMutableArray alloc]initWithCapacity:0];
        _tasknameArry = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DownloadOver) name:@"shoucangDownloadOver" object:nil];
    [[DownloadShoucang shareDownload]startDownload];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DownloadtaskOver) name:@"shoucangtaskDownloadOver" object:nil];
    [[DownloadShoucang shareDownload]starttaskDownload];
    
    //构建nav
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"我收藏的信息"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
   // self.backscroll.contentSize = CGSizeMake(320, 570);
    
    classifytable = [[UITableView alloc]initWithFrame:CGRectMake(10, 50, 300, 550) style:UITableViewStyleGrouped];
   
    classifytable.backgroundColor = [UIColor colorWithRed:242/255.0 green:245/255.0 blue:244/255.0 alpha:1];
    classifytable.sectionHeaderHeight = 1.0;
    classifytable.sectionFooterHeight = 1.0;
    classifytable.showsVerticalScrollIndicator = NO;
    classifytable.delegate = self;
    classifytable.dataSource = self;
    [self.backscroll addSubview:classifytable];
    
    rewardtable = [[UITableView alloc]initWithFrame:CGRectMake(10, 50, 300, 600) style:UITableViewStyleGrouped];
  
    rewardtable.backgroundColor = [UIColor colorWithRed:242/255.0 green:245/255.0 blue:244/255.0 alpha:1];
    rewardtable.sectionHeaderHeight = 5.0;
    rewardtable.sectionFooterHeight = 5.0;
    rewardtable.showsVerticalScrollIndicator = NO;
    rewardtable.delegate = self;
    rewardtable.dataSource = self;
    rewardtable.hidden = YES;
    [self.backscroll addSubview:rewardtable];
    
    //选中另外一个
    if (self.selectIndex == 1) {
        [self.segmentCtl setSelectedSegmentIndex:self.selectIndex];
        classifytable.hidden = YES;
        rewardtable.hidden = NO;
    }
    //修改ios6uitableview的背景颜色
    AppDelegate *homeApp = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (homeApp.isIos6) {
        
        UIView *backView = [[UIView alloc]init];
        [classifytable setBackgroundView:backView];
        [classifytable setBackgroundColor:[UIColor clearColor]];
        
        UIView *backView1 = [[UIView alloc]init];
        [rewardtable setBackgroundView:backView1];
        [rewardtable setBackgroundColor:[UIColor clearColor]];
    }
    
}

-(void)DownloadOver
{
    NSMutableArray *arr1 = [DownloadShoucang shareDownload].mutableArry;
    for (messageModel *thisModel in arr1) {
        [_arry addObject:thisModel];
        [_nameArry addObject:thisModel.name];
    }
    [classifytable reloadData];
}
-(void)DownloadtaskOver
{
    NSMutableArray *arr2 = [DownloadShoucang shareDownload].taskmutableArry;

    for (messageModel *this in arr2) {
        [_tasknameArry addObject:this.taskname];
            [_taskarry addObject:this];
    }
    [rewardtable reloadData];
}

#pragma mark -
#pragma mark leftButtonClick

-(void)mleftBarBttonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 10.0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == classifytable) {
        return _nameArry.count;
    }return _tasknameArry.count;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1.0;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    return 115.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView ==classifytable){
    classifycell *classifycell = [tableView dequeueReusableCellWithIdentifier:@"classcell"];
    if (classifycell ==nil) {
        classifycell = [[[NSBundle mainBundle]loadNibNamed:@"classifycell" owner:self options:nil]lastObject];
        classifycell.selected = NO;//取消点击事件
        classifycell.selectionStyle = UITableViewCellSelectionStyleNone;//取消选中颜色
        classifycell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 去掉圆角边框
        
        classifycell.layer.borderWidth = 0.5f;
        classifycell.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        classifycell.backview.layer.borderWidth = 0.5f;
        classifycell.backview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
        
     messageModel *model = [_arry objectAtIndex:indexPath.section];
        classifycell.addtime.text = model.addtime;
        classifycell.name.text = model.name;
        classifycell.pageviews.text = model.pageviews;
        classifycell.content.text = model.content;
        NSString *str =[NSString stringWithFormat:@"http://www.guyizu.com/%@",model.thumb];
        NSURL *url = [NSURL URLWithString:str];
        [classifycell.thumb setImageWithURL:url];
   
    return classifycell;
    }else{
        colrewardcell *rewardcell = [tableView dequeueReusableCellWithIdentifier:@"rewardcell"];
        if (rewardcell ==nil) {
            rewardcell = [[[NSBundle mainBundle]loadNibNamed:@"colrewardcell" owner:self options:nil]lastObject];
            rewardcell.selected = NO;//取消点击事件
            rewardcell.selectionStyle = UITableViewCellSelectionStyleNone;//取消选中颜色
            rewardcell.layer.borderWidth = 0.5f;
            rewardcell.layer.borderColor = [UIColor lightGrayColor].CGColor;
            rewardcell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 去掉圆角边框
            rewardcell.backview.layer.borderWidth = 0.5f;
            rewardcell.backview.layer.borderColor = [UIColor lightGrayColor].CGColor;
            
//            rewardcell.titlelable.text = [titlelablearr objectAtIndex:indexPath.section];
//            rewardcell.endlable.text = [endlablearr objectAtIndex:indexPath.section];
//            [rewardcell.endimage setContentMode:UIViewContentModeScaleAspectFit];
//            rewardcell.endimage.image = [endimagearr objectAtIndex:indexPath.section];
        }
       
        messageModel *message = [_taskarry objectAtIndex:indexPath.section];
        rewardcell.taskname.text = message.taskname;
        rewardcell.titlelable.text = message.taskstatus;
        rewardcell.taskaddtime.text = message.taskaddtime;
        rewardcell.taskprice.text = message.taskc_price;
        rewardcell.taskapplynum.text = message.taskc_apply_num;
        rewardcell.taskguesbooks.text = message.taskguestbooks;
        NSString *str =[NSString stringWithFormat:@"http://www.guyizu.com/%@",message.taskthumb];
        NSURL *url = [NSURL URLWithString:str];
        [rewardcell.taskthumb setImageWithURL:url];
       
        return rewardcell;
    }
    UITableViewCell *cells = nil;
    return cells;
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (rewardtable.hidden) {
//        ContentViewController *contentCtl = [[ContentViewController alloc]initWithNibName:@"ContentViewController" bundle:nil];
//        [self.navigationController pushViewController:contentCtl animated:YES];
//    }else{
//        RewardContentViewController *rewardCtl = [[RewardContentViewController alloc]initWithNibName:@"RewardContentViewController" bundle:nil];
//        [self.navigationController pushViewController:rewardCtl animated:YES];
//    }
//}

#pragma mark -

- (IBAction)select:(id)sender {
    UISegmentedControl *seg=(UISegmentedControl *)sender;
    NSInteger indexclick = seg.selectedSegmentIndex;
    if (indexclick ==0) {
        rewardtable.hidden = YES;
        classifytable.hidden = NO;
    }
    if (indexclick ==1) {
        classifytable.hidden = YES;
        rewardtable.hidden = NO;
        
    }
//    NSLog(@"%d",indexclick);
    
}
@end
