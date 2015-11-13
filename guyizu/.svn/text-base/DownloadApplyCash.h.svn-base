//
//  DownloadApplyCash.h
//  谷蚁族
//
//  Created by lanye on 13-12-30.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHYHTTPRequest.h"
#import "applycashModel.h"
@interface DownloadApplyCash : NSObject<LHYHTTPRequestProtocol>
{
    NSMutableArray *_mutableArry;
    NSMutableDictionary *_mutableDic;
    LHYHTTPRequest *applysend;
}

@property (strong,nonatomic) NSMutableArray *mutableArry;
@property (strong,nonatomic) NSMutableDictionary *mutableDic;
+(DownloadApplyCash *)shareDownload;

-(void)startDownload:(NSString *)uid sid:(NSString *)sid;


-(void)startDownload:(NSString *)sid bank:(NSString *)bank cardNum:(NSString *)cardNum account:(NSString *)account;

@end
