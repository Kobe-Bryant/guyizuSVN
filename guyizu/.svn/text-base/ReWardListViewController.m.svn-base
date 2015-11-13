//
//  ReWardListViewController.m
//  guyizu
//
//  Created by 蓝叶软件 on 11/26/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import "ReWardListViewController.h"
#import "RewardContentViewController.h"
#import "ShaixuanViewController.h"
#import "AppDelegate.h"
#import "DownloadListView.h"
#import "ReWardView.h"
#import "UIImageView+WebCache.h"
#import "ReWardCell.h"
#import "DownloadSearchView.h"
@interface ReWardListViewController ()
{
    NSMutableArray* array;
    UITableView *mtableView;
    ReWardView* rewardview;
    DownloadSearchView* searchview;
    LifeSearchViewController *lifeSearch;
    NSMutableArray* orgarray;
    DownloadListView* listview;
    NSMutableArray* allarray;
    BOOL isendrefresh;
}
@end

@implementation ReWardListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _issearch=NO;
    }
    return self;
}
-(void)notificationaction:(NSNotification*)sender
{
    array=[NSMutableArray new];
    array=sender.object;
    orgarray=array;
    NSLog(@"array=%@",array);
    [mtableView reloadData];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"hometolistview" object:Nil];
}
-(void)viewWillAppear:(BOOL)animated
{
    searchview=[DownloadSearchView shardsearchview];
    _keyword=searchview.keywordstring;
    _catid=searchview.catidstring;
    _issearch=searchview.issearch;
    if(_issearch==YES)
    {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(searchnotificationaction:) name:@"searchorsubview" object:nil];
        [searchview startsearchview:_keyword catid:_catid];
    }
    else
    {
        listview=[DownloadListView shareDownload];
        listview.isrewardlistview=YES;
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationaction:) name:@"hometolistview" object:nil];
        [listview startrewardDownload:_lng latposition:_lat Sortcat:_sort_cat Sorttime:_sort_time Sortdis:_sort_dis];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1)
    {
        lifeSearch=[LifeSearchViewController new];
        [self.navigationController pushViewController:lifeSearch animated:YES];
    }
}
-(void)searchnotificationaction:(NSNotification*)sender
{
    array=[NSMutableArray new];
    array=sender.object;
     NSLog(@"searcharray=%@",array);
    if([array count]==0)
    {
        //
        [[NSNotificationCenter defaultCenter]removeObserver:self name:@"searchorsubview" object:Nil];
        searchview.issearch=NO;
        array=orgarray;
        UIAlertView* alertview=[[UIAlertView alloc]initWithTitle:@"搜索的内容为空!" message:@"是否返回搜索界面？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertview show];
    }
    else
    {
        [mtableView reloadData];
        [[NSNotificationCenter defaultCenter]removeObserver:self name:@"searchorsubview" object:Nil];
        searchview.issearch=NO;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _lng=114.03846;
    _lat=22.54812;
    _sort_cat=0;
    _sort_dis=1;
    _sort_time=0;
    array=[NSMutableArray new];
    orgarray=[NSMutableArray new];
    //iPhone4
    NSInteger tableViewHeight;
    AppDelegate *thisDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (thisDelegate.isIphone4) {
        tableViewHeight = 316;
    }else{
        tableViewHeight = 416;
    }
    
    //navigation
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    //右侧两个按钮
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"life_backlist.png"] forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(0, 0, 24, 17);
    [rightButton addTarget:self action:@selector(topRightClick) forControlEvents:UIControlEventTouchUpInside];
    UIButton *rightButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton2 setBackgroundImage:[UIImage imageNamed:@"life_top_search.png"] forState:UIControlStateNormal];
    rightButton2.frame = CGRectMake(0, 0, 20, 20);
    [rightButton2 addTarget:self action:@selector(topSearchClick) forControlEvents:UIControlEventTouchUpInside];
    
    //添加导航按钮
    UIBarButtonItem *barbutton1 = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    UIBarButtonItem *barbutton2 = [[UIBarButtonItem alloc]initWithCustomView:rightButton2];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:barbutton1, barbutton2, nil];
    
    //标题label
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    [customLab setTextColor:[UIColor whiteColor]];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setText:@"信息列表"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    
    //tableVIew
   mtableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, tableViewHeight) style:UITableViewStylePlain];
    mtableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    mtableView.dataSource = self;
    mtableView.delegate = self;
    [self.view addSubview:mtableView];
//    UIRefreshControl* refresh=[[UIRefreshControl alloc]init];
//    refresh.tintColor=[UIColor blackColor];
//    refresh.attributedTitle=[[NSAttributedString alloc]initWithString:@"加载更多..."];
//    [refresh addTarget:self action:@selector(refreshaction:) forControlEvents:UIControlEventValueChanged];
//    [mtableView addSubview:refresh];
    UIView* view=[UIView new];
    view.backgroundColor=[UIColor whiteColor];
    [mtableView setTableFooterView:view];
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"1000m↓",@"类目↑",@"更新时间↑",nil];//提供个数 显示内容
    //初始化UISegmentedControl
    segmentedControl =[[UISegmentedControl alloc]initWithItems:segmentedArray];
    [segmentedControl addTarget:self action:@selector(sex:)forControlEvents:UIControlEventValueChanged];//添加值改变事件 不能使用单击时间
    segmentedControl.frame = CGRectMake(10.0, 10, 300.0, 28.0);
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedControl.tintColor = [UIColor colorWithRed:0 green:160/255.0 blue:211/255.0 alpha:1]; //渲染色彩
    segmentedControl.selectedSegmentIndex = 0; //初始指定第0个选中
    [self.view addSubview:segmentedControl];
//    //创建上面得三个按钮
//    UIView *button1 = [[UIView alloc]init];
//    button1.frame = CGRectMake( 10, 8, 100, 28);
//    button1.backgroundColor = [UIColor colorWithRed:0 green:160/255.0 blue:211/255.0 alpha:1.0];
//    button1.layer.borderWidth = 0.5;
//    button1.layer.borderColor = [UIColor grayColor].CGColor;
//    [self.view addSubview:button1];
//    
//    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(18, 4, 80, 20)];
//    label1.backgroundColor = [UIColor clearColor];
//    label1.textColor = [UIColor whiteColor];
//    label1.font = [UIFont systemFontOfSize:15.0f];
//    label1.text = @"1000m";
//    [button1 addSubview:label1];
//    
//    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(75, 10, 10, 11)];
//    imageView1.image = [UIImage imageNamed:@"life_filter_up.png"];
//    [button1 addSubview:imageView1];
//    
//    //第二个按钮
//    UIView *button2 = [[UIView alloc]init];
//    button2.frame = CGRectMake( 110, 8, 100, 28);
//    button2.backgroundColor = [UIColor whiteColor];
//    button2.layer.borderWidth = 0.5;
//    button2.layer.borderColor = [UIColor grayColor].CGColor;
//    [self.view addSubview:button2];
//    
//    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(23, 4, 80, 20)];
//    label2.backgroundColor = [UIColor clearColor];
//    label2.textColor = [UIColor grayColor];
//    label2.font = [UIFont systemFontOfSize:15.0f];
//    label2.text = @"类目";
//    [button2 addSubview:label2];
//    
//    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(70, 10, 10, 11)];
//    imageView2.image = [UIImage imageNamed:@"life_filter.png"];
//    [button2 addSubview:imageView2];
//    
//    //第三个按钮
//    UIView *button3 = [[UIView alloc]init];
//    button3.frame = CGRectMake( 210, 8, 100, 28);
//    button3.backgroundColor = [UIColor whiteColor];
//    button3.layer.borderWidth = 0.5;
//    button3.layer.borderColor = [UIColor grayColor].CGColor;
//    [self.view addSubview:button3];
//    
//    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(16, 4, 80, 20)];
//    label3.backgroundColor = [UIColor clearColor];
//    label3.textColor = [UIColor grayColor];
//    label3.font = [UIFont systemFontOfSize:15.0f];
//    label3.text = @"更新时间";
//    [button3 addSubview:label3];
//    
//    UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(77, 10, 10, 11)];
//    imageView3.image = [UIImage imageNamed:@"life_filter.png"];
//    [button3 addSubview:imageView3];
}
//-(void)refreshaction:(UIRefreshControl*)refresh
//{
//    NSLog(@"refresh");
//    if(refresh.isRefreshing==YES)
//    {
//        refresh.attributedTitle=[[NSAttributedString alloc]initWithString:@"加载更多..."];
//    }
//    else
//    {
//        refresh.attributedTitle=[[NSAttributedString alloc]initWithString:@"加载完成"];
//    }
//    [self performSelectorOnMainThread:@selector(refreshshow) withObject:nil waitUntilDone:NO];
//    [refresh endRefreshing];
//}
//-(void)refreshshow
//{
//    _page++;
//    isendrefresh=NO;
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationaction:) name:@"hometolistview" object:nil];
//    [downloadlistview startotherDownload:_city Sortcat:_sortcat Catid:_catid sorttime:_sorttime sortdis:_sortdis page:_page];
//}
- (void)sex:(id)sender {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationaction:) name:@"hometolistview" object:nil];
    UISegmentedControl *se = (UISegmentedControl *)sender;
    NSInteger index = se.selectedSegmentIndex;
    if (index == 0) {
        [segmentedControl setTitle:@"1000m↓" forSegmentAtIndex:0];
        [segmentedControl setTitle:@"类目↑" forSegmentAtIndex:1];
        [segmentedControl setTitle:@"更新时间↑" forSegmentAtIndex:2];
        _sort_cat=0;
        _sort_dis=1;
        _sort_time=0;
    }if (index ==1) {
        [segmentedControl setTitle:@"类目↓" forSegmentAtIndex:1];
        [segmentedControl setTitle:@"1000m↑" forSegmentAtIndex:0];
        [segmentedControl setTitle:@"更新时间↑" forSegmentAtIndex:2];
        _sort_time=0;
        _sort_dis=0;
        _sort_cat=1;
    }if (index == 2) {
        [segmentedControl setTitle:@"更新时间↓" forSegmentAtIndex:2];
        [segmentedControl setTitle:@"1000m↑" forSegmentAtIndex:0];
        [segmentedControl setTitle:@"类目↑" forSegmentAtIndex:1];
        _sort_cat=0;
        _sort_dis=0;
        _sort_time=1;
    }
    [listview startrewardDownload:_lng latposition:_lat Sortcat:_sort_cat Sorttime:_sort_time Sortdis:_sort_dis];
}

#pragma mark -
#pragma mark selfButtonClick

-(void)leftClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)topSearchClick{
   lifeSearch = [[LifeSearchViewController alloc]init];
    lifeSearch.isrewardtosearch=YES;
    [self.navigationController pushViewController:lifeSearch animated:YES];
}

-(void)topRightClick{
    ShaixuanViewController *shaixuanCtl = [[ShaixuanViewController alloc]initWithNibName:@"ShaixuanViewController" bundle:nil];
    [self.navigationController pushViewController:shaixuanCtl animated:YES];
}

#pragma mark tableViewDateSouse

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ReWardCell *oneCell = [tableView dequeueReusableCellWithIdentifier:@"mRewardCell"];
    if (oneCell == nil) {
        oneCell = [[[NSBundle mainBundle]loadNibNamed:@"RewardCell" owner:self options:nil]lastObject];
        UIView *theView = (UIView *)[oneCell viewWithTag:1001];
        theView.layer.cornerRadius = 5.0f;
        theView.layer.borderWidth = 1.0f;
        theView.layer.borderColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:228/255.0 alpha:1.0].CGColor;
    }
    rewardview=[ReWardView new];
    rewardview=array[indexPath.row];
    oneCell.namelable.text=rewardview.name;
    oneCell.pricelable.text=[NSString stringWithFormat:@"¥ %@",rewardview.c_price];
    oneCell.reviewslable.text=rewardview.reviews;
    oneCell.distancelable.text=[NSString stringWithFormat:@"距离:%@km",rewardview.distance];
    oneCell.task_typelable.text=rewardview.task_type;
    if([rewardview.task_type isEqualToString:@"线上任务"])
    {
        oneCell.isonlineimage.image=[UIImage imageNamed:@"task_online.png"];
        oneCell.isonlineimage.frame=CGRectMake(101, 69, 10, 10);
    }
    else
    {
        oneCell.isonlineimage.image=[UIImage imageNamed:@"task_underline.png"];
        oneCell.isonlineimage.frame=CGRectMake(101, 69, 6, 10);
    }
    if(rewardview.is_selected==0)
    {
        oneCell.is_selectlable.text=@"可应征";
    }
    else
    {   oneCell.is_selectlable.text=@"已选标";
    
    }
    oneCell.applynumlable.text=rewardview.c_apply_num;
    oneCell.finishtimelable.text= [NSString stringWithFormat:@"%@",rewardview.finish_time];
    [oneCell.thumbimage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.guyizu.com/%@",rewardview.thumb]]];
    return oneCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    RewardContentViewController *rewardCtl = [[RewardContentViewController alloc]initWithNibName:@"RewardContentViewController" bundle:nil];
    rewardview=array[indexPath.row];
    NSLog(@"sid=%d",[rewardview.sid intValue]);
    rewardCtl.sid=[rewardview.sid intValue];
    rewardview=array[indexPath.row];
    if( [rewardview.task_type isEqualToString:@"线上任务"])
    {
        rewardCtl.isonline=YES;
    }
    else
    {
        rewardCtl.isonline=NO;
    }
    searchview.issearch=NO;
    [self.navigationController pushViewController:rewardCtl animated:YES];
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
