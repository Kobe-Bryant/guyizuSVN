//
//  ClassinfoViewController.h
//  Classinfo
//
//  Created by lanye on 13-11-30.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FenleiViewController.h"
#import "ClassInfocell.h"
#import "endcell.h"
@interface ClassinfoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UIRefreshControl *refresh;
    UITableView *table;
    UITableView *endtable;
    NSMutableArray *_arry;
    NSMutableArray *_endarry;
    
    FenleiViewController *fenlei;
    
     NSInteger deleRow;
}
@property (weak, nonatomic) IBOutlet UIScrollView *backscroll;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedCtl;

- (IBAction)select:(id)sender;



@end
