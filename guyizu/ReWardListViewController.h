//
//  ReWardListViewController.h
//  guyizu
//
//  Created by 蓝叶软件 on 11/26/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LifeSearchViewController.h"
@interface ReWardListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    UISegmentedControl *segmentedControl;
}
@property NSString* keyword;
@property int catid;
@property BOOL issearch;
@property float lng;
@property float lat;
//按分类
@property int sort_cat;
//按时间
@property int sort_time;
//按距离
@property int sort_dis;
//页码
@property int page;
@end
