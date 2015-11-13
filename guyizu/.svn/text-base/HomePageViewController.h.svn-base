//
//  HomePageViewController.h
//  guyizu
//
//  Created by 蓝叶软件 on 11/21/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeveyTabBarController.h"
#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>
#import "UserViewController.h"
#import "LHYHTTPRequest.h"

@interface HomePageViewController : UIViewController<UIScrollViewDelegate,UISearchBarDelegate,CLLocationManagerDelegate, UIAlertViewDelegate, LHYHTTPRequestProtocol>
{
    UIPageControl *pageControl;
    NSString *_cityName;
    UIView *_leftView;
    UISearchBar *search;
    UILabel *_mlabel;
    UIView *blackView;
    UIView *leftView;
    UIScrollView *_scrollView;
    UserViewController *userCtl;
    
    //Location
    CLLocationManager *_locationManager;
    CLLocation *_location;
    
    //dataSource
    NSMutableArray *slideImages;
}

@property (strong, nonatomic) NSString *cityName;
@property (weak, nonatomic) IBOutlet UIView *OtherVIew;


@property (weak, nonatomic) IBOutlet UIImageView *lifeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *plainImageView;
@property (weak, nonatomic) IBOutlet UIImageView *trainImageVIew;
@property (weak, nonatomic) IBOutlet UIImageView *missonImageView;
@property (weak, nonatomic) IBOutlet UIImageView *memberImageView;
@property (weak, nonatomic) IBOutlet UIImageView *stionImageView;
@property (weak, nonatomic) IBOutlet UIImageView *searchImageView;
@property (weak, nonatomic) IBOutlet UIImageView *shakImageView;
@property (strong, nonatomic) IBOutlet UIScrollView *bigScrollView;


@end
