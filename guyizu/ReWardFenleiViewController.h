//
//  ReWardFenleiViewController.h
//  guyizu
//
//  Created by 蓝叶软件 on 11/26/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YingzhengViewController.h"
#import "DownloadFenlei.h"
#import "LHYHTTPRequest.h"

@interface ReWardFenleiViewController : UIViewController<UIApplicationDelegate,UITableViewDataSource, UITableViewDelegate, LHYHTTPRequestProtocol>
{
    UITableView *leftTableView;
    UITableView *rightTableView;
    
    NSMutableArray *_leftArry;
    NSMutableArray *_rightArry;
    NSString *leftstr;
    NSString *_fatherID;
    NSString *_sonID;
    
    BOOL _isFenlei;
    
}

@property (nonatomic, strong) NSMutableArray *rightArry;
@property (nonatomic, strong) UIButton *leftbutton;
@property (nonatomic, assign) BOOL isFenlei;

@end
