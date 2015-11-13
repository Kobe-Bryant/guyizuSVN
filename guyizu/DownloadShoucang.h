//
//  DownloadShoucang.h
//  谷蚁族
//
//  Created by lanye on 13-12-30.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHYHTTPRequest.h"
#import "messageModel.h"
@interface DownloadShoucang : NSObject<LHYHTTPRequestProtocol>
{
    NSMutableArray *_mutableArry;
    NSMutableArray *_taskmutableArry;
    LHYHTTPRequest *taskrequest;
}
@property (strong,nonatomic) NSMutableArray *mutableArry;
@property (strong,nonatomic) NSMutableArray *taskmutableArry;
+(DownloadShoucang *)shareDownload;
-(void)startDownload;
-(void)starttaskDownload;
@end
