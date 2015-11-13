//
//  DownloadChooseCity.m
//  谷蚁族
//
//  Created by lanye on 13-12-25.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "DownloadChooseCity.h"
#define HTTP_URL @"http://www.guyizu.com/item.php?act=subject&meth=get_citys"
@implementation DownloadChooseCity
@synthesize mutableArry = _mutableArry;
- (id)init
{
    self = [super init];
    if (self) {
        _hotArry = [[NSMutableArray alloc]initWithCapacity:0];
        _mutableArry = [[NSMutableArray alloc]initWithCapacity:0];
        _arr1 = [[NSMutableArray alloc]initWithCapacity:0];
        _arr10 = [[NSMutableArray alloc]initWithCapacity:0];
        _a = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}

static DownloadChooseCity *choosecityDownloadw = nil;
+(DownloadChooseCity *)shareDownload{
    if (choosecityDownloadw == nil) {
        choosecityDownloadw = [[DownloadChooseCity alloc]init];
        [choosecityDownloadw startDownload];
    }
    
    return choosecityDownloadw;
}

#pragma mark -

-(void)startDownload
{
    NSLog(@"%d", [_mutableArry count]);
    if (_mutableArry.count == 0) {
        LHYHTTPRequest *citysend = [[LHYHTTPRequest alloc]initWith:HTTP_URL];
        citysend.delegate = self;
    }else{
        [self secendDownload];
        
    }
}

-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest{
    //[_mutableArry removeAllObjects];
    
    NSMutableArray *arr;
    NSMutableArray *arr2;
    NSDictionary *mDic = [send objectForKey:@"data"];
    
    NSMutableDictionary *citysDic = [mDic objectForKey:@"citys"];
    
    for (NSMutableDictionary *sdic in citysDic) {
        
        NSString *str = [sdic objectForKey:@"sort"];
        arr = [[NSMutableArray alloc]initWithObjects:str, nil];
        [_arr1 addObject:arr];
        arr2 = [sdic objectForKey:@"city"];
        for (NSMutableDictionary *cityname in arr2) {
            [_arr10 removeAllObjects];
        NSString *strr = [cityname objectForKey:@"name"];
            [_arr10 addObject:strr];
            [_a addObject:_arr10];
        
        }
       city *thisModel = [[city alloc]init];
        NSMutableArray *city = [sdic objectForKey:@"city"];
        {
            for (NSMutableDictionary *scity in city) {
               
                thisModel.aid = [scity objectForKey:@"aid"];
                thisModel.initial = [scity objectForKey:@"initial"];
                thisModel.name = [scity objectForKey:@"name"];
            
               [_mutableArry addObject:thisModel];
            }
        }
    }
    NSMutableDictionary *hotDic = [mDic objectForKey:@"hot"];
    city *this = [[city alloc]init];
    for (NSMutableDictionary *hot in hotDic) {
        
        this.hotaid = [hot objectForKey:@"aid"];
        this.hotname = [hot objectForKey:@"name"];
         [_hotArry addObject:this];
        }

    [self secendDownload];
}

-(void)secendDownload
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"choosecityDownloadOverWangcong" object:nil];
}

@end
