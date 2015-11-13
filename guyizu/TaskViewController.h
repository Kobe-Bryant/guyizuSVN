//
//  TaskViewController.h
//  Task
//
//  Created by lanye on 13-12-2.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTAssetsPickerController.h"
@interface TaskViewController : UIViewController<UITextViewDelegate,UIActionSheetDelegate,CTAssetsPickerControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    UITextView *_textview;
    UIImageView *imageview;
    NSMutableArray *_imagearry;
    UIButton *button;
    NSInteger i;
}


@property (strong, nonatomic) IBOutlet UITextView *textview;
@property (strong, nonatomic) IBOutlet UILabel *shensulable;
@property (strong, nonatomic) IBOutlet UIView *backview;
@property (nonatomic, strong) NSMutableArray *assets;

@property (strong, nonatomic) IBOutlet UIImageView *titleImg;

@end
