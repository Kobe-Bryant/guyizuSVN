//
//  DownloadApplyCash.m
//  谷蚁族
//
//  Created by lanye on 13-12-30.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "DownloadApplyCash.h"
#define HTTP_URL @"http://www.guyizu.com/item.php?act=subject&meth=show_money&uid=43&sid=43"
#define HTTP_APPLY_URL @"http://www.guyizu.com/item.php?act=subject&meth=do_withdraw"

@implementation DownloadApplyCash
@synthesize mutableArry = _mutableArry;
- (id)init
{
    self = [super init];
    if (self) {
        _mutableArry = [[NSMutableArray alloc]initWithCapacity:0];
        _mutableDic = [[NSMutableDictionary alloc]initWithCapacity:0];
    }
    return self;
}

static DownloadApplyCash *applycash = nil;
+(DownloadApplyCash *)shareDownload
{
    if (applycash ==nil) {
        applycash = [[DownloadApplyCash alloc]init];
    }
    return applycash;
}


-(void)startDownload:(NSString *)uid sid:(NSString *)sid
{
    if (_mutableArry.count == 0) {
        //NSString *uidStr = [[NSUserDefaults standardUserDefaults]objectForKey:@"uid"];
        LHYHTTPRequest *sendrequest = [[LHYHTTPRequest alloc]initWith:HTTP_URL];
        sendrequest.delegate = self;
    }else{
        [self secendDownload];
    }
   
}

-(void)startDownload:(NSString *)sid bank:(NSString *)bank cardNum:(NSString *)cardNum account:(NSString *)account
{
    NSString *httpStr = [HTTP_APPLY_URL stringByAppendingFormat:@"&sid=%@&bank=%@&cardNum=%@&account=%@",sid,bank,cardNum,account];
    applysend = [[LHYHTTPRequest alloc]initWith:httpStr];
    applysend.delegate =self;
}

-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest
{
    
    if (mLHYHTTPRequest ==applysend) {
          [_mutableDic setDictionary:(NSDictionary *)send];
        [self secendDownload];
        return;
    }else{
    NSDictionary *dic = [send objectForKey:@"data"];
    applycashModel *thisModel = [[applycashModel alloc]init];
    thisModel.price = [dic objectForKey:@"price"];
    thisModel.remaining = [dic objectForKey:@"remaining"];
    [_mutableArry addObject:thisModel];
        [self secendDownload];
    }

}

-(void)secendDownload
{
 [[NSNotificationCenter defaultCenter] postNotificationName:@"applycashDownloadOver" object:nil];
    
}

@end
