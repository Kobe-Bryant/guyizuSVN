//
//  YingzhengViewController.h
//  Test-fabu
//
//  Created by lanye on 13-11-27.
//  Copyright (c) 2013年 lanye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTAssetsPickerController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface LifeSendViewController : UIViewController<UITextViewDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,CTAssetsPickerControllerDelegate,UIImagePickerControllerDelegate>
{
    UIScrollView *_backscroll;
    UIButton *_addpicbuttton;
    
    UIImageView *imageview;
    UIImageView *cermaimage;
}

@property (strong, nonatomic) IBOutlet UIScrollView *backscroll;
@property (weak, nonatomic) IBOutlet UIButton *bendibutton;
@property (weak, nonatomic) IBOutlet UIButton *xianshangbutton;
@property (weak, nonatomic) IBOutlet UITextField *timetext;
@property (weak, nonatomic) IBOutlet UITextField *titletext;
@property (weak, nonatomic) IBOutlet UITextField *cennecttext;
@property (weak, nonatomic) IBOutlet UITextField *phonetext;

@property (weak, nonatomic) IBOutlet UIView *backview;
@property (weak, nonatomic) IBOutlet UILabel *miaoshulable;
@property (weak, nonatomic) IBOutlet UITextView *textview;
@property (strong, nonatomic) IBOutlet UIButton *addpicbutton;
@property (weak, nonatomic) IBOutlet UIScrollView *titlescroll;
@property (nonatomic, strong) NSMutableArray *assets;
@property (weak, nonatomic) IBOutlet UILabel *addpiclable;




- (IBAction)time:(id)sender;
- (IBAction)title:(id)sender;
- (IBAction)connect:(id)sender;
- (IBAction)addpicbutton:(id)sender;


- (IBAction)bendibutton:(id)sender;
- (IBAction)xianshangbutton:(id)sender;


@end
