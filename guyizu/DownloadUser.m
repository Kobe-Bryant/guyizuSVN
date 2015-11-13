//
//  DownloadUser.m
//  谷蚁族
//
//  Created by Mac mini on 13-12-20.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "DownloadUser.h"

#define HTTP_URL @"http://www.guyizu.com/member.php?act=login_in&meth=m_member_info"

@implementation DownloadUser
@synthesize mutableArry = _mutableArry;
- (id)init
{
    self = [super init];
    if (self) {
        _mutableArry = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}

DownloadUser *userDown = nil;
+(DownloadUser *)shareDownload{
    if (userDown == nil) {
        userDown = [[DownloadUser alloc]init];
    }
    
    return userDown;
}

#pragma mark download

-(void)startDownload{
    //网络数据下载
        NSString *uidStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"];
        NSString *httpStr = [HTTP_URL stringByAppendingFormat:@"&uid=%@", uidStr];
        LHYHTTPRequest *sendReaquest = [[LHYHTTPRequest alloc]initWith:httpStr];
        sendReaquest.delegate = self;
    
}

-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest{
   // NSLog(@"%@",send);
    [_mutableArry removeAllObjects];
    NSDictionary *mDic = [send objectForKey:@"data"];
    
    UserModel *thisModel = [[UserModel alloc]init];
    thisModel.rmb = [mDic objectForKey:@"rmb"];
    thisModel.username = [mDic objectForKey:@"username"];
    thisModel.facepath = [mDic objectForKey:@"facepath"];
    thisModel.msgcount = [mDic objectForKey:@"msgcount"];
    thisModel.item_count = [mDic objectForKey:@"item_count"];
    thisModel.task_count = [mDic objectForKey:@"task_count"];
    thisModel.select_count = [mDic objectForKey:@"select_count"];
    thisModel.newmsg = [mDic objectForKey:@"newmsg"];
    [_mutableArry addObject:thisModel];
    
    [self secendDownload];
}
    

#pragma mark Secend

-(void)secendDownload{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"usercenterDownloadOver" object:nil];
}


@end
