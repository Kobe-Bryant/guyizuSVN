//
//  YingzhengViewController.h
//  Test-fabu
//
//  Created by lanye on 13-11-27.
//  Copyright (c) 2013年 lanye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "CTAssetsPickerController.h"
#import "LeveyTabBarController.h"

@interface YingzhengViewController : UIViewController<UITextViewDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,CTAssetsPickerControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    LeveyTabBarController *_leaveTabBar;
    UIScrollView *_backscroll;
    UIButton *_addpicbuttton;
    
    UIImageView *imageview;
    NSMutableArray *_imagearry;
    
    UIButton *button;
    NSMutableArray *yeardata;
    NSMutableArray *mondata;
    NSMutableArray *daydata;
    NSMutableArray *huordata;
    
    NSString *timeStr1;
    NSString *timeStr2;
    NSString *timeStr3;
    NSString *timeStr4;
    
    NSMutableString *_passStr;
    NSMutableString *_leftpasstr;
    NSMutableString *_rightpasstr;
}

@property (strong, nonatomic) LeveyTabBarController *leaveTabBar;
@property (strong, nonatomic) IBOutlet UIScrollView *backscroll;
@property (weak, nonatomic) IBOutlet UIButton *bendibutton;
@property (weak, nonatomic) IBOutlet UIButton *xianshangbutton;
@property (strong, nonatomic) IBOutlet UITextField *choujintextfield;
@property (strong, nonatomic) IBOutlet UITextField *dianfutextfield;
@property (weak, nonatomic) IBOutlet UITextField *titletext;
@property (weak, nonatomic) IBOutlet UITextField *cennecttext;
@property (weak, nonatomic) IBOutlet UITextField *phonetext;

@property (weak, nonatomic) IBOutlet UIView *backview;
@property (weak, nonatomic) IBOutlet UILabel *miaoshulable;
@property (weak, nonatomic) IBOutlet UITextView *textview;
@property (weak, nonatomic) IBOutlet UIScrollView *titlescroll;
@property (nonatomic, strong) NSMutableArray *assets;
@property (weak, nonatomic) IBOutlet UILabel *addpiclable;

@property (strong, nonatomic) IBOutlet UIView *timebackView;
@property (strong, nonatomic) IBOutlet UILabel *timeLab;


@property (strong, nonatomic) IBOutlet UIView *backPick;
@property (strong, nonatomic) IBOutlet UIPickerView *pickView;
- (IBAction)pickBtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *leibieView;
@property (strong, nonatomic) IBOutlet UILabel *leibieLab;

@property (strong,nonatomic)NSMutableString *passStr;
@property (strong, nonatomic) IBOutlet UIImageView *titleImg;
@property (nonatomic, strong) NSMutableString *leftpasstr;
@property (nonatomic, strong) NSMutableString *rightpasstr;

- (IBAction)bendibutton:(id)sender;
- (IBAction)xianshangbutton:(id)sender;
- (IBAction)keyboard:(id)sender;



@end
