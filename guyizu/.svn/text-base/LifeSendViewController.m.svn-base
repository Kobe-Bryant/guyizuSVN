//
//  YingzhengViewController.m
//  Test-fabu
//
//  Created by lanye on 13-11-27.
//  Copyright (c) 2013年 lanye. All rights reserved.
//

#import "LifeSendViewController"

@interface LifeSendViewController ()


@end

@implementation LifeSendViewController

@synthesize backscroll = _backscroll,addpicbutton = _addpicbutton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _backscroll.contentSize = CGSizeMake(320, 580);
    self.titlescroll.contentSize = CGSizeMake(640, 100);

    self.backview.layer.borderWidth = 0.5f;
    self.backview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UIButton *fabubutton = [[UIButton alloc]initWithFrame:CGRectMake(15, 512, 290, 40)];
    [fabubutton setTitle:@"发 布" forState:UIControlStateNormal];
    [fabubutton setTintColor:[UIColor whiteColor]];
    [fabubutton setBackgroundColor:[UIColor colorWithRed:57/255.0 green:157/255.0 blue:1 alpha:1]];
    [_backscroll addSubview:fabubutton];
    
    self.phonetext.keyboardType = UIKeyboardTypeNumberPad;
    [self.phonetext addTarget:self action:@selector(textFieldDone)  forControlEvents:UIControlEventTouchDown]; //用textFieldDone函数，实现关闭数字键盘
   
    
    self.textview.delegate = self;
    
       self.assets = [[NSMutableArray alloc] init];
    
   
}
-(void)textFieldDone{
    
    [self.phonetext resignFirstResponder];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{   //开始编辑时，整体上移
   if (textField.tag==10) {
       //[_backscroll scrollRectToVisible:CGRectMake(0, 120, 320, _backscroll.frame.size.height) animated:YES];
       [self moveView:-178];
   }
    if (textField.tag ==11 ) {
        [self moveView:-210];
    }

}
-(void)textFieldDidEndEditing:(UITextField *)textField{     //结束编辑时，整体下移
    if (textField.tag==10) {
        [self moveView:178];
    }
    if (textField.tag == 11) {
        [self moveView:210];
    }

}
-(void)moveView:(float)move{
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = self.view.frame;
    frame.origin.y +=move;//view的y轴上移
    self.view.frame = frame;
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];//设置调整界面的动画效果
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
   
    if (textView.tag ==1) {
        [self moveView:-150];
    }
}

-(void)textViewDidChange:(UITextView *)textView
{
     [self.miaoshulable removeFromSuperview];
}


-(void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView.tag ==1) {
        [self moveView:150];
    }
}



-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
    }
    return YES; 
}

- (IBAction)addpicbutton:(id)sender {
    
    
    UIActionSheet* mySheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消"destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选择", nil];
     [mySheet showInView:self.view];
    
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;

{
    if (buttonIndex == 0) {
        
        [self.addpiclable removeFromSuperview];
        UIImagePickerController *pick = [[UIImagePickerController alloc]init];
        pick.delegate = self;
        pick.sourceType = UIImagePickerControllerSourceTypeCamera;
//        NSString *mediatype = (__bridge NSString *)kUTTypeImage;
//        pick.mediaTypes = [[NSArray alloc]initWithObjects:mediatype, nil];
        pick.allowsEditing = YES;
        [self presentViewController:pick animated:YES completion:NULL];
        
    }
    if (buttonIndex == 1) {
        [self.addpiclable removeFromSuperview];
       
        CTAssetsPickerController *picker = [[CTAssetsPickerController alloc] init];
        picker.maximumNumberOfSelection = 10;
        picker.assetsFilter = [ALAssetsFilter allAssets];
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:NULL];
  
        
    }
  
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [cermaimage removeFromSuperview];
    
    
    BOOL iscamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    if (!iscamera) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"没有相机" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alert show];
    }
    UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
    for (NSInteger j =0; j<info.count; j++) {
        cermaimage = [[UIImageView alloc]initWithFrame:CGRectMake((110+105*j), 10, 90, 80)];
        cermaimage.image = img;
        [self.titlescroll addSubview:cermaimage];
        UIImageWriteToSavedPhotosAlbum(cermaimage.image, nil, nil, nil);
    }

}




-(void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    
    
//    if (self.assets)
//    {
////
//
//       
//    }
      [self.assets removeAllObjects];
    [imageview removeFromSuperview];
   

     [self.assets addObjectsFromArray:assets];
    
    for (NSInteger i = 0; i<self.assets.count; i++) {
        
        imageview = [[UIImageView alloc]initWithFrame:CGRectMake((110+105*i), 10, 90, 80)];
        ALAsset *asset = [self.assets objectAtIndex:i];
        imageview.image = [UIImage imageWithCGImage:asset.thumbnail];
        [self.titlescroll addSubview:imageview];
    }
    
}

- (IBAction)bendibutton:(id)sender {
    
    [self.bendibutton setBackgroundImage:[UIImage imageNamed:@"life_select_click.png"] forState:UIControlStateNormal];
    [self.xianshangbutton setBackgroundImage:[UIImage imageNamed:@"life_select.png"] forState:UIControlStateNormal];
    
}

- (IBAction)xianshangbutton:(id)sender {
    
    [self.xianshangbutton setBackgroundImage:[UIImage imageNamed:@"life_select_click.png"] forState:UIControlStateNormal];
     [self.bendibutton setBackgroundImage:[UIImage imageNamed:@"life_select.png"] forState:UIControlStateNormal];
}




- (IBAction)time:(id)sender {
    [self.timetext resignFirstResponder];
}

- (IBAction)title:(id)sender {
    [self.titletext resignFirstResponder];
}

- (IBAction)connect:(id)sender {
    [self.cennecttext resignFirstResponder];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
