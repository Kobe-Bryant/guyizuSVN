//
//  ChangepasswordViewController.h
//  ChangPassword
//
//  Created by lanye on 13-11-30.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangepasswordViewController : UIViewController{
    UIView *_oldpassview;
    UIView *_newpassview;
    UIView *_newagainpassview;
    
}

@property (strong, nonatomic) IBOutlet UIView *oldpassview;

@property (strong, nonatomic) IBOutlet UIView *newpassview;

@property (strong, nonatomic) IBOutlet UIView *newagainpassview;

@property (strong, nonatomic) IBOutlet UILabel *errorlable;

@property (strong, nonatomic) IBOutlet UITextField *oldpassfield;

@property (strong, nonatomic) IBOutlet UITextField *newpassfield;

@property (strong, nonatomic) IBOutlet UITextField *newagainpassfield;


- (IBAction)closekeyboard:(id)sender;
- (IBAction)submit:(id)sender;

@end
