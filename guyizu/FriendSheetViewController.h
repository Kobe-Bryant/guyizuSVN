//
//  FriendSheetViewController.h
//  FriendSheet
//
//  Created by lanye on 13-12-5.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SheetCell.h"
#import "LHYHTTPRequest.h"

@interface FriendSheetViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate, LHYHTTPRequestProtocol>
{
    UITableView *sheettable;
    NSMutableArray *_namelable;
    
    NSMutableArray *_soureArry;
}

@property (strong, nonatomic) IBOutlet UIScrollView *backscroll;

@property (strong, nonatomic) IBOutlet UIView *titleview;

@property (strong, nonatomic) IBOutlet UIView *headerview;
@property (strong, nonatomic) IBOutlet UITextField *searchtext;






@end
