//
//  DownloadCollectionMessage.m
//  谷蚁族
//
//  Created by lanye on 13-12-23.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "DownloadCollectionMessage.h"

#define HTTP_URL @"http://www.guyizu.com/item.php?act=subject&meth=favorite_business"
@implementation DownloadCollectionMessage
@synthesize mutableArry = _mutableArry;
- (id)init
{
    self = [super init];
    if (self) {
        _mutableArry = [[NSMutableArray alloc]initWithCapacity:0];
      
    }
    return self;
}


DownloadCollectionMessage *collectionmessage = nil;
+(DownloadCollectionMessage *)shareDownload{
    if (collectionmessage == nil) {
        collectionmessage = [[DownloadCollectionMessage alloc]init];
    }
    return collectionmessage;
}

#pragma mark download

-(void)startDownload{
    //网络数据下载
    if ([_mutableArry count] == 0) {
        NSString *uidStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"];
        NSString *httpStr = [HTTP_URL stringByAppendingFormat:@"&uid=%@",uidStr];
        LHYHTTPRequest *sendReaquest = [[LHYHTTPRequest alloc]initWith:httpStr];
        sendReaquest.delegate = self;
    }else{
        [self secendDownload];
    }
}

-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest{

    CollectionMessageModel *thisModel = [[CollectionMessageModel alloc]init];
    thisModel.msg = [send objectForKey:@"msg"];
    [_mutableArry addObject:thisModel];
    [self secendDownload];
}

#pragma mark Secend

-(void)secendDownload{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"collectionmessageDownloadOver" object:nil];
}



@end
