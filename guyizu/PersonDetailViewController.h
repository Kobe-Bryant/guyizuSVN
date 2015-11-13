//
//  PersonDetailViewController.h
//  Publishingtask
//
//  Created by lanye on 13-12-4.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PendingtaskViewController.h"

@interface PersonDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *backscroll;

@property (strong,nonatomic)UISegmentedControl *dataSegment;

@end
