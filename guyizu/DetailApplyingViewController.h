//
//  DetailApplyingViewController.h
//  Publishingtask
//
//  Created by lanye on 13-12-3.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "selectingcell.h"
#import "detailapplyingcell.h"
#import "PersonDetailViewController.h"
@interface DetailApplyingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
     UITableView *selectingtableview;
     UITableView *applicantstableview;
}

@property (strong, nonatomic) IBOutlet UIScrollView *backscroll;

@property (strong, nonatomic) IBOutlet UIView *sheetview;
@property (strong,nonatomic)UISegmentedControl *detailSegment;

@end
