//
//  DengluViewController.h
//  Test-denglu
//
//  Created by lanye on 13-11-26.
//  Copyright (c) 2013年 lanye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZhuceViewController.h"
#import "MimaViewController.h"
#import "LHYHTTPRequest.h"

@interface DengluViewController : UIViewController<UITextFieldDelegate, LHYHTTPRequestProtocol, UIActionSheetDelegate>
{
    UIView *_userview;
    UIView *_passwordview;
    UIButton *_zhucebutton;
    UITextField *usertext;
    UITextField *passwordtext;
    
    BOOL isZidongLogin;
    
}
@property BOOL iszixun;
@property BOOL isshoucang;
@property BOOL isdianping;
@property (strong, nonatomic) IBOutlet UIView *userview;
@property (strong, nonatomic)  UIView *passwordview;
@property (strong, nonatomic) IBOutlet UIButton *zhucebutton;
@property (weak, nonatomic) IBOutlet UILabel *userlable;
@property (weak, nonatomic) IBOutlet UILabel *passwordlable;

-(IBAction)zhuce:(id)sender;
- (IBAction)denglu:(id)sender;
- (IBAction)delekeyboard:(id)sender;
- (IBAction)zidongLogin:(id)sender;

@end
