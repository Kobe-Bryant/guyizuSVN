//
//  collectionViewController.h
//  Mycollection
//
//  Created by lanye on 13-12-2.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "classifycell.h"
#import "colrewardcell.h"
@interface collectionViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *classifytable;
    UITableView *rewardtable;
    
    NSMutableArray *titlelablearr;
    NSMutableArray *endlablearr;
    NSMutableArray *endimagearr;
    NSUInteger _selectIndex;
    
    NSMutableArray *_arry;
    NSMutableArray *_nameArry;
    
    NSMutableArray *_taskarry;
    NSMutableArray *_tasknameArry;
}

@property (weak, nonatomic) IBOutlet UIScrollView *backscroll;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentCtl;
@property (assign,nonatomic) NSUInteger selectIndex;

- (IBAction)select:(id)sender;

@end
