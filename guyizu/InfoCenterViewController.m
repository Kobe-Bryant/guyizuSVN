//
//  InfoCenterViewController.m
//  InfoCenter
//
//  Created by lanye on 13-12-5.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "InfoCenterViewController.h"
#import "AppDelegate.h"
#import "DownloadMessageCenter.h"
@interface InfoCenterViewController ()
{
    InfoCell *Info;
    int row;
    BOOL isselect;
}
@end

@implementation InfoCenterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    row=-1;
    isselect=NO;
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DownloadOver) name:@"messagecenterDownloadOver" object:nil];
    [[DownloadMessageCenter shareDownload]startDownload];
    
    //构建nav
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"信息中心"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    
    self.backscroll.contentSize = CGSizeMake(320, 710);
    
    Infotable = [[UITableView alloc]initWithFrame:CGRectMake(10, 10, 300,550) style:UITableViewStyleGrouped];
    Infotable.scrollEnabled = NO;
    Infotable.delegate =self;
    Infotable.dataSource = self;
    Infotable.sectionFooterHeight = 5.0;
    Infotable.sectionHeaderHeight = 5.0;
    [self.backscroll addSubview:Infotable];
    
    //修改ios6uitableview的背景颜色
    AppDelegate *homeApp = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (homeApp.isIos6) {
        
        UIView *backView = [[UIView alloc]init];
        [Infotable setBackgroundView:backView];
        [Infotable setBackgroundColor:[UIColor clearColor]];
    }
}

-(void)DownloadOver
{
    NSMutableArray *arr1 = [DownloadMessageCenter shareDownload].mutableArry;
    for (MessageCenterModel *thisModel in arr1) {
        _posttimeString = thisModel.posttime;
        _messageString = thisModel.message;
        _contentString = thisModel.content;
    }
    [Infotable reloadData];
    //UIWebView *web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320, 400)];
//     NSStringEncoding gbEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
//    NSData *htmlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:_contentString]];
//    NSString *htmlStr = [[NSString alloc] initWithData:htmlData encoding:gbEncoding] ;
    
    
//    
//    NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
//    NSString *temp = [_contentString stringByReplacingPercentEscapesUsingEncoding:encoding];
//    
//
//    
//    NSLog(@"%@",temp);
    
    
    
    
    
    
    
//    NSLog(@"%@", _contentString);
//    [web loadData:data MIMEType:@"text/html" textEncodingName:@"NSUTF8StringEncoding" baseURL:nil];
    
   // [self.backscroll addSubview:web];
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1.0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     Info = [tableView dequeueReusableCellWithIdentifier:@"InfoCell"];
    if (Info ==nil) {
        Info = [[[NSBundle mainBundle]loadNibNamed:@"InfoCell" owner:self options:nil]lastObject];
        Info.selectedBackgroundView.frame = CGRectMake(0, 0, 300, 120);
        Info.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 去掉圆角边框
        Info.selectionStyle = UITableViewCellSelectionStyleGray;//设置点击颜色为灰色
        Info.selectedBackgroundView.frame = CGRectMake(0, 0, 300, 120);//背景颜色的范围
        Info.layer.borderWidth = 0.5f;
        Info.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        redLab = [[UILabel alloc]initWithFrame:CGRectMake(14, 11, 14, 20)];
        redLab.text = @"●";
        redLab.textColor = [UIColor redColor];
        redLab.textAlignment = NSTextAlignmentLeft;
        redLab.font = [UIFont systemFontOfSize:17.0];
        [Info.contentView addSubview:redLab];
        
        titleLab = [[UILabel alloc]initWithFrame:CGRectMake(30, 11, 91, 21)];
        titleLab.text = @"优惠券信息";
        titleLab.textColor = [UIColor blackColor];
        titleLab.font = [UIFont systemFontOfSize:16.0];
        titleLab.textAlignment = NSTextAlignmentLeft;
        [Info.contentView addSubview:titleLab];
        Info.tag=indexPath.section;
        }
        if(isselect==NO)
        {
        Info.subtitlelable.text = _messageString;
        Info.subtitlelable.textColor = [UIColor orangeColor];
        }
        if(Info.tag==row)
        {
            Info.subtitlelable.text=@"已读";
            Info.subtitlelable.textColor = [UIColor colorWithRed:64/255.0 green:64/255.0 blue:64/255.0 alpha:1];
        }
    Info.timelable.text = _posttimeString;
    Info.contentlable.text = _contentString;
//    if (indexPath.section <2) {
//        titleLab.textColor = [UIColor blackColor];
//       
//    }else{
        Info.backgroundColor = [UIColor whiteColor];//设置背景颜色为白色
        titleLab.textColor = [UIColor colorWithRed:64/255.0 green:64/255.0 blue:64/255.0 alpha:1];
      
   // }
    return Info;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    isselect=YES;
    row=indexPath.section;
    [tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
