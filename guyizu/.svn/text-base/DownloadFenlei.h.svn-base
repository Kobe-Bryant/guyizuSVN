//
//  DownloadFenlei.h
//  谷蚁族
//
//  Created by Mac mini on 13-12-18.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHYHTTPRequest.h"

@interface DownloadFenlei : NSObject<LHYHTTPRequestProtocol>
{
    NSMutableArray *_passArry;
    NSMutableArray *_RewardPassArry;
    
    LHYHTTPRequest *rewardRequest;
}

@property (nonatomic, strong) NSMutableArray *passArry;
@property (nonatomic, strong) NSMutableArray *RewardPassArry;

+(DownloadFenlei *)shareDownload;
-(void)startDownload;
-(void)RewardStartDownload;

@end
