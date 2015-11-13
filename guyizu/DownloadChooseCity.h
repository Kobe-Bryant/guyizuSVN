//
//  DownloadChooseCity.h
//  谷蚁族
//
//  Created by lanye on 13-12-25.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "city.h"
#import "LHYHTTPRequest.h"
@interface DownloadChooseCity : NSObject<LHYHTTPRequestProtocol>
{
    NSMutableArray *_mutableArry;
    NSMutableArray *_hotArry;
    NSMutableArray *_arr1;
    NSMutableArray *_arr10;
    NSMutableArray *_a;
}

@property (strong,nonatomic) NSMutableArray *mutableArry;
@property (strong,nonatomic) NSMutableArray *hotArry;
@property (strong,nonatomic) NSMutableArray *arr1;
@property (strong,nonatomic) NSMutableArray *arr10;
@property (strong,nonatomic) NSMutableArray *a;


+(DownloadChooseCity *)shareDownload;

-(void)startDownload;





@end
