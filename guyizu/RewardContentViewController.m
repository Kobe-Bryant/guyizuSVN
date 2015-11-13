//
//  RewardContentViewController.m
//  guyizu
//
//  Created by 蓝叶软件 on 11/26/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import "RewardContentViewController.h"
#import "MapBigViewController.h"
#import "zhixunViewController.h"
#import "ShenqingViewController.h"
#import "ReWardContentView.h"
#import "DownloadListView.h"
#import "RewardContentCell.h"
#import "UIImageView+WebCache.h"
#import "JinDuViewController.h"
#import "DengluViewController.h"
@interface RewardContentViewController ()
{
    NSMutableArray* array;
    DownloadListView* downloadlistview;
    ReWardContentView* contentview;
    UIImageView *photoView;
    NSMutableArray* picarray;
    UITableView *mTableView;
    UIView* blackView;
}
@end

@implementation RewardContentViewController

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
    contentview=array[0];
    NSLog(@"array=%@",array);
    //for(contentview in array)
    //{
    [photoView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.guyizu.com/%@",contentview.thumb]]];
    _namelable.text=contentview.name;
    _creatorlable.text=[NSString stringWithFormat:@"发布人 ： %@", contentview.creator];
    _addtimelable.text=[NSString stringWithFormat:@"发布时间 ： %@", contentview.addtime];
    _pricelable.text=[NSString stringWithFormat:@"¥%@",contentview.c_price];
    _applynumlable.text=contentview.c_apply_num;
    _reviewslable.text=contentview.reviews;
    if(_isonline==YES)
    {
        _pointView.hidden=YES;
       
    }
    else
    {
        _pointView.hidden=NO;
        _addresslable.text=contentview.c_address;
        
    }
    _categorylable.text=contentview.category;
    _finishtimelable.text=contentview.c_finish_time;
    _xiangqinglable.text=contentview.content;
    //}
    _moneylable.text=[NSString stringWithFormat:@"¥ %@", contentview.c_use_price];
    if([[NSString stringWithFormat:@"%@",contentview.guestbook_cont] isEqualToString:@"(null)"] || [[NSString stringWithFormat:@"%@",contentview.guestbook_cont] isEqualToString:@"<null>"])
    {
        _liuyannumlable.text=[NSString stringWithFormat:@"(共0条)"];
    }
    else
    {
        _liuyannumlable.text=[NSString stringWithFormat:@"(共%d条)",[contentview.guestbook_cont count]];
        self.BigScrollView.contentSize=CGSizeMake(320, 672+80*[contentview.guestbook_cont count]+44);
        mTableView.frame=CGRectMake(0, 672, 320, 80 * [contentview.guestbook_cont count]);
        [mTableView reloadData];
    }
    //图片框；
    for(NSDictionary* dic in contentview.picture)
    {
        [picarray addObject:[NSString stringWithFormat:@"http://www.guyizu.com/%@",[dic objectForKey:@"thumb"]]];
        [picarray addObject:[NSString stringWithFormat:@"http://www.guyizu.com/%@",[dic objectForKey:@"filename"]]];
    }
    networkImages=[NSArray arrayWithArray:picarray];
    networkCaptions = [[NSArray alloc] initWithObjects:@" ",nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"hometolistview" object:Nil];
}
-(void)shoucangClick
{
    BOOL islog = [[NSUserDefaults standardUserDefaults] boolForKey:@"islogin"];
    if (!islog) {
        DengluViewController *dengluCtl = [[DengluViewController alloc]initWithNibName:@"DengluViewController" bundle:nil];
        dengluCtl.isshoucang=YES;
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:dengluCtl];
        [self presentViewController:nav animated:YES completion:nil];
    }
    else
    {
        [downloadlistview startshouchangDownload:_sid];
        blackView = [[UIView alloc]initWithFrame:CGRectMake(50, 155, 220, 80)];
        blackView.backgroundColor = [UIColor blackColor];
        blackView.alpha = 0.7f;
        blackView.layer.cornerRadius = 5.0f;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(75, 20, 80, 40)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:15.0f];
        [blackView addSubview:label];
        [self.view addSubview:blackView];
        if(downloadlistview.shouchangstate==1)
        {
            label.text = @"收藏成功！";
            
        }
        else
        {
            label.text=@"收藏失败!";
        }
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(removeShoucang) userInfo:nil repeats:NO];
    }
}
-(void)removeShoucang{
    [blackView removeFromSuperview];
    blackView = nil;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [RewardContentCell new];
    array=[NSMutableArray new];
    picarray=[NSMutableArray new];
    downloadlistview=[DownloadListView shareDownload];
    downloadlistview.iscontentview=YES;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationaction:) name:@"hometolistview" object:nil];
    [downloadlistview startrewardDownload:_sid];
    contentview=[ReWardContentView new];
    //navigation
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    //构造nav按钮
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"life_share.png"] forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(0, 0, 24, 16);
    [rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    UIButton *rightButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton2 setBackgroundImage:[UIImage imageNamed:@"shouc.png"] forState:UIControlStateNormal];
    rightButton2.frame = CGRectMake(0, 0, 25, 24);
    [rightButton2 addTarget:self action:@selector(shoucangClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barbutton1 = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    UIBarButtonItem *barbutton2 = [[UIBarButtonItem alloc]initWithCustomView:rightButton2];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:barbutton1, barbutton2, nil];
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"内容页"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    //photo
    UITapGestureRecognizer *photoTapGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(photoViewClick)];
    photoView = [[UIImageView alloc]initWithFrame:CGRectMake(7, 7, 92, 70)];
    photoView.userInteractionEnabled = YES;
    self.boxView.userInteractionEnabled = YES;
    [self.boxView addGestureRecognizer:photoTapGest];
    [self.boxView addSubview:photoView];
    
    //下层tableView
   mTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 672, 320, 80 * 6) style:UITableViewStylePlain];
    mTableView.dataSource = self;
    mTableView.delegate = self;
    mTableView.scrollEnabled = NO;
    [self.BigScrollView addSubview:mTableView];
    
    self.BigScrollView.contentSize = CGSizeMake(320, 672 + 80 * 6 + 44);
    
    //missonDeatailView
    self.missonDitealView.layer.cornerRadius = 5.0f;
    
    //phone
    UITapGestureRecognizer *phoneTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(mphoneTapGest)];
    [self.phoneView addGestureRecognizer:phoneTap];
    
    //pointView
    UITapGestureRecognizer *pointTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pointClickButton)];
    [self.pointView addGestureRecognizer:pointTap];
    //xiangqingview
    UITapGestureRecognizer* jinduview=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(xiangqingaction)];
    self.jinduview.userInteractionEnabled=YES;
    [self.jinduview addGestureRecognizer:jinduview];
}

#pragma mark -
-(void)xiangqingaction
{
    JinDuViewController * vc=[JinDuViewController new];
    vc.sid=self.sid;
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)leftClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightClick{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"新浪微博", @"腾讯微博",nil];
    [sheet showInView:self.view];
}

-(void)pointClickButton{
//    NSLog(@"tap");
//    MapBigViewController *mapCtl = [[MapBigViewController alloc]init];
//    
//    //没有经纬度返回参数；
//    NSDictionary *dic1=[NSDictionary dictionaryWithObjectsAndKeys:@"22.5583",@"latitude",@"114.0988",@"longitude",nil];
//    
//    [mapCtl.pointArry setArray: [NSArray arrayWithObjects:dic1, nil]];
//    [self.navigationController pushViewController:mapCtl animated:YES];
}

-(void)mphoneTapGest{
    //@"0755 - 82438858"
    UIAlertView*alert = [[UIAlertView alloc]initWithTitle:nil
                                                  message:@"0755 - 82438858"
                                                 delegate:self
                                        cancelButtonTitle:@"取消"
                                        otherButtonTitles:@"呼叫", nil];
    [alert show];
}

-(void)photoViewClick{
    FGalleryViewController *fgCtl = [[FGalleryViewController alloc]initWithPhotoSource:self];
    self.tabBarController.hidesBottomBarWhenPushed = YES;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController:fgCtl animated:YES];
}

#pragma mark tableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [contentview.guestbook_cont count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   RewardContentCell *oneCell = [tableView dequeueReusableCellWithIdentifier:@"rewardContentCell"];
    if (oneCell == nil) {
        oneCell = [[[NSBundle mainBundle]loadNibNamed:@"RewardContentCell" owner:self options:nil]lastObject];
    }
    NSDictionary* dic=contentview.guestbook_cont[indexPath.row];
    oneCell.reviewsname.text=[dic objectForKey:@"username"];
    oneCell.reviewstime.text=[dic objectForKey:@"dateline"];
    oneCell.reviewscontent.text=[dic objectForKey:@"content"];
    return oneCell;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}

#pragma mark FGalleryViewControllerDelegate

- (int)numberOfPhotosForPhotoGallery:(FGalleryViewController *)gallery
{
    return [networkImages count];
}

- (FGalleryPhotoSourceType)photoGallery:(FGalleryViewController *)gallery sourceTypeForPhotoAtIndex:(NSUInteger)index
{
	return FGalleryPhotoSourceTypeNetwork;
}

- (NSString*)photoGallery:(FGalleryViewController *)gallery urlForPhotoSize:(FGalleryPhotoSize)size atIndex:(NSUInteger)index {
    return [networkImages objectAtIndex:index];
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)missonButtonClick:(id)sender {
    ShenqingViewController *shenqingCtl = [[ShenqingViewController alloc]initWithNibName:@"ShenqingViewController" bundle:nil];
    shenqingCtl.sid=[contentview.sid intValue];
    [self.navigationController pushViewController:shenqingCtl animated:YES];
}

- (IBAction)askBUttonClick:(id)sender {
    zhixunViewController *zixunCtl = [[zhixunViewController alloc]initWithNibName:@"zhixunViewController" bundle:nil];
    zixunCtl.sid=[contentview.sid intValue];
    [self.navigationController pushViewController:zixunCtl animated:YES];
}
@end
