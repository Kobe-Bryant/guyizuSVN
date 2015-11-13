//
//  LHYHTTPRequest.m
//  谷蚁族
//
//  Created by Mac mini on 13-12-14.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "LHYHTTPRequest.h"

@implementation LHYHTTPRequest

@synthesize jsonDic = _jsonDic;
@synthesize delegate = _delegate;

- (id)init
{
    self = [super init];
    if (self) {
        _mutableData = [[NSMutableData alloc]initWithCapacity:512];
    }
    return self;
}

- (id)initWith:(NSString *)httpUrl{
    self = [super init];
    if (self) {
        _mutableData = [[NSMutableData alloc]initWithCapacity:512];
        NSLog(@"delegate=%@",_delegate);
        
        [self startDownload:httpUrl];
    }
    
    return self;
}

- (id)initWith:(NSString *)httpUrl andHttpbody:(NSData *)data
{
    self = [super init];
    if (self) {
        _mutableData = [[NSMutableData alloc]initWithCapacity:512];
        
        [self startDownloadWithHttpPost:httpUrl AndSetBodyData:data];
    }
    return self;
}

- (void)dealloc
{
    [self isOver];
}

#pragma mark -

-(void)startDownload:(NSString *)httpStr{
 
    NSString *newStr = [httpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSMutableURLRequest *requset = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:newStr] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    [requset setHTTPMethod:@"GET"];
    _mURLConnection = [NSURLConnection connectionWithRequest:requset delegate:self];
    

    [self mAddBlackView];
}

-(void)startDownloadWithHttpPost:(NSString *)httpStr AndSetBodyData:(NSData *)data{
    NSString *newStr = [httpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *mRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:newStr] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    [mRequest setHTTPMethod:@"POST"];
    [mRequest setHTTPBody:data];
    
    _mURLConnection = [NSURLConnection connectionWithRequest:mRequest delegate:self];
    
    [self mAddBlackView];
    
}


#pragma mark delegate

-(void)dothis{
    
}




#pragma mark NSURLConnectionDatasource

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [_mutableData setLength:0];
//    NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
//    NSLog(@"%@",res.allHeaderFields);
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_mutableData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    [self isOver];
    
    NSMutableDictionary *jsonDic = [[NSMutableDictionary alloc]initWithCapacity:0];
    [jsonDic setDictionary: [NSJSONSerialization JSONObjectWithData:_mutableData options:NSJSONReadingMutableLeaves error:nil]];
    
//    NSLog(@"utf8~%@",[[NSString alloc]initWithData:_mutableData encoding:NSUTF8StringEncoding]);
//    NSLog(@"%@",jsonDic);
    
    NSLog(@"%@",_delegate);

    
    if (_delegate && [_delegate respondsToSelector:@selector(returnJsonDic:And:)]) {
        NSLog(@"%@",_delegate);
        
        [_delegate returnJsonDic:jsonDic And:self];
    } 
    
    
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    [self isOver];
    NSLog(@"LHYDownload error, %@", error);
}



#pragma mark -

static NSInteger blackCount = 0;
-(void)mAddBlackView{
    if (blackCount != 0) {
        return;
    }else{
        ++blackCount;
    }
    //blackView
    _blackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    _blackView.center = CGPointMake(160, 260);
    _blackView.layer.cornerRadius = 5.0f;
    _blackView.backgroundColor = [UIColor blackColor];
    _blackView.alpha = 0.5f;
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.center = CGPointMake(_blackView.bounds.size.width / 2, _blackView.bounds.size.height / 2);
    [activityView startAnimating];
    
    [_blackView addSubview:activityView];
    [[UIApplication sharedApplication].keyWindow addSubview:_blackView];
}

-(void)isOver{
    [_blackView removeFromSuperview];
    _blackView = nil;
    blackCount = 0;
    
    [_mURLConnection cancel];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
}

@end
