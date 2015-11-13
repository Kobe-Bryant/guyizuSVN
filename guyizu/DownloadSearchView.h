//
//  DownloadSearchView.h
//  谷蚁族
//
//  Created by Macsyf on 13-12-27.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHYHTTPRequest.h"
@interface DownloadSearchView : NSObject<LHYHTTPRequestProtocol>
@property NSMutableArray* array;
@property BOOL issubview;
@property NSString* keywordstring;
@property BOOL issearch;
@property int catidstring;
-(void)startsearchsubview;
-(void)startsearchview:(NSString*)keyword catid:(int)catid;
+(DownloadSearchView*)shardsearchview;
@end
