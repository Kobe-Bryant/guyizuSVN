//
//  DownloadMemberClass.h
//  谷蚁族
//
//  Created by lanye on 13-12-20.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHYHTTPRequest.h"
#import "MemberClassModel.h"
@interface DownloadMemberClass : NSObject<LHYHTTPRequestProtocol>
{
    NSMutableArray *_mutableArry;
    NSMutableArray *_endmutableArry;
    NSMutableDictionary *_deleDic;
    
    LHYHTTPRequest *endsent;
    LHYHTTPRequest *_delerequest;
    LHYHTTPRequest *_modifyrequest;
   
}
@property (nonatomic,strong) NSMutableArray *mutableArry;
@property (nonatomic,strong) NSMutableArray *endmutableArry;
@property (nonatomic,strong) NSMutableDictionary *deleDic;
+(DownloadMemberClass *)shareDownload;

-(void)startDownload;
-(void)startendDownload;
-(void)startModifyDownload:(int)sid;
-(void)startDeleDownload:(NSString *)sid;

@end
