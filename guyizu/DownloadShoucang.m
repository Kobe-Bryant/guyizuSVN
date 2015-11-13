//
//  DownloadShoucang.m
//  谷蚁族
//
//  Created by lanye on 13-12-30.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "DownloadShoucang.h"
#define HTTP_URL @"http://www.guyizu.com/item.php?act=subject&meth=favorite_business"
#define HTTP_TASK_URL @"http://www.guyizu.com/item.php?act=subject&meth=favorite_task"
@implementation DownloadShoucang
@synthesize taskmutableArry = _taskmutableArry;
- (id)init
{
    self = [super init];
    if (self) {
        _mutableArry = [[NSMutableArray alloc]initWithCapacity:0];
        _taskmutableArry = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}


static DownloadShoucang *shoucang = nil;
+(DownloadShoucang *)shareDownload
{
    if (shoucang == nil) {
        shoucang = [[DownloadShoucang alloc]init];
    }
    return shoucang;
}

-(void)startDownload
{
    if (_mutableArry.count == 0) {
        NSString *uidStr = [[NSUserDefaults standardUserDefaults]objectForKey:@"uid"];
        NSString *httpStr = [HTTP_URL stringByAppendingFormat:@"&%@",uidStr];
        LHYHTTPRequest *sendrequest = [[LHYHTTPRequest alloc]initWith:httpStr];
        sendrequest.delegate = self;
    }else{
        [self secendDownload];
    }

}

-(void)starttaskDownload
{
    if (_taskmutableArry.count == 0) {
        NSString *uidStr = [[NSUserDefaults standardUserDefaults]objectForKey:@"uid"];
        NSString *httpStr = [HTTP_TASK_URL stringByAppendingFormat:@"&uid=%@&lng=102.03310&lat=25.12680",uidStr];
        taskrequest = [[LHYHTTPRequest alloc]initWith:httpStr];
        taskrequest.delegate = self;
    }else
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"shoucangtaskDownloadOver" object:nil];
    }
}


-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest
{
    if (mLHYHTTPRequest ==taskrequest) {
        NSMutableDictionary *taskDic = [send objectForKey:@"data"];
        for (int j = 0; j<taskDic.count; j++) {
            NSMutableDictionary *tDic = [[send objectForKey:@"data"]objectAtIndex:j];
            messageModel *this = [[messageModel alloc]init];
            this.taskaddtime = [tDic objectForKey:@"addtime"];
            this.taskname = [tDic objectForKey:@"name"];
            this.taskstatus = [tDic objectForKey:@"status"];
            this.taskc_price = [tDic objectForKey:@"c_price"];
            this.taskthumb = [tDic objectForKey:@"thumb"];
            this.taskdistance = [tDic objectForKey:@"distance"];
            this.taskguestbooks = [tDic objectForKey:@"guesbooks"];
            this.taskc_apply_num = [tDic objectForKey:@"c_apply_num"];
            [_taskmutableArry addObject:this];
        }
         [[NSNotificationCenter defaultCenter] postNotificationName:@"shoucangtaskDownloadOver" object:nil];
       }
    else{
    NSDictionary *mdic = [send objectForKey:@"data"];
    for (int i=0 ; i<mdic.count; i++) {
        NSDictionary *msid = [[send objectForKey:@"data"] objectAtIndex:i];
        messageModel *thisModel = [[messageModel alloc]init];
        thisModel.addtime = [msid objectForKey:@"addtime"];
        thisModel.pageviews = [msid objectForKey:@"pageviews"];
        thisModel.name = [msid objectForKey:@"name"];
        thisModel.content = [msid objectForKey:@"content"];
        thisModel.thumb = [msid objectForKey:@"thumb"];
        thisModel.sid = [msid objectForKey:@"sid"];
        [_mutableArry addObject:thisModel];
    }
    
    [self secendDownload];
    }
    
}

-(void)secendDownload
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"shoucangDownloadOver" object:nil];

}

@end
