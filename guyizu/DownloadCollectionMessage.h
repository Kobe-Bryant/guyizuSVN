//
//  DownloadCollectionMessage.h
//  谷蚁族
//
//  Created by lanye on 13-12-23.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CollectionMessageModel.h"
#import "LHYHTTPRequest.h"
@interface DownloadCollectionMessage : NSObject<LHYHTTPRequestProtocol>
{
    NSMutableArray *_mutableArry;
 
}
@property (nonatomic,strong) NSMutableArray *mutableArry;


+(DownloadCollectionMessage *)shareDownload;

-(void)startDownload;



@end
