//
//  PeronalDataViewController.h
//  Peronal
//
//  Created by lanye on 13-11-30.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTAssetsPickerController.h"
#import "LHYHTTPRequest.h"

@interface PeronalDataViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate,UIActionSheetDelegate,CTAssetsPickerControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,LHYHTTPRequestProtocol>
{
    UIImageView *imageview;
    NSMutableArray *_imagearry;
    NSInteger i;
    UIButton *button;
    UIButton *fabubutton;
    NSString *Str;
 }

@property (strong, nonatomic) IBOutlet UIScrollView *backscroll;
@property (strong, nonatomic) IBOutlet UIScrollView *titlescroll;
@property (strong, nonatomic) IBOutlet UIView *backview;
@property (strong, nonatomic) IBOutlet UITextView *skilltextview;
@property (strong, nonatomic) IBOutlet UILabel *skilllable;
@property (strong, nonatomic) IBOutlet UITextView *describetextview;
@property (strong, nonatomic) IBOutlet UILabel *describelable;

@property (strong, nonatomic) IBOutlet UITextField *quyutextfield;
@property (strong, nonatomic) IBOutlet UITextField *adresstextfield;
@property (strong, nonatomic) IBOutlet UITextField *nametextfield;
@property (strong, nonatomic) IBOutlet UITextField *numbertextfield;
@property (strong, nonatomic) IBOutlet UITextField *emailtextfield;

@property (strong, nonatomic) IBOutlet UIButton *peronalbutton;
@property (strong, nonatomic) IBOutlet UIButton *bussinessbutton;
@property (strong, nonatomic) IBOutlet UILabel *addpiclable;

@property (strong, nonatomic) IBOutlet UIImageView *titleImg;

@property (nonatomic, strong) NSMutableArray *assets;


- (IBAction)peronalbutton:(id)sender;
- (IBAction)bussinessbutton:(id)sender;
- (IBAction)closekeyboard:(id)sender;

-(void)startDownload:(NSString *)uid email:(NSString *)email mobile:(NSString *)mobile realname:(NSString *)realname adress:(NSString *)adress area:(NSString *)area check_company:(NSString *)check_company speciality:(NSString *)speciality;



@end
