//
//  DianPingViewController.h
//  谷蚁族
//
//  Created by Macsyf on 13-12-25.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHYHTTPRequest.h"
@interface DianPingViewController : UIViewController<UITextViewDelegate,LHYHTTPRequestProtocol,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textview;
@property (weak, nonatomic) IBOutlet UIImageView *starimageone;
@property (weak, nonatomic) IBOutlet UIImageView *starimagetwo;
@property (weak, nonatomic) IBOutlet UIImageView *starimagethree;
@property (weak, nonatomic) IBOutlet UIImageView *starimagefour;
@property (weak, nonatomic) IBOutlet UIImageView *starimagefive;
@property (weak, nonatomic) IBOutlet UIView *viewone;
@property (weak, nonatomic) IBOutlet UIView *viewtwo;
@property int sid;
@property int startnum;
- (IBAction)button:(UIButton *)sender;
@end
