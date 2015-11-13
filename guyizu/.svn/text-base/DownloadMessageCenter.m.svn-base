//
//  DownloadMessageCenter.m
//  谷蚁族
//
//  Created by lanye on 13-12-21.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "DownloadMessageCenter.h"
#define HTTP_URL @"http://www.guyizu.com/member.php?act=login_in&meth=message_center"

@implementation DownloadMessageCenter
@synthesize mutableArry = _mutableArry;
- (id)init
{
    self = [super init];
    if (self) {
        _mutableArry = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}


DownloadMessageCenter *messagecenter = nil;
+(DownloadMessageCenter *)shareDownload{
    if (messagecenter == nil) {
        messagecenter = [[DownloadMessageCenter alloc]init];
       
    }
    return messagecenter;
}

#pragma mark download

-(void)startDownload{
    //网络数据下载
    if ([_mutableArry count] == 0) {
        NSString *uidStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"];
        NSString *httpStr = [HTTP_URL stringByAppendingFormat:@"&uid=%@&page=1",uidStr];
        LHYHTTPRequest *sendReaquest = [[LHYHTTPRequest alloc]initWith:httpStr];
        sendReaquest.delegate = self;
    }else{
        [self secendDownload];
    }
}

-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest{
   NSArray *arr1 = [send objectForKey:@"data"];
    MessageCenterModel *thisModel = [[MessageCenterModel alloc]init];
    for (NSDictionary *mDic in arr1) {
         thisModel.posttime = [mDic objectForKey:@"posttime"];
         thisModel.message = [mDic objectForKey:@"new"];
        thisModel.content = [mDic objectForKey:@"content"];
        [_mutableArry addObject:thisModel];
    }

    [self secendDownload];
}

#pragma mark Secend

-(void)secendDownload{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"messagecenterDownloadOver" object:nil];
}



@end
