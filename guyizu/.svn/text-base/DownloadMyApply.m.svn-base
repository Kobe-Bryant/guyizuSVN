//
//  DownloadMyApply.m
//  谷蚁族
//
//  Created by lanye on 13-12-31.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "DownloadMyApply.h"
#define HTTP_URL @"http://www.guyizu.com/item.php?act=subject&meth=my_apply"
@implementation DownloadMyApply
@synthesize mutableArray =_mutableArray;
- (id)init
{
    self = [super init];
    if (self) {
        _mutableArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}

static DownloadMyApply *myapply =nil;
+(DownloadMyApply *)shareDownload
{
    if (myapply ==nil) {
        myapply = [[DownloadMyApply alloc]init];
    }
    return myapply;
}
-(void) startDownload
{
    if (_mutableArray.count == 0) {
        NSString *uidstr =[[NSUserDefaults standardUserDefaults]objectForKey:@"uid"];
        NSString *httpStr = [HTTP_URL stringByAppendingFormat:@"&uid=%@",uidstr];
        LHYHTTPRequest *sendrequest = [[LHYHTTPRequest alloc]initWith:httpStr];
        sendrequest.delegate = self;
    }else{
        [self secendDownload];
    }
}

-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest
{
    NSMutableDictionary *mDic = [send objectForKey:@"data"];
    for (int i=0; i<mDic.count; i++) {
        NSMutableDictionary *appDic = [[send objectForKey:@"data"]objectAtIndex:i];
        appleModel *apple = [[appleModel alloc]init];
        apple.name = [appDic objectForKey:@"name"];
        apple.sid = [appDic objectForKey:@"sid"];
        apple.thumb = [appDic objectForKey:@"thumb"];
        apple.c_price = [appDic objectForKey:@"c_price"];
        apple.apply_price = [appDic objectForKey:@"apply_price"];
        apple.addtime = [appDic objectForKey:@"addtime"];
        [_mutableArray addObject:apple];
    }
    [self secendDownload];
}

-(void)secendDownload
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"myapplyDownloadOver" object:nil];
}


@end
