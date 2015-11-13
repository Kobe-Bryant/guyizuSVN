//
//  ApplyingViewController.h
//  Publishingtask
//
//  Created by lanye on 13-12-3.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "applyingcell.h"
#import "selectingcell.h"
#import "RenwuingCell.h"
#import "DetailApplyingViewController.h"
#import "DetailRenwuingViewController.h"
#import "RenwuSureViewController.h"
#import "YingzhengViewController.h"
#import "ReWardFenleiViewController.h"

@interface ApplyingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *applyingtableview;
    UITableView *selectingtableview;
    UITableView *renwuingtableview;
    
    ReWardFenleiViewController *rewardCtl;
    
    NSMutableArray *_arr;
    NSMutableArray *_nameArr;
}

@property (strong, nonatomic) IBOutlet UIScrollView *backscroll;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmented;
@property(assign,nonatomic) int uid;
@property(assign,nonatomic) int status;
@end
