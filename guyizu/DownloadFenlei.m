//
//  DownloadFenlei.m
//  谷蚁族
//
//  Created by Mac mini on 13-12-18.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "DownloadFenlei.h"
#import "LifeFenleiModel.h"

#define HTTP_URL @"http://www.guyizu.com/item.php?act=subject&meth=top_category&mid=1"
#define HTTP_URL_Reward @"http://www.guyizu.com/item.php?act=subject&meth=top_category&mid=2"

@implementation DownloadFenlei

@synthesize passArry = _passArry;

#pragma mark -

- (id)init
{
    self = [super init];
    if (self) {
        _passArry = [[NSMutableArray alloc]initWithCapacity:0];
        _RewardPassArry = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}

DownloadFenlei *fenleiDownload = nil;
+(DownloadFenlei *)shareDownload{
    if (fenleiDownload == nil) {
        fenleiDownload = [[DownloadFenlei alloc]init];
        
    }
    
    return fenleiDownload;
}

#pragma mark -

-(void)startDownload{
    if ([_passArry count] == 0) {
        LHYHTTPRequest *mrequest = [[LHYHTTPRequest alloc]initWith:HTTP_URL];
        mrequest.delegate = self;
    }else{
        [self fenLeiisOver];
    }

}

-(void)RewardStartDownload{
    if ([_RewardPassArry count] == 0) {
        rewardRequest = [[LHYHTTPRequest alloc]initWith:HTTP_URL_Reward];
        rewardRequest.delegate = self;
    }else{
        [self RewardisOver];
    }
}

#pragma mark delegate

-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest{
    
    NSArray *arr1 = [send objectForKey:@"data"];

    
    
    //判断下载
    if (mLHYHTTPRequest == rewardRequest) {
        for (NSDictionary *mDic in arr1) {
            LifeFenleiModel *thisModel = [[LifeFenleiModel alloc]init];
            thisModel.name = [mDic objectForKey:@"name"];
            thisModel.mID = [mDic objectForKey:@"catid"];
            
            [_RewardPassArry addObject:thisModel];
        }
        
        [self RewardisOver];
        
        return;
    }else{
        for (NSDictionary *mDic in arr1) {
            LifeFenleiModel *thisModel = [[LifeFenleiModel alloc]init];
            thisModel.name = [mDic objectForKey:@"name"];
            thisModel.mID = [mDic objectForKey:@"catid"];
            
            [_passArry addObject:thisModel];
        }
        
        [self fenLeiisOver];
        
        return;
    }

}

#pragma mark isOver

-(void)fenLeiisOver{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"lifeFenleiDownloadOver" object:nil];
}

-(void)RewardisOver{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RewardFenleiDownloadOver" object:nil];
}

@end
