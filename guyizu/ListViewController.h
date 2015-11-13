//
//  ListViewController.h
//  guyizu
//
//  Created by 蓝叶软件 on 11/22/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UISegmentedControl *segmentedControl;
}
@property BOOL ishometolistview;
@property int city;
@property int sortcat;
@property int catid;
@property float lng;
@property float lat;
@property int sorttime;
@property int sortdis;
@property int page;
@end
