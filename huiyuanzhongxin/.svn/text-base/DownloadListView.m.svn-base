//
//  DownloadListView.m
//  谷蚁族
//
//  Created by Macsyf on 13-12-23.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "DownloadListView.h"
#import "ListView.h"
#import "ContentView.h"
#import "ReWardView.h"
#import "ReWardContentView.h"
#import "ReWardJinDuView.h"
#import "LHYHTTPRequest.h"
#define HTTP_URL @"http://www.guyizu.com/item.php?act=subject&meth=nearby_business"
#define HTTP_otherURL @"http://www.guyizu.com/item.php?act=subject&meth=nearby_life"
#define HTTP_contentURL @"http://www.guyizu.com/item.php?act=subject&meth=get_detail"
#define HTTP_rewardURL @"http://www.guyizu.com/item.php?act=subject&meth=task_list"
#define HTTP_rewardcontentURL @"http://www.guyizu.com/item.php?act=subject&meth=task_detail"
#define HTTP_rewardjinduURL @"http://www.guyizu.com/item.php?act=subject&meth=task_progress"
#define HTTP_shoucangURL @"http://www.guyizu.com/item.php?act=subject&meth=add_favorite"
@implementation DownloadListView
@synthesize mutableArry = _mutableArry;
DownloadListView *downloadlistview = nil;
- (id)init
{
    self = [super init];
    if (self) {
        _mutableArry = [[NSMutableArray alloc]initWithCapacity:0];
        _iscontentview=NO;
        _isrewardlistview=NO;
        _isrewardcontentview=NO;
        _isrewardjinduview=NO;
        _isshouchang=NO;
    }
    return self;
}
+(DownloadListView *)shareDownload{
    if (downloadlistview == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            downloadlistview = [[DownloadListView alloc]init];
        });
    }
    return downloadlistview;
}

#pragma mark download
-(void)startotherDownload:(int)city Sortcat:(int)sortcat Catid:(int)catid sorttime:(int)sorttime sortdis:(int)sortdis page:(int)page
{
    _mutableArry=[NSMutableArray new];
    _iscontentview=NO;
    _isrewardlistview=NO;
    _isrewardcontentview=NO;
    _isrewardjinduview=NO;
    _isshouchang=NO;
    //网络数据下载
    if ([_mutableArry count] == 0) {
        NSString *otherhttpStr = [HTTP_otherURL stringByAppendingFormat:@"&city=%d&sort_cat=%d&catis=%d&sort_time=%d&sort_dis=%d&page=%d",city,sortcat,catid,sorttime,sortdis,page];
        NSLog(@"otherhttp=%@",otherhttpStr);
        LHYHTTPRequest *sendReaquest = [[LHYHTTPRequest alloc]initWith:otherhttpStr];
        sendReaquest.delegate = self;
    }else{
        [self secendDownload];
    }

}
-(void)startrewardjinduDownload:(int)sid
{
    _mutableArry=[NSMutableArray new];
    _iscontentview=NO;
    _isrewardlistview=NO;
    _isrewardcontentview=NO;
    _isrewardjinduview=YES;
    _isshouchang=NO;
    //网络数据下载
    if ([_mutableArry count] == 0) {
        NSString *otherhttpStr = [HTTP_rewardjinduURL stringByAppendingFormat:@"&sid=%d",sid];
        NSLog(@"http=%@",otherhttpStr);
        LHYHTTPRequest *sendReaquest = [[LHYHTTPRequest alloc]initWith:otherhttpStr];
        sendReaquest.delegate = self;
    }else{
        [self secendDownload];
    }
}
-(void)startrewardDownload:(int)sid
{
    _mutableArry=[NSMutableArray new];
    _iscontentview=NO;
    _isrewardlistview=NO;
    _isrewardcontentview=YES;
    _isrewardjinduview=NO;
    _isshouchang=NO;
    //网络数据下载
    if ([_mutableArry count] == 0) {
        NSString *otherhttpStr = [HTTP_rewardcontentURL stringByAppendingFormat:@"&sid=%d",sid];
        NSLog(@"ohterhttp=%@",otherhttpStr);
        LHYHTTPRequest *sendReaquest = [[LHYHTTPRequest alloc]initWith:otherhttpStr];
        sendReaquest.delegate = self;
    }else{
        [self secendDownload];
    }
}
-(void)startrewardDownload:(float)lng latposition:(float)lat Sortcat:(int)sortcat Sorttime:(int)sorttime Sortdis:(int)sortdis
{
    _mutableArry=[NSMutableArray new];
    _iscontentview=NO;
    _isrewardlistview=YES;
    _isrewardcontentview=NO;
    _isrewardjinduview=NO;
    _isshouchang=NO;
    //网络数据下载
    if ([_mutableArry count] == 0) {
        NSString *otherhttpStr = [HTTP_rewardURL stringByAppendingFormat:@"&lng=%f&lat=%f&sort_cat=%d&sort_time=%d&sort_dis=%d",lng,lat,sortcat,sorttime,sortdis];
        NSLog(@"http=%@",otherhttpStr);
        LHYHTTPRequest *sendReaquest = [[LHYHTTPRequest alloc]initWith:otherhttpStr];
        sendReaquest.delegate = self;
    }else{
        [self secendDownload];
    }

}
-(void)startotherDownload:(float)lng latposition:(float)lat Sortcat:(int)sortcat Sorttime:(int)sorttime Sortdis:(int)sortdis
{
    _mutableArry=[NSMutableArray new];
    _iscontentview=NO;
    _isrewardlistview=NO;
    _isrewardcontentview=NO;
    _isrewardjinduview=NO;
    _isshouchang=NO;
    //网络数据下载
    if ([_mutableArry count] == 0) {
        NSString *otherhttpStr = [HTTP_otherURL stringByAppendingFormat:@"&lng=%f&lat=%f&sort_cat=%d&sort_time=%d&sort_dis=%d",lng,lat,sortcat,sorttime,sortdis];
        NSLog(@"ohterhttp=%@",otherhttpStr);
        LHYHTTPRequest *sendReaquest = [[LHYHTTPRequest alloc]initWith:otherhttpStr];
        sendReaquest.delegate = self;
    }else{
        [self secendDownload];
    }
}
-(void)startDownload:(float)lng latposition:(float)lat
{
     _mutableArry=[NSMutableArray new];
    _iscontentview=NO;
    _isrewardlistview=NO;
    _isrewardcontentview=NO;
    _isrewardjinduview=NO;
    _isshouchang=NO;
    //网络数据下载
    if ([_mutableArry count] == 0) {
        NSString *httpStr = [HTTP_URL stringByAppendingFormat:@"&lng=%f&lat=%f",lng,lat];
        NSLog(@"http=%@",httpStr);
        LHYHTTPRequest *sendReaquest = [[LHYHTTPRequest alloc]initWith:httpStr];
        sendReaquest.delegate = self;
    }else{
        [self secendDownload];
    }
}
-(void)startshouchangDownload:(int)sid
{
    _mutableArry=[NSMutableArray new];
    _iscontentview=NO;
    _isrewardlistview=NO;
    _isrewardcontentview=NO;
    _isrewardjinduview=NO;
    _isshouchang=YES;
    //网络数据下载
    if ([_mutableArry count] == 0) {
        NSString *contenthttpStr = [HTTP_shoucangURL stringByAppendingFormat:@"&sid=%d",sid];
        NSLog(@"shouchanghttp=%@",contenthttpStr);
        LHYHTTPRequest *sendReaquest = [[LHYHTTPRequest alloc]initWith:contenthttpStr];
        sendReaquest.delegate = self;
    }
}
-(void)startDownload:(int)sid
{
    _mutableArry=[NSMutableArray new];
    _iscontentview=YES;
    _isrewardlistview=NO;
    _isrewardcontentview=NO;
    _isrewardjinduview=NO;
    _isshouchang=NO;
    //网络数据下载
    if ([_mutableArry count] == 0) {
        NSString *contenthttpStr = [HTTP_contentURL stringByAppendingFormat:@"&id=%d",sid];
        NSLog(@"contenthttp=%@",contenthttpStr);
        LHYHTTPRequest *sendReaquest = [[LHYHTTPRequest alloc]initWith:contenthttpStr];
        sendReaquest.delegate = self;
    }else{
        [self secendDownload];
    }
}
-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest{
    
    if(_isshouchang==YES)
    {
        _shouchangstate=[[send objectForKey:@"status"] intValue];
       NSString* _msgstring=[send objectForKey:@"msg"];
        NSLog(@"msgstring=%@",_msgstring);
        [_mutableArry addObject:_msgstring];
    }
    else if(_isrewardjinduview==YES)
    {
        NSDictionary *mDic = [send objectForKey:@"data"];
        if(![mDic isEqual:@""])
        {
        ReWardJinDuView *thisModel = [[ReWardJinDuView alloc]init];
        thisModel.publish_time=[mDic objectForKey:@"publish_time"];
        thisModel.apply_time=[mDic objectForKey:@"apply_time"];
        thisModel.select_time=[mDic objectForKey:@"select_time"];
        thisModel.finish_time=[mDic objectForKey:@"finish_time"];
        thisModel.end_time=[mDic objectForKey:@"end_time"];
        [_mutableArry addObject:thisModel];
        }
    }
    else if(_isrewardlistview==YES)
    {
        NSArray *arr1 = [send objectForKey:@"data"];
        NSLog(@"arr=%@",arr1);
        if(![arr1 isEqual:@""])
        {
        for (NSDictionary *mDic in arr1) {
            ReWardView *thisModel = [[ReWardView alloc]init];
            thisModel.sid = [mDic objectForKey:@"sid"];
            thisModel.name = [mDic objectForKey:@"name"];
            thisModel.catid = [mDic objectForKey:@"catid"];
            thisModel.c_price=[mDic objectForKey:@"c_price"];
            thisModel.thumb=[mDic objectForKey:@"thumb"];
            thisModel.c_address=[mDic objectForKey:@"c_address"];
            thisModel.reviews=[mDic objectForKey:@"reviews"];
            thisModel.distance=[mDic objectForKey:@"distance"];
            thisModel.task_type=[mDic objectForKey:@"task_type"];
            thisModel.is_selected=[mDic objectForKey:@"is_selected"];
            thisModel.c_apply_num=[mDic objectForKey:@"c_apply_num"];
            thisModel.finish_time=[mDic objectForKey:@"finish_time"];
            [_mutableArry addObject:thisModel];
        }
        }
    
    }
    else if(_isrewardcontentview==YES)
    {
        NSDictionary *mDic = [send objectForKey:@"data"];
        if(![mDic isEqual:@""])
        {
        ReWardContentView *thisModel = [[ReWardContentView alloc]init];
        thisModel.sid = [mDic objectForKey:@"sid"];
        thisModel.name = [mDic objectForKey:@"name"];
        thisModel.catid = [mDic objectForKey:@"catid"];
        thisModel.c_price=[mDic objectForKey:@"c_price"];
        thisModel.thumb=[mDic objectForKey:@"thumb"];
        thisModel.c_address=[mDic objectForKey:@"c_address"];
        thisModel.reviews=[mDic objectForKey:@"reviews"];
        thisModel.aid=[mDic objectForKey:@"aid"];
        thisModel.addtime=[mDic objectForKey:@"addtime"];
        thisModel.content=[mDic objectForKey:@"is_selected"];
        thisModel.c_apply_num=[mDic objectForKey:@"c_apply_num"];
        thisModel.c_finish_time=[mDic objectForKey:@"c_finish_time"];
        thisModel.category=[mDic objectForKey:@"category"];
        thisModel.creator=[mDic objectForKey:@"creator"];
        thisModel.cuid=[mDic objectForKey:@"cuid"];
        thisModel.content=[mDic objectForKey:@"content"];
        thisModel.picture=[mDic objectForKey:@"picture"];
        thisModel.c_use_price=[mDic objectForKey:@"c_use_price"];
        thisModel.guestbook_cont=[mDic objectForKey:@"guestbooks_cont"];
        [_mutableArry addObject:thisModel];
        }
    }
    else  if(_iscontentview==YES)
    {
            NSDictionary *mDic = [send objectForKey:@"data"];
        if(![mDic isEqual:@""])
        {
           ContentView *thisModel = [[ContentView alloc]init];
            thisModel.sid = [mDic objectForKey:@"sid"];
            thisModel.name = [mDic objectForKey:@"name"];
            thisModel.star = [mDic objectForKey:@"star"];
            thisModel.avgprice=[mDic objectForKey:@"avgprice"];
            thisModel.thumb=[mDic objectForKey:@"thumb"];
            thisModel.c_address=[mDic objectForKey:@"c_address"];
            thisModel.address=[mDic objectForKey:@"address"];
            thisModel.map_lng=[mDic objectForKey:@"map_lng"];
            thisModel.map_lat=[mDic objectForKey:@"map_lat"];
            thisModel.content=[mDic objectForKey:@"content"];
            thisModel.picture=[mDic objectForKey:@"picture"];
            thisModel.c_tel=[mDic objectForKey:@"c_tel"];
            thisModel.reviews_cont=[mDic objectForKey:@"reviews_cont"];
            [_mutableArry addObject:thisModel];
        }
    }
    else
    {
        NSArray *arr1 = [send objectForKey:@"data"];
        //NSLog(@"arr1=%@",arr1);
        if(![arr1 isEqual:@""])
        {
        for (NSDictionary *mDic in arr1) {
            ListView *thisModel = [[ListView alloc]init];
            thisModel.sid = [mDic objectForKey:@"sid"];
            thisModel.name = [mDic objectForKey:@"name"];
            thisModel.star = [mDic objectForKey:@"star"];
            thisModel.avgprice=[mDic objectForKey:@"avgprice"];
            thisModel.thumb=[mDic objectForKey:@"thumb"];
            thisModel.c_address=[mDic objectForKey:@"c_address"];
            thisModel.address=[mDic objectForKey:@"address"];
            thisModel.distance=[mDic objectForKey:@"distance"];
            thisModel.map_lng=[mDic objectForKey:@"map_lng"];
            thisModel.map_lat=[mDic objectForKey:@"map_lat"];
            [_mutableArry addObject:thisModel];
        }
        }
    }
    [self secendDownload];
}

#pragma mark Secend

-(void)secendDownload{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hometolistview" object:self.mutableArry];
}

@end
