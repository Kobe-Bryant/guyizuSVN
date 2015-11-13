//
//  DownloadMemberClass.m
//  谷蚁族
//
//  Created by lanye on 13-12-20.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "DownloadMemberClass.h"

#define HTTP_URL @"http://www.guyizu.com/member.php?act=login_in&meth=m_member_subject"
#define HTTP_END_URL @"http://www.guyizu.com/member.php?act=login_in&meth=m_member_subject"
#define HTTP_modify_URL @"http://www.guyizu.com/member.php?act=login_in&meth=m_subject_edit"
#define HTTP_DELE_URL @"http://www.guyizu.com/item.php?act=subject&meth=delete_subject"
@implementation DownloadMemberClass
@synthesize mutableArry = _mutableArry,deleDic = _deleDic,endmutableArry = _endmutableArry;
- (id)init
{
    self = [super init];
    if (self) {
        _mutableArry = [[NSMutableArray alloc]initWithCapacity:0];
        _endmutableArry = [[NSMutableArray alloc]initWithCapacity:0];
        _deleDic = [[NSMutableDictionary alloc]initWithCapacity:0];
    }
    return self;
}


DownloadMemberClass *memberClass = nil;
+(DownloadMemberClass *)shareDownload{
    if (memberClass == nil) {
        memberClass = [[DownloadMemberClass alloc]init];
    }
    return memberClass;
}

#pragma mark download

-(void)startDownload{
    //网络数据下载
    if ([_mutableArry count] == 0) {
        NSString *uidStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"];

        NSString *httpStr = [HTTP_URL stringByAppendingFormat:@"&uid=%@",uidStr];
//        NSLog(@"%@",httpStr);
        LHYHTTPRequest *sendReaquest = [[LHYHTTPRequest alloc]initWith:httpStr];
        sendReaquest.delegate = self;
    }else{
        [self secendDownload];
 }
}
//修改
-(void)startModifyDownload:(int)sid;
{
    //网络数据下载
        NSString *modifyhttpStr = [HTTP_modify_URL stringByAppendingFormat:@"&sid=%d",sid];
        _modifyrequest = [[LHYHTTPRequest alloc]initWith:modifyhttpStr];
        _modifyrequest.delegate = self;

}
//删除
-(void)startDeleDownload:(NSString *)sid
{
    NSString *httpStr = [HTTP_DELE_URL stringByAppendingFormat:@"&sid=%@",sid];
    _delerequest = [[LHYHTTPRequest alloc]initWith:httpStr];
    _delerequest.delegate =self;
}

#pragma mark- 已结束
-(void)startendDownload
{
    //网络数据下载
    if ([_endmutableArry count] == 0) {
        NSString *uidStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"];
        
        NSString *httpStr = [HTTP_END_URL stringByAppendingFormat:@"&uid=%@",uidStr];
        endsent= [[LHYHTTPRequest alloc]initWith:httpStr];
        endsent.delegate = self;
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"memberclassendDownloadOver" object:nil];
    }
    
}
//调用方法
-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest{
    
    if (mLHYHTTPRequest == endsent) {
        NSDictionary *mDic = [send objectForKey:@"data"];
        for (int i=0 ; i<mDic.count; i++) {
            NSDictionary *msid = [[send objectForKey:@"data"] objectAtIndex:i];
            MemberClassModel *thisModel = [[MemberClassModel alloc]init];
            thisModel.addtime = [msid objectForKey:@"addtime"];
            thisModel.pageviews = [msid objectForKey:@"pageviews"];
            thisModel.name = [msid objectForKey:@"name"];
            thisModel.content = [msid objectForKey:@"content"];
            thisModel.thumb = [msid objectForKey:@"thumb"];
            thisModel.sid = [msid objectForKey:@"sid"];
            thisModel.status = [msid objectForKey:@"status"];
            
            [_endmutableArry addObject:thisModel];
        }
     [[NSNotificationCenter defaultCenter] postNotificationName:@"memberclassendDownloadOver" object:nil];
        return;
    }
//    if (mLHYHTTPRequest == _) {
//        <#statements#>
//    }
//    
    
      [_deleDic removeAllObjects];
    if (mLHYHTTPRequest == _delerequest) {
        [_deleDic setDictionary:(NSMutableDictionary *)send];
        [self deleDownload];
        return;
    }else{
    
    NSDictionary *mDic = [send objectForKey:@"data"];
    for (int i=0 ; i<mDic.count; i++) {
        NSDictionary *msid = [[send objectForKey:@"data"] objectAtIndex:i];
        MemberClassModel *thisModel = [[MemberClassModel alloc]init];
        thisModel.addtime = [msid objectForKey:@"addtime"];
        thisModel.pageviews = [msid objectForKey:@"pageviews"];
        thisModel.name = [msid objectForKey:@"name"];
        thisModel.content = [msid objectForKey:@"content"];
        thisModel.thumb = [msid objectForKey:@"thumb"];
        thisModel.sid = [msid objectForKey:@"sid"];
        thisModel.status = [msid objectForKey:@"status"];
        
        [_mutableArry addObject:thisModel];
    }
        [self secendDownload];
        return;
    }
}


#pragma mark Secend

-(void)deleDownload{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"deleDownloadOver" object:nil];
}

-(void)secendDownload{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"memberclassDownloadOver" object:nil];
}



@end
