//
//  DownloadListView.h
//  谷蚁族
//
//  Created by Macsyf on 13-12-23.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "LHYHTTPRequest.h"
@class DownloadListView;
@interface DownloadListView : NSObject<LHYHTTPRequestProtocol>
@property NSMutableArray* mutableArry;
@property BOOL iscontentview;
@property BOOL isrewardlistview;
@property BOOL isrewardcontentview;
@property BOOL isshouchang;
@property int shouchangstate;
//任务进度
@property BOOL isrewardjinduview;
-(void)startrewardjinduDownload:(int)sid;
-(void)startDownload:(float)lng latposition:(float)lat;
-(void)startotherDownload:(int)city Sortcat:(int)sortcat Catid:(int)catid sorttime:(int)sorttime sortdis:(int)sortdis page:(int)page;
-(void)startotherDownload:(float)lng latposition:(float)lat Sortcat:(int)sortcat Sorttime:(int)sorttime Sortdis:(int)sortdis;
-(void)startDownload:(int)sid;
-(void)startrewardDownload:(float)lng latposition:(float)lat Sortcat:(int)sortcat Sorttime:(int)sorttime Sortdis:(int)sortdis;
-(void)startrewardDownload:(int)sid;
+(DownloadListView *)shareDownload;
-(void)startshouchangDownload:(int)sid;
@end
