//
//  ContentViewController.h
//  guyizu
//
//  Created by 蓝叶软件 on 11/23/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FGalleryViewController.h"

@interface ContentViewController : UIViewController<UIAlertViewDelegate,FGalleryViewControllerDelegate,UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>{
    NSArray *networkImages;
    NSArray *networkCaptions;
    
    UITableView *pinglunTableView;
    UIView *blackView;
}
@property (weak, nonatomic) IBOutlet UILabel *talknumberlable;

@property (weak, nonatomic) IBOutlet UILabel *tellable;

@property int sid;
@property (weak, nonatomic) IBOutlet UILabel *namelable;
@property (weak, nonatomic) IBOutlet UIImageView *starimageone;
@property (weak, nonatomic) IBOutlet UIImageView *starimagetwo;
@property (weak, nonatomic) IBOutlet UIImageView *starimagethree;
@property (weak, nonatomic) IBOutlet UIImageView *starimagefour;
@property (weak, nonatomic) IBOutlet UIImageView *starimagefive;
@property (weak, nonatomic) IBOutlet UILabel *pricelable;
@property (weak, nonatomic) IBOutlet UILabel *addresslable;
@property (weak, nonatomic) IBOutlet UILabel *c_addresslable;
@property int selectlistview;
@property (strong, nonatomic) IBOutlet UIView *mPhoneView;
@property (strong, nonatomic) IBOutlet UIScrollView *mBigScrollView;
@property (strong, nonatomic) IBOutlet UIImageView *boxView;
@property (strong, nonatomic) IBOutlet UIView *dianPingView;
@property (strong, nonatomic) IBOutlet UIView *pointView;

@end
