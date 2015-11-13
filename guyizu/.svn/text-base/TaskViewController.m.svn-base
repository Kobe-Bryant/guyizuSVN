//
//  TaskViewController.m
//  Task
//
//  Created by lanye on 13-12-2.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "TaskViewController.h"

@interface TaskViewController ()

@end

@implementation TaskViewController
@synthesize textview=_textview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
          self.assets = [[NSMutableArray alloc]initWithCapacity:10];
        _imagearry = [[NSMutableArray alloc]initWithCapacity:10];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.backview.layer.borderWidth = 0.5f;
    self.backview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"任务申诉"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    self.titleImg.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(img)];
    [self.titleImg addGestureRecognizer:tap];
}
-(void)mleftBarBttonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    self.shensulable.hidden = YES;

}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
      self.shensulable.hidden = NO;
    }
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [_textview resignFirstResponder];
    }
    return YES;
}
- (void)img {
    UIActionSheet* mySheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消"destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选择", nil];
    [mySheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    if (buttonIndex == 0) {
        UIImagePickerController *pick = [[UIImagePickerController alloc]init];
        pick.delegate = self;
        pick.sourceType = UIImagePickerControllerSourceTypeCamera;
        pick.allowsEditing = YES;
        [self presentViewController:pick animated:YES completion:NULL];
    }
    if (buttonIndex == 1) {
        CTAssetsPickerController *picker = [[CTAssetsPickerController alloc] init];
        picker.maximumNumberOfSelection = 10;
        picker.assetsFilter = [ALAssetsFilter allAssets];
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:NULL];
    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    BOOL iscamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    if (!iscamera) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"没有相机" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alert show];
    }
   // UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
}
-(void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    [self.assets removeAllObjects];
    for (UIImageView *thisView in _imagearry) {
        [thisView removeFromSuperview];
    }
    
    //问题出在这里
    for (UIImageView *thisView in _imagearry) {
        [thisView removeFromSuperview];
    }
    [_imagearry removeAllObjects];
    [self.assets addObjectsFromArray:assets];
    
      for (i = 0; i<self.assets.count; i++) {
        ALAsset *asset = [self.assets objectAtIndex:i];
          if (i>1) {
        
              imageview = [[UIImageView alloc]initWithFrame:CGRectMake(10+(i-2)*95, 300, 80, 60)];
    
          }else{
             imageview = [[UIImageView alloc]initWithFrame:CGRectMake(105+95*i, 232, 80, 60)];
          }
          imageview.image = [UIImage imageWithCGImage:asset.thumbnail];
          imageview.userInteractionEnabled = YES;
          
          button = [[UIButton alloc]initWithFrame:CGRectMake(51,51, 29, 9)];
          button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"member_r28_c21.png"]];
          button.tag = i + 500;
          [button addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
          [imageview addSubview:button];
          [_imagearry addObject:imageview];
          [self.backview addSubview:imageview];
      }
}

-(void)change:(UIButton *)mButton
{
    UIImageView *thisimageview = [_imagearry objectAtIndex:mButton.tag - 500];
    [thisimageview removeFromSuperview];
    
}









@end
