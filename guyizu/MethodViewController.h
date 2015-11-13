//
//  MethodViewController.h
//  Test-denglu
//
//  Created by lanye on 13-11-26.
//  Copyright (c) 2013年 lanye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmailViewController.h"
#import "PhoneViewController.h"

@interface MethodViewController : UIViewController<UITextFieldDelegate, LHYHTTPRequestProtocol>
{
    UITextField *phonetext;
    UIView *_phoneview;
    UISegmentedControl *_segment;
    UILabel *_titlelable;
    UIImageView *_titleimage;
    UIView *_titleview;
    UIButton *_sendbutton;
    
    NSMutableString *_username;
    LHYHTTPRequest *phoneRequest;
    
}

@property (nonatomic, strong) NSMutableString *username;

@property (strong, nonatomic) IBOutlet UIView *phoneview;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment;
@property (strong, nonatomic) IBOutlet UILabel *titlelable;
@property (strong, nonatomic) UIImageView *titleimage;
@property (strong, nonatomic) IBOutlet UIView *titleview;

@property (strong, nonatomic) IBOutlet UILabel *emailLab;

@property (strong, nonatomic) UIButton *sendbutton;


- (IBAction)select:(id)sender;
- (IBAction)delekeyboard:(id)sender;



@end
