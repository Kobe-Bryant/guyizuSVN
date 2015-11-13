//
//  DownloadmimaModel.h
//  谷蚁族
//
//  Created by lanye on 13-12-27.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHYHTTPRequest.h"
@interface DownloadmimaModel : NSObject<LHYHTTPRequestProtocol>
{
    NSMutableDictionary *_passDic;
}
@property (strong,nonatomic) NSMutableDictionary *passDic;

+(DownloadmimaModel *)shareDownload;
-(void)startDownload:(NSString *)uid old:(NSString *)old new1:(NSString *)new1 new2:(NSString *)new2;
@end
