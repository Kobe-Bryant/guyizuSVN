//
//  LHYHTTPRequest.h
//  谷蚁族
//
//  Created by Mac mini on 13-12-14.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHYHTTPRequestProtocol.h"
#import "Reachability.h"

//@protocol LHYHTTPRequestProtocol <NSObject>
//#import "LHYHTTPRequest.h"

//@end


@interface LHYHTTPRequest : NSObject<NSURLConnectionDataDelegate, NSURLConnectionDelegate>
{
    NSMutableData *_mutableData;
    NSURLConnection *_mURLConnection;
    id<LHYHTTPRequestProtocol> __weak _delegate;
    
    UIView *_blackView;

}

@property  Reachability *internetReachability;
@property (nonatomic, weak) id <LHYHTTPRequestProtocol>delegate;
@property (nonatomic, strong) NSMutableData *mutableData;
@property (nonatomic, strong) NSMutableDictionary *jsonDic;


- (id)initWith:(NSString *)httpUrl;
- (id)initWith:(NSString *)httpUrl andHttpbody:(NSData *)data;
-(void)startDownload:(NSString *)httpStr;


@end
