//
//  ContentViewController.m
//  guyizu
//
//  Created by 蓝叶软件 on 11/23/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import "ContentViewController.h"
#import "FGalleryViewController.h"
#import "MapBigViewController.h"
#import "DownloadListView.h"
#import "ContentView.h"
#import "ContentCell.h"
#import "DianPingViewController.h"
#import "UIImageView+WebCache.h"
#import "DengluViewController.h"
@interface ContentViewController ()
{
    NSMutableArray* array;
    DownloadListView* downloadlistview;
    ContentView* contentview;
    UIImageView *photoView;
    NSMutableArray* rowarray;
    NSMutableArray* picarray;
    BOOL iskong;
}
@end

@implementation ContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}
-(void)showaction
{
    contentview=array[0];
    NSLog(@"name=%@",contentview.name);
    [photoView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.guyizu.com/%@",contentview.thumb]]];
    //photoView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.guyizu.com/%@",contentview.thumb]]]];
    _namelable.text=contentview.name;
    switch ([contentview.star intValue]) {
        case 0:
            _starimageone.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            _starimagetwo.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            _starimagethree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            _starimagefour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            _starimagefive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            break;
        case 1:
            _starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
            _starimagetwo.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            _starimagethree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            _starimagefour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            _starimagefive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            break;
        case 2:
            _starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
            _starimagetwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
            _starimagethree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            _starimagefour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            _starimagefive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            break;
        case 3:
            _starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
            _starimagetwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
            _starimagethree.image=[UIImage imageNamed:@"life_score_full_one.png"];
            _starimagefour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            _starimagefive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            break;
        case 4:
            _starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
            _starimagetwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
            _starimagethree.image=[UIImage imageNamed:@"life_score_full_one.png"];
            _starimagefour.image=[UIImage imageNamed:@"life_score_full_one.png"];
            _starimagefive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            break;
        case 5:
            _starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
            _starimagetwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
            _starimagethree.image=[UIImage imageNamed:@"life_score_full_one.png"];
            _starimagefour.image=[UIImage imageNamed:@"life_score_full_one.png"];
            _starimagefive.image=[UIImage imageNamed:@"life_score_full_one.png"];
            break;
        default:
            break;
    }
    _pricelable.text=[NSString stringWithFormat:@"¥%@",contentview.avgprice];
    _addresslable.text=contentview.address;
    _c_addresslable.text=contentview.c_address;
    if([contentview.c_tel isEqualToString:@"无"] || [contentview.c_tel isEqualToString:@""])
    {
        iskong=YES;
        _tellable.text=@"没有电话号码";
    }
    else
    {
        iskong=NO;
        _tellable.text=contentview.c_tel;
    }
    downloadlistview.iscontentview=NO;
    if([[NSString stringWithFormat:@"%@",contentview.reviews_cont] isEqualToString:@"<null>"] || [[NSString stringWithFormat:@"%@",contentview.reviews_cont] isEqualToString:@"(null)"])
    {
         _talknumberlable.text=[NSString stringWithFormat:@"(共0条)"];
    }
    else
    {
        _talknumberlable.text=[NSString stringWithFormat:@"(共%d条)",[contentview.reviews_cont count]];
        //pinglun
        pinglunTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 298, 320,150+350*[contentview.reviews_cont count]) style:UITableViewStylePlain];
        [self.mBigScrollView setContentSize:CGSizeMake(320, 700+(350*[contentview.reviews_cont count]-1))];
    }
    pinglunTableView.dataSource = self;
    pinglunTableView.delegate = self;
    pinglunTableView.scrollEnabled = NO;
    UIView* pinglunbackview=[[UIView alloc]init];
    pinglunTableView.backgroundColor=[UIColor clearColor];
    [pinglunTableView setTableFooterView:pinglunbackview];
    [self.mBigScrollView addSubview:pinglunTableView];
    [pinglunTableView reloadData];
    // Custom initialization
    //图片框；
    for(NSDictionary* dic in contentview.picture)
    {
       [picarray addObject:[NSString stringWithFormat:@"http://www.guyizu.com/%@",[dic objectForKey:@"thumb"]]];
        [picarray addObject:[NSString stringWithFormat:@"http://www.guyizu.com/%@",[dic objectForKey:@"filename"]]];
    }
    networkImages=[NSArray arrayWithArray:picarray];
    networkCaptions = [[NSArray alloc] initWithObjects:@" ",nil];
}
-(void)notificationaction:(NSNotification*)sender
{
    array=sender.object;
    NSLog(@"array=%@",array);
    //从接口中获取数据；
    [self performSelectorOnMainThread:@selector(showaction) withObject:Nil waitUntilDone:NO];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"hometolistview" object:Nil];
}
-(void)viewWillAppear:(BOOL)animated
{
    array=[NSMutableArray new];
    downloadlistview=[DownloadListView shareDownload];
    downloadlistview.iscontentview=YES;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationaction:) name:@"hometolistview" object:nil];
    [downloadlistview startDownload:_sid];
    contentview=[ContentView new];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    iskong=NO;
    picarray=[NSMutableArray new];
    rowarray=[NSMutableArray new];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"内容页"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
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
    
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    //bigScollView
    self.mBigScrollView.contentSize = CGSizeMake(320, 800);
    
    //phone
    UITapGestureRecognizer *phoneTapGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(mphoneTapGest)];
    [self.mPhoneView addGestureRecognizer:phoneTapGest];
    
    
    //photo
    UITapGestureRecognizer *photoTapGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(photoViewClick)];
    photoView = [[UIImageView alloc]initWithFrame:CGRectMake(7, 7, 92, 70)];
    photoView.userInteractionEnabled = YES;
    self.boxView.userInteractionEnabled = YES;
    [self.boxView addGestureRecognizer:photoTapGest];
    [self.boxView addSubview:photoView];
    //pointView
    UITapGestureRecognizer *pointTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pointClickButton)];
    [self.pointView addGestureRecognizer:pointTap];
    //dianping view
    UITapGestureRecognizer* dianping=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dianpingaction)];
    [self.dianPingView addGestureRecognizer:dianping];
    
}

#pragma mark -
#pragma mark uitableViewDataSource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(![[NSString stringWithFormat:@"%@",contentview.reviews_cont] isEqualToString:@"<null>"])
    {
    NSDictionary* dicone=contentview.reviews_cont[indexPath.row];
    NSString* string=[dicone objectForKey:@"content"];
    int row;
    row=string.length/19.0-2;
    int  height=row*20;
    if(height<0)
    {
        height=0;
    }
    NSString* str=[NSString stringWithFormat:@"%d",height];
    [rowarray addObject:str];
    return 150.0+height;
    }
    return 150.0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if([[NSString stringWithFormat:@"%@",contentview.reviews_cont] isEqualToString:@"<null>"])
    {
        return  0;
    }
    return [contentview.reviews_cont count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ContentCell* oneCell = [tableView dequeueReusableCellWithIdentifier:@"ContentCell"];
    if (oneCell == nil) {
        oneCell = [[[NSBundle mainBundle]loadNibNamed:@"contentCell" owner:self options:nil]lastObject];
    }
    if(![[NSString stringWithFormat:@"%@",contentview.reviews_cont] isEqualToString:@"<null>"])
    {
    NSDictionary* dicone=contentview.reviews_cont[indexPath.row];
    oneCell.username.text=[dicone objectForKey:@"username"];
    NSLog(@"username=%@",oneCell.username.text);
    oneCell.time.text=[dicone objectForKey:@"posttime"];
    oneCell.time.frame=CGRectMake(14, 120+[[rowarray objectAtIndex:indexPath.row] intValue], 148, 21);
    oneCell.content.text=[dicone objectForKey:@"content"];
    oneCell.content.frame=CGRectMake(14, 55, 286, 65+[[rowarray objectAtIndex:indexPath.row] intValue]);
    switch ([[dicone objectForKey:@"sort1"] intValue]) {
        case 0:
            oneCell.starimageone.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            oneCell.starimagetwo.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            oneCell.starimagethree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            oneCell.starimagefour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            oneCell.starimagefive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            break;
        case 1:
            oneCell.starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
            oneCell.starimagetwo.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            oneCell.starimagethree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            oneCell.starimagefour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            oneCell.starimagefive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            break;
        case 2:
            oneCell.starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
            oneCell.starimagetwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
            oneCell.starimagethree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            oneCell.starimagefour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            oneCell.starimagefive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            break;
        case 3:
            oneCell.starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
            oneCell.starimagetwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
            oneCell.starimagethree.image=[UIImage imageNamed:@"life_score_full_one.png"];
            oneCell.starimagefour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            oneCell.starimagefive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            break;
        case 4:
           oneCell.starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
           oneCell.starimagetwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
            oneCell.starimagethree.image=[UIImage imageNamed:@"life_score_full_one.png"];
            oneCell.starimagefour.image=[UIImage imageNamed:@"life_score_full_one.png"];
            oneCell.starimagefive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
            break;
        case 5:
            oneCell.starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
            oneCell.starimagetwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
            oneCell.starimagethree.image=[UIImage imageNamed:@"life_score_full_one.png"];
            oneCell.starimagefour.image=[UIImage imageNamed:@"life_score_full_one.png"];
            oneCell.starimagefive.image=[UIImage imageNamed:@"life_score_full_one.png"];
            break;
        default:
            break;
    }
    }
    return oneCell;
}

#pragma mark uitableViewDelegate
#pragma mark -
#pragma selfClick
-(void)dianpingaction
{
    //点评需要做的事情；
    DianPingViewController* vc=[DianPingViewController new];
    vc.sid=_sid;
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)pointClickButton{
    MapBigViewController *mapCtl = [[MapBigViewController alloc]init];
    NSDictionary *dic1=[NSDictionary dictionaryWithObjectsAndKeys:contentview.map_lat,@"latitude",contentview.map_lng,@"longitude",nil];
    NSLog(@"array=%@",array);
    mapCtl.array=array;
    mapCtl.iscontentview=YES;
    [mapCtl.pointArry setArray: [NSArray arrayWithObjects:dic1, nil]];
    [self.navigationController pushViewController:mapCtl animated:YES];
}

-(void)shoucangClick{
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

-(void)photoViewClick{
    FGalleryViewController *fgCtl = [[FGalleryViewController alloc]initWithPhotoSource:self];
    [self.navigationController pushViewController:fgCtl animated:YES];
}

-(void)mphoneTapGest{
    //@"0755 - 82438858"

    if(iskong==NO)
    {
    UIAlertView*alert = [[UIAlertView alloc]initWithTitle:nil
                                                  message:contentview.c_tel
                                                 delegate:self
                                        cancelButtonTitle:@"取消"
                                        otherButtonTitles:@"呼叫", nil];
    [alert show];
    }
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    NSLog(@"%d",buttonIndex);
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://82438858"]];
    }
}

-(void)rightClick{
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"新浪微博", @"腾讯微博",nil];
    [sheet showInView:self.view];
}

-(void)leftClick{
    [self.navigationController popViewControllerAnimated:YES];
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

@end
