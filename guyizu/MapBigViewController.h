//
//  MapBigViewController.h
//  guyizu
//
//  Created by 蓝叶软件 on 11/23/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"

@interface MapBigViewController : UIViewController<MapViewControllerDidSelectDelegate>
{
    MapViewController *_mapViewController;
    NSMutableArray *_pointArry;
}
@property(nonatomic, strong) NSArray* array;
@property (nonatomic, strong) NSMutableArray *pointArry;
@property BOOL iscontentview;
@end
