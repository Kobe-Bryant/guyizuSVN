//
//  HomePageViewController.m
//  guyizu
//
//  Created by 蓝叶软件 on 11/21/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageViewController.h"

@interface CityListViewController : UIViewController<UISearchBarDelegate> {
    NSDictionary *cities;  
    NSArray *keys;
    id delegate;
    UITableView *tbView;
    HomePageViewController *_passHomePage;
    UIView *blackView;
    
    
    NSMutableArray *_mutableArry;
}

@property (retain, nonatomic) IBOutlet UISearchBar *mSearchBar;
@property (nonatomic, retain) IBOutlet UITableView *tbView;

@property (nonatomic, retain) NSDictionary *cities;  
@property (nonatomic, retain) NSArray *keys;
@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) HomePageViewController *passHomePage;


- (void) citySelectionUpdate:(NSString*)selectedCity;
- (NSString*) getDefaultCity;
@end

