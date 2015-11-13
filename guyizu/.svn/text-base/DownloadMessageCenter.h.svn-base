//
//  DownloadMessageCenter.h
//  谷蚁族
//
//  Created by lanye on 13-12-21.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageCenterModel.h"
#import "LHYHTTPRequest.h"
@interface DownloadMessageCenter : NSObject<LHYHTTPRequestProtocol>
{
    NSMutableArray *_mutableArry;
}
@property (nonatomic,strong) NSMutableArray *mutableArry;

+(DownloadMessageCenter *)shareDownload;

-(void)startDownload;
@end
