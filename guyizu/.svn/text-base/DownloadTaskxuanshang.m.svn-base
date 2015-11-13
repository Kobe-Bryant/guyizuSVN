//
//  DownloadTaskxuanshang.m
//  谷蚁族
//
//  Created by lanye on 13-12-23.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "DownloadTaskxuanshang.h"
#define HTTP_URL @"http://www.guyizu.com/item.php?act=subject&meth=my_publish"
@implementation DownloadTaskxuanshang
@synthesize mutableArry = _mutableArry;
- (id)init
{
    self = [super init];
    if (self) {
        _mutableArry = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}

DownloadTaskxuanshang *task = nil;
+(DownloadTaskxuanshang *)shareDownload{
    if (task == nil) {
        task = [[DownloadTaskxuanshang alloc]init];
    }
    
    return task;
}

#pragma mark download

-(void)startDownload:(int)uid status:(int)status
{
    //网络数据下载
    if ([_mutableArry count] == 0) {
        NSString *httpStr = [HTTP_URL stringByAppendingFormat:@"&uid=%d&status=%d", uid,status];
        NSLog(@"http=%@",httpStr);
        LHYHTTPRequest *sendReaquest = [[LHYHTTPRequest alloc]initWith:httpStr];
        sendReaquest.delegate = self;
    }else{
        [self secendDownload];
    }
}

-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest{
  
    NSDictionary *mDic = [send objectForKey:@"data"];
    for (NSInteger i=0; i<mDic.count; i++) {
          //[_mutableArry removeAllObjects];
         NSDictionary *taskDic = [[send objectForKey:@"data"] objectAtIndex:i];
        Taskxuanshang *thisModel = [[Taskxuanshang alloc]init];
        thisModel.addtime = [taskDic objectForKey:@"addtime"];
        thisModel.c_price = [taskDic objectForKey:@"c_price"];
        thisModel.name = [taskDic objectForKey:@"name"];
        thisModel.thumb = [taskDic objectForKey:@"thumb"];
        thisModel.finish_time = [taskDic objectForKey:@"finish_time"];
        thisModel.status = [taskDic objectForKey:@"status"];
        thisModel.sid=[taskDic objectForKey:@"sid"];
        [_mutableArry addObject:thisModel];
    }
    [self secendDownload];
}


#pragma mark Secend

-(void)secendDownload{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"xuanshangDownloadOver" object:nil];
}


@end
