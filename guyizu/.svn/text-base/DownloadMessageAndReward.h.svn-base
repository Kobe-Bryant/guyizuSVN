//
//  DownloadMessageAndReward.h
//  谷蚁族
//
//  Created by lanye on 13-12-24.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHYHTTPRequest.h"

@interface DownloadMessageAndReward : NSObject<LHYHTTPRequestProtocol>
{
    NSMutableDictionary *_passDic;
    LHYHTTPRequest *sendRequeset;
}

@property (nonatomic, strong)NSMutableDictionary *passDic;

+(DownloadMessageAndReward *)shareDownload;

-(void)startDownload:(NSString *)cuid mid:(NSInteger)mid fatherID:(NSString *)fatherID sonID:(NSString *)sonID lng:(float)lng lat:(float) lat name:(NSString *)name price:(NSString *)price content:(NSString *)content phoneNum:(NSString *)phoneNum fnishTime:(NSString *)fnishTime;
-(void)startRewardDownload:(NSString *)cuid mid:(NSInteger)mid fatherID:(NSString *)fatherID sonID:(NSString *)sonID lng:(float)lng lat:(float) lat name:(NSString *)name price:(NSString *)price c_use_price:(NSString *)c_use_price content:(NSString *)content phoneNum:(NSString *)phoneNum fnishTime:(NSString *)fnishTime;


@end
