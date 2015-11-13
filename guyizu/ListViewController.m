//
//  ListViewController.m
//  guyizu
//
//  Created by 蓝叶软件 on 11/22/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import "ListViewController.h"
#import "MapBigViewController.h"
#import "ContentViewController.h"
#import "DownloadListView.h"
#import "ListView.h"
#import "mCell111.h"
#import "UIImageView+WebCache.h"
@interface ListViewController ()
{
    NSMutableArray* array;
    UITableView *mtableView;
    DownloadListView* downloadlistview;
    ListView* listview;
    NSMutableArray* allarray;
    BOOL isendrefresh;
    BOOL isaddmore;
}
@end

@implementation ListViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)notificationaction:(NSNotification*)sender
{
    array=sender.object;
    array=[NSMutableArray new];
    array=sender.object;
    if(isendrefresh==YES)
    {
    for(listview in array)
    {
        [allarray addObject:listview];
    }
    }
    NSLog(@"allarray=%@",allarray);
    isendrefresh=YES;
    isaddmore=NO;
    [mtableView reloadData];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"hometolistview" object:Nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //先固定这些接口；
    _city=22;
    _sortcat=0;
    _lng=102.03310;
    _lat=25.12680;
    _sorttime=0;
    _sortdis=1;
    _page=1;
    allarray=[NSMutableArray new];
    array=[NSMutableArray new];
    isendrefresh=YES;
    isaddmore=NO;
    downloadlistview=[DownloadListView shareDownload];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationaction:) name:@"hometolistview" object:nil];
    if(self.ishometolistview==YES)
    {
        [downloadlistview startDownload:_lng latposition:_lat];
    }
    else
    {
        //按城市；
        [downloadlistview startotherDownload:_city Sortcat:_sortcat Catid:_catid sorttime:_sorttime sortdis:_sortdis page:_page];
        //按经纬度；
        //[downloadlistview startotherDownload:_lng latposition:_lat Sortcat:_sortcat Sorttime:_sorttime Sortdis:_sortdis];
    }
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    NSInteger tableViewHeight;
    AppDelegate *thisDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (thisDelegate.isIphone4) {
        tableViewHeight = 316;
    }else{
        tableViewHeight = 416;
    }
    
    //navgation
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"信息列表"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"life_maplabels.png"] forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(0, 0, 17, 17);
    [rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    //tableView
    mtableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, tableViewHeight) style:UITableViewStylePlain];
    mtableView.dataSource = self;
    mtableView.delegate = self;
    
    mtableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    [self.view addSubview:mtableView];
    UIRefreshControl* refresh=[[UIRefreshControl alloc]init];
    refresh.tintColor=[UIColor blackColor];
    refresh.attributedTitle=[[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [refresh addTarget:self action:@selector(refreshaction:) forControlEvents:UIControlEventValueChanged];
    [mtableView addSubview:refresh];
    UIView* footview=[UIView new];
    footview.backgroundColor=[UIColor whiteColor];
    [mtableView setTableFooterView:footview];
    
    
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"1000m↓",@"类目↑",@"更新时间↑",nil];//提供个数 显示内容
    //初始化UISegmentedControl
    segmentedControl =[[UISegmentedControl alloc]initWithItems:segmentedArray];
    [segmentedControl addTarget:self action:@selector(sex:)forControlEvents:UIControlEventValueChanged];//添加值改变事件 不能使用单击时间
    segmentedControl.frame = CGRectMake(10.0, 10, 300.0, 28.0);
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
     segmentedControl.tintColor = [UIColor colorWithRed:0 green:160/255.0 blue:211/255.0 alpha:1]; //渲染色彩
    segmentedControl.selectedSegmentIndex = 0; //初始指定第0个选中
    [self.view addSubview:segmentedControl];
    if(self.ishometolistview==YES)
    {
        [segmentedControl removeFromSuperview];
        mtableView.frame=CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height);
    }
    else
    {
        mtableView.frame=CGRectMake(0, 44, 320,[UIScreen mainScreen].bounds.size.height-44);
    }
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
//  
//    button3.layer.borderWidth = 0.5;
//    button3.layer.borderColor = [UIColor grayColor].CGColor;
//    [self.view addSubview:button3];
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
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"add more");
    if(scrollView.contentOffset.y>=70+500*(_page-1))
    {
        if(isaddmore==NO)
        {
            _page++;
            [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationaction:) name:@"hometolistview" object:nil];
            isaddmore=YES;
            [downloadlistview startotherDownload:_city Sortcat:_sortcat Catid:_catid sorttime:_sorttime sortdis:_sortdis page:_page];
        }
    }
    
}
-(void)refreshaction:(UIRefreshControl*)refresh
{
    NSLog(@"refresh");
    if(refresh.isRefreshing==YES)
    {
        refresh.attributedTitle=[[NSAttributedString alloc]initWithString:@"下拉刷新"];
    }
    else
    {
        refresh.attributedTitle=[[NSAttributedString alloc]initWithString:@"完成"];
    }
    [self performSelectorOnMainThread:@selector(refreshshow) withObject:nil waitUntilDone:NO];
    [refresh endRefreshing];
}
-(void)refreshshow
{
    isendrefresh=NO;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationaction:) name:@"hometolistview" object:nil];
    [downloadlistview startotherDownload:_city Sortcat:_sortcat Catid:_catid sorttime:_sorttime sortdis:_sortdis page:_page];
}
- (void)sex:(id)sender {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationaction:) name:@"hometolistview" object:nil];
    UISegmentedControl *se = (UISegmentedControl *)sender;
    NSInteger index = se.selectedSegmentIndex;
    if (index == 0 ) {
            [segmentedControl setTitle:@"1000m↓" forSegmentAtIndex:0];
            [segmentedControl setTitle:@"类目↑" forSegmentAtIndex:1];
            [segmentedControl setTitle:@"更新时间↑" forSegmentAtIndex:2];
        _sortdis=1;
        _sorttime=0;
        _sortcat=0;
    }
    if (index ==1) {
        [segmentedControl setTitle:@"类目↓" forSegmentAtIndex:1];
         [segmentedControl setTitle:@"1000m↑" forSegmentAtIndex:0];
         [segmentedControl setTitle:@"更新时间↑" forSegmentAtIndex:2];
        _sortdis=0;
        _sorttime=0;
        _sortcat=1;
    }if (index == 2) {
        [segmentedControl setTitle:@"更新时间↓" forSegmentAtIndex:2];
         [segmentedControl setTitle:@"1000m↑" forSegmentAtIndex:0];
         [segmentedControl setTitle:@"类目↑" forSegmentAtIndex:1];
        _sortdis=0;
        _sorttime=1;
        _sortcat=0;
    }
    allarray=[NSMutableArray new];
    _page=1;
    [downloadlistview startotherDownload:_city Sortcat:_sortcat Catid:_catid sorttime:_sorttime sortdis:_sortdis page:_page];
}

#pragma mark -

#pragma mark upBUttonClick

-(void)leftClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightClick{
    MapBigViewController *mapCtl = [[MapBigViewController alloc]init];
    NSMutableArray* arr=[NSMutableArray new];
    for(int i=0;i<[array count];i++)
    {
        listview=array[i];
        NSLog(@"lat=%@,lng=%@",listview.map_lat,listview.map_lng);
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:listview.map_lat,@"latitude",listview.map_lng,@"longitude",nil];
        [arr addObject:dic];
    }
    mapCtl.array=array;
    [mapCtl.pointArry setArray:arr];
    [self.navigationController pushViewController:mapCtl animated:YES];
}

#pragma mark tableViewDateSouse

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [array count]*_page;
   
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    mCell111* oneCell = [tableView dequeueReusableCellWithIdentifier:@"mCell111"];
    if (oneCell == nil) {
       oneCell=[[[NSBundle mainBundle]loadNibNamed:@"lifeCell" owner:self options:Nil]lastObject];
    }
    if(isendrefresh==YES)
    {
    listview=[ListView new];
    if(_ishometolistview==YES)
    {
        static int num=0;
        if(num==5)
        {
            num=0;
        }
        listview=array[num];
        num++;
    }
    else
    {
        listview=allarray[indexPath.row];
    }
        oneCell.namelable.text=listview.name;
            //异步网络加载图片；
        NSString* string=[NSString stringWithFormat:@"http://www.guyizu.com/%@",listview.thumb];
        [oneCell.thumbimage setImageWithURL:[NSURL URLWithString:string]];
        switch ([listview.star intValue]) {
            case 0:
                    oneCell.starimage.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                    oneCell.starimageone.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                    oneCell.starimagetwo.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                    oneCell.starimagethree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                    oneCell.starimagefour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                    break;
            case 1:
                    oneCell.starimage.image=[UIImage imageNamed:@"life_score_full_one.png"];
                    oneCell.starimageone.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                    oneCell.starimagetwo.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                    oneCell.starimagethree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                    oneCell.starimagefour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                    break;
            case 2:
                    oneCell.starimage.image=[UIImage imageNamed:@"life_score_full_one.png"];
                    oneCell.starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
                    oneCell.starimagetwo.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                    oneCell.starimagethree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                    oneCell.starimagefour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                    break;
            case 3:
                    oneCell.starimage.image=[UIImage imageNamed:@"life_score_full_one.png"];
                    oneCell.starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
                    oneCell.starimagetwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
                    oneCell.starimagethree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                    oneCell.starimagefour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                    break;
            case 4:
                    oneCell.starimage.image=[UIImage imageNamed:@"life_score_full_one.png"];
                    oneCell.starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
                    oneCell.starimagetwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
                    oneCell.starimagethree.image=[UIImage imageNamed:@"life_score_full_one.png"];
                    oneCell.starimagefour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                    break;
            case 5:
                    oneCell.starimage.image=[UIImage imageNamed:@"life_score_full_one.png"];
                    oneCell.starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
                    oneCell.starimagetwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
                    oneCell.starimagethree.image=[UIImage imageNamed:@"life_score_full_one.png"];
                    oneCell.starimagefour.image=[UIImage imageNamed:@"life_score_full_one.png"];
                    break;
            default:
                    break;
            }
            oneCell.avgpricelable.text=[NSString stringWithFormat:@"¥ %@",listview.avgprice];
            oneCell.addresslable.text=listview.address;
            oneCell.distancelable.text=[NSString stringWithFormat:@"%@m",listview.distance];
        }
    //隐藏掉距离；
    oneCell.distancelable.hidden=YES;
    return oneCell;
}

#pragma mark tableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ContentViewController *contentCtl = [[ContentViewController alloc]initWithNibName:@"ContentViewController" bundle:nil];
    contentCtl.selectlistview=indexPath.row;
    listview=array[indexPath.row];
    NSLog(@"%d",[listview.sid intValue]);
    contentCtl.sid=[listview.sid intValue];
    [self.navigationController pushViewController:contentCtl animated:YES];
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
