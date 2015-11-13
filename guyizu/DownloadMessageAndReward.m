//
//  DownloadMessageAndReward.m
//  谷蚁族
//
//  Created by lanye on 13-12-24.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "DownloadMessageAndReward.h"
#define HTTP_URL @"http://www.guyizu.com/member.php?act=login_in&meth=m_subject_release"

@implementation DownloadMessageAndReward

@synthesize passDic = _passDic;

- (id)init
{
    self = [super init];
    if (self) {
        _passDic = [[NSMutableDictionary alloc]initWithCapacity:0];
    }
    return self;
}

static DownloadMessageAndReward *fabuDownload = nil;
+(DownloadMessageAndReward *)shareDownload{
    if (fabuDownload == nil) {
        fabuDownload = [[DownloadMessageAndReward alloc]init];
    }
    
    return fabuDownload;
}

#pragma mark -

-(void)startDownload:(NSString *)cuid mid:(NSInteger)mid fatherID:(NSString *)fatherID sonID:(NSString *)sonID lng:(float)lng lat:(float) lat name:(NSString *)name price:(NSString *)price content:(NSString *)content phoneNum:(NSString *)phoneNum fnishTime:(NSString *)fnishTime
{
    NSString *httpStr = [HTTP_URL stringByAppendingFormat:@"&cuid=%@&mid=%d&pid=%@&sub_catids=%@&map_lng=%f&map_lat=%f&name=%@&price=%@&content=%@&c_tel=%@", cuid, mid, fatherID, sonID, lng, lat, name, price, content, phoneNum];
    
//    NSString *testStr = @"http://www.guyizu.com/item.php?act=subject&meth=addpic&format=png";
//    UIImage *image = [UIImage imageNamed:@"test.png"];
//    NSData *mData = UIImagePNGRepresentation(image);
    
    LHYHTTPRequest *sefe = [[LHYHTTPRequest alloc]initWith:httpStr];
    sefe.delegate = self;
    
}

-(void)startRewardDownload:(NSString *)cuid mid:(NSInteger)mid fatherID:(NSString *)fatherID sonID:(NSString *)sonID lng:(float)lng lat:(float) lat name:(NSString *)name price:(NSString *)price c_use_price:(NSString *)c_use_price content:(NSString *)content phoneNum:(NSString *)phoneNum fnishTime:(NSString *)fnishTime{
    NSString *httpStr = [HTTP_URL stringByAppendingFormat:@"&cuid=%@&mid=%d&pid=%@&sub_catids=%@&map_lng=%f&map_lat=%f&name=%@&price=%@&c_use_price=%@&content=%@&c_tel=%@&c_finish_time=%@", cuid, mid, fatherID, sonID, lng, lat, name, price, c_use_price, content, phoneNum, fnishTime];
   
//    NSLog(@"%@", httpStr);
    sendRequeset = [[LHYHTTPRequest alloc]initWith:httpStr];
    sendRequeset.delegate = self;
    
}


-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest{
    [_passDic removeAllObjects];
    if (mLHYHTTPRequest == sendRequeset) {
        [_passDic setDictionary:(NSDictionary *)send];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"xuanshangfabuOver" object:nil];
        
        return;
    }
    
    [_passDic setDictionary:(NSDictionary *)send];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"fenleifabuOver" object:nil];
}




@end
