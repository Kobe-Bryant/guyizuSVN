//
//  CityListTwoViewController.h
//  guyizu
//
//  Created by Mac mini on 13-12-10.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadChooseCity.h"
#import "LHYHTTPRequest.h"
#import "HomePageViewController.h"

@interface CityListTwoViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, NSURLConnectionDataDelegate, LHYHTTPRequestProtocol>{
    NSMutableData *_mutableData;
    NSMutableArray *_mutableArry;
    NSMutableArray *_sortArry;
    NSMutableArray *_nameArry;
    NSMutableArray *_initialArry;
    NSDictionary *_dic;
    NSMutableArray *hotarr;
    NSMutableArray *_hotArry;

    NSMutableArray *_arr1;
    NSMutableArray *_arr10;
    NSMutableDictionary *_mis;
  
    UITableView *table;
    
  
  //  NSMutableArray *_hotArry;
   // NSMutableArray *_arr1;
   // NSMutableArray *_arr10;
    NSMutableArray *_a;
    
    HomePageViewController *_passHomePage;
}

-(void)startDownload;

@property (strong, nonatomic) IBOutlet UITableView *mTableView;
@property (nonatomic, retain) HomePageViewController *passHomePage;

@end
