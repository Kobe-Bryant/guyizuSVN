//
//  DownloadmimaModel.m
//  谷蚁族
//
//  Created by lanye on 13-12-27.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "DownloadmimaModel.h"
#define HTTP_URL @"http://www.guyizu.com/member.php?act=login_in&meth=password_edit"
@implementation DownloadmimaModel
@synthesize passDic = _passDic;
- (id)init
{
    self = [super init];
    if (self) {
        _passDic = [[NSMutableDictionary alloc]initWithCapacity:0];
    }
    return self;
}

static DownloadmimaModel *mima = nil;
+(DownloadmimaModel *)shareDownload
{
    if (mima == nil) {
        mima = [[DownloadmimaModel alloc]init];
    }
    return mima;
}



-(void)startDownload:(NSString *)uid old:(NSString *)old new1:(NSString *)new1 new2:(NSString *)new2
{
    NSString *httpStr = [HTTP_URL stringByAppendingFormat:@"&uid=%@&old=%@&new=%@&new2=%@",uid,old,new1,new2];
    LHYHTTPRequest *request = [[LHYHTTPRequest alloc]initWith:httpStr];
    request.delegate = self;
    
}

-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest
{
    [_passDic setDictionary:(NSDictionary *)send];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"mimaDownloadOver" object:nil];
}


@end
