//
//  ErshouViewController.h
//  Test-ershouji
//
//  Created by lanye on 13-11-29.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTAssetsPickerController.h"

@interface ErshouViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate,UIActionSheetDelegate,CTAssetsPickerControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    UIScrollView *_backscroll;
    UIScrollView *_titlescroll;
    UIButton *_gerenbutton;
    UIButton *_shangjiabutton;
    UITextField *_biaotitextfield;
    UITextField *_numbertextfield;
    UILabel *_textviewlable;
    UITextView *_miaoshutextview;
    UIView *_backview;
    
    UIImageView *imageview;
    NSMutableArray *_imagearry;
    UIButton *button;
    NSInteger i;
    
    
    NSMutableString *_passStr;
    NSMutableString *_leftpasstr;
    NSMutableString *_rightpasstr;
    
}

@property (strong, nonatomic) IBOutlet UIScrollView *backscroll;

@property (strong, nonatomic) IBOutlet UIScrollView *titlescroll;
@property (strong, nonatomic) IBOutlet UIView *titleView;

@property (strong, nonatomic) IBOutlet UIButton *gerenbutton;
@property (strong, nonatomic) IBOutlet UIButton *shangjiabutton;
@property (strong, nonatomic) IBOutlet UITextField *biaotitextfield;
@property (strong, nonatomic) IBOutlet UITextField *numbertextfield;
@property (strong, nonatomic) IBOutlet UITextField *pricetextfield;
@property (strong, nonatomic) IBOutlet UITextField *lianxiren;

@property (strong, nonatomic) IBOutlet UILabel *textviewlable;
@property (strong, nonatomic) IBOutlet UITextView *miaoshutextview;
@property (strong, nonatomic) IBOutlet UIView *backview;
@property (strong, nonatomic) IBOutlet UILabel *addpiclable;
@property (strong, nonatomic) IBOutlet UIImageView *titleImg;
@property (strong, nonatomic) IBOutlet UIView *clickView;
@property (strong, nonatomic) IBOutlet UILabel *cilckLab;

@property (strong, nonatomic) IBOutlet UIView *gerrenView;
@property (strong, nonatomic) IBOutlet UIView *shangjiaView;



@property (nonatomic, strong) NSMutableString *passStr;
@property (nonatomic, strong) NSMutableString *leftpasstr;
@property (nonatomic, strong) NSMutableString *rightpasstr;

@property (nonatomic, strong) NSMutableArray *assets;


//- (IBAction)gerenbutton:(id)sender;
//- (IBAction)shangjiabutton:(id)sender;
- (IBAction)keyboard:(id)sender;

@end
