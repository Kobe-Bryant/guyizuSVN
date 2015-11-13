//
//  DownloadSearchView.m
//  谷蚁族
//
//  Created by Macsyf on 13-12-27.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "DownloadSearchView.h"
#import "SearchView.h"
#import "ReWardView.h"
#define HttpSearchSub_URL @"http://www.guyizu.com/item.php?act=subject&meth=show_task_subcats"
#define HttpSearch_URL @"http://www.guyizu.com/item.php?act=subject&meth=search_task"
@interface DownloadSearchView()
{
    NSMutableArray* idarray;
    NSMutableArray* namearray;
}
@end
@implementation DownloadSearchView
static DownloadSearchView* searchview=Nil;
-(id)init
{
    if(self=[super init])
    {
        _array=[NSMutableArray new];
        idarray=[NSMutableArray new];
        namearray=[NSMutableArray new];
        _issubview=YES;
        _issearch=NO;
        _keywordstring=@"-1";
        _catidstring=-1;
    }
    return self;
}
+(DownloadSearchView*)shardsearchview
{
    if(searchview!=Nil)
    {
        return searchview;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        searchview=[[DownloadSearchView alloc ]init];
    });
    return searchview;
}
-(void)startsearchsubview
{
    _issubview=YES;
    _array=[NSMutableArray new];
    idarray=[NSMutableArray new];
    namearray=[NSMutableArray new];
    //网络数据下载
    if ([_array count] == 0) {
        NSString *otherhttpStr =HttpSearchSub_URL;
        NSLog(@"http=%@",otherhttpStr);
        LHYHTTPRequest *sendReaquest = [[LHYHTTPRequest alloc]initWith:otherhttpStr];
        sendReaquest.delegate = self;
    }else{
        [self secendDownload];
    }

}
-(void)startsearchview:(NSString*)keyword catid:(int)catid
{
    _issubview=NO;
    _array=[NSMutableArray new];
    idarray=[NSMutableArray new];
    namearray=[NSMutableArray new];
    //网络数据下载
    if ([_array count] == 0) {
        NSString *otherhttpStr =[NSString stringWithFormat:@"%@&keyword=%@&catid=%d", HttpSearch_URL,keyword,catid];
        NSLog(@"otherhttp=%@",otherhttpStr);
        LHYHTTPRequest *sendReaquest = [[LHYHTTPRequest alloc]initWith:otherhttpStr];
        sendReaquest.delegate = self;
    }else{
        [self secendDownload];
    }
}
-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest
{
    if(_issubview==YES)
    {
        NSArray* arr=[send objectForKey:@"data"];
        if(![arr isEqual:@""])
        {
        for(NSDictionary* dic in arr)
        {
            [idarray addObject:[dic objectForKey:@"catid"]];
            [namearray addObject:[dic objectForKey:@"name"]];
        }
        [_array addObject:idarray];
        [_array addObject:namearray];
        }
    }
    else
    {
        NSArray *arr1 = [send objectForKey:@"data"];
        if(![arr1 isEqual:@""])
        {
        for (NSDictionary *mDic in arr1) {
            ReWardView *thisModel = [[ReWardView alloc]init];
            thisModel.sid = [mDic objectForKey:@"sid"];
            thisModel.name = [mDic objectForKey:@"name"];
            thisModel.catid = [mDic objectForKey:@"catid"];
            thisModel.c_price=[mDic objectForKey:@"c_price"];
            thisModel.thumb=[mDic objectForKey:@"thumb"];
            thisModel.c_address=[mDic objectForKey:@"c_address"];
            thisModel.reviews=[mDic objectForKey:@"reviews"];
            thisModel.distance=[mDic objectForKey:@"distance"];
            thisModel.task_type=[mDic objectForKey:@"task_type"];
            thisModel.is_selected=[mDic objectForKey:@"is_selected"];
            thisModel.c_apply_num=[mDic objectForKey:@"c_apply_num"];
            thisModel.finish_time=[mDic objectForKey:@"finish_time"];
            [_array addObject:thisModel];
        }
        }
    }
    
    [self secendDownload];
}
-(void)secendDownload{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"searchorsubview" object:self.array];
}
@end
