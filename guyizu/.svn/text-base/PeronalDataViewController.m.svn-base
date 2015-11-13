//
//  PeronalDataViewController.m
//  Peronal
//
//  Created by lanye on 13-11-30.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "PeronalDataViewController.h"
#define HTTP_URL @"http://www.guyizu.com/member.php?act=login_in&meth=edit_profile"
@interface PeronalDataViewController ()

@end

@implementation PeronalDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.assets = [[NSMutableArray alloc] initWithCapacity:10];
        _imagearry = [[NSMutableArray alloc]initWithCapacity:10];
        Str = @"0";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //构建nav
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"个人资料修改"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    self.backview.layer.borderWidth = 0.5f;
    self.backview.layer.borderColor = [UIColor lightGrayColor].CGColor;
   
    self.backscroll.contentSize = CGSizeMake(320, 750);
    self.titlescroll.contentSize = CGSizeMake(640, 100);
    
    fabubutton = [[UIButton alloc]initWithFrame:CGRectMake(15, 600, 290, 40)];
    [fabubutton setTitle:@"修 改" forState:UIControlStateNormal];
    [fabubutton setTintColor:[UIColor whiteColor]];
    [fabubutton setBackgroundColor:[UIColor colorWithRed:0/255.0 green:160/255.0 blue:211/255.0 alpha:1.0]];
    [fabubutton addTarget:self action:@selector(fabu) forControlEvents:UIControlEventTouchUpInside];
    [self.backscroll addSubview:fabubutton];
    self.numbertextfield.keyboardType = UIKeyboardTypeNumberPad;
    
    self.titleImg.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.titleImg addGestureRecognizer:tap];
    
}

-(void)fabu
{
      NSString *uidstr = [[NSUserDefaults standardUserDefaults]objectForKey:@"uid"];
    [self startDownload:uidstr email:self.emailtextfield.text mobile:self.numbertextfield.text realname:self.nametextfield.text adress:self.adresstextfield.text area:self.quyutextfield.text check_company:Str speciality:self.skilltextview.text];
}

-(void)startDownload:(NSString *)uid email:(NSString *)email mobile:(NSString *)mobile realname:(NSString *)realname adress:(NSString *)adress area:(NSString *)area check_company:(NSString *)check_company speciality:(NSString *)speciality
{
  
    NSString *httpStr = [HTTP_URL stringByAppendingFormat:@"&uid=%@&email=%@&mobile=%@&real=%@&adress=%@&area=%@&check_company=%@&speciality=%@",uid,email,mobile,realname,adress,area,check_company,speciality];
    LHYHTTPRequest *sendrequest = [[LHYHTTPRequest alloc]initWith:httpStr];
    sendrequest.delegate = self;
}

-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest
{
    NSLog(@"send=%@",send);
}

#pragma mark -
#pragma mark leftButtonClick

-(void)mleftBarBttonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.tag == 5) {
        [self.skilllable removeFromSuperview];
    }if (textView.tag == 6) {
        [self.describelable removeFromSuperview];
    }

}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [self.skilltextview resignFirstResponder];
        [self.describetextview resignFirstResponder];
    }
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.quyutextfield resignFirstResponder];
    [self.adresstextfield resignFirstResponder];
    [self.numbertextfield resignFirstResponder];
    [self.nametextfield resignFirstResponder];
    [self.emailtextfield resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{   //开始编辑时，整体上移
    if (textField.tag==14) {
        //[_backscroll scrollRectToVisible:CGRectMake(0, 120, 320, _backscroll.frame.size.height) animated:YES];
        [self moveView:-38];
    }
    if (textField.tag ==15 ) {
        [self moveView:-75];
    }
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{     //结束编辑时，整体下移
    if (textField.tag==14) {
        [self moveView:38];
    }
    if (textField.tag == 15) {
        [self moveView:75];
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
- (IBAction)peronalbutton:(id)sender {
    Str=@"0";
    [self.peronalbutton setBackgroundImage:[UIImage imageNamed:@"life_select_click.png"] forState:UIControlStateNormal];
    [self.bussinessbutton setBackgroundImage:[UIImage imageNamed:@"life_select.png"] forState:UIControlStateNormal];
}

- (IBAction)bussinessbutton:(id)sender {
     Str=@"1";
    [self.bussinessbutton setBackgroundImage:[UIImage imageNamed:@"life_select_click.png"] forState:UIControlStateNormal];
    [self.peronalbutton setBackgroundImage:[UIImage imageNamed:@"life_select.png"] forState:UIControlStateNormal];
}

- (IBAction)closekeyboard:(id)sender {
    [self.quyutextfield resignFirstResponder];
    [self.adresstextfield resignFirstResponder];
    [self.numbertextfield resignFirstResponder];
    [self.nametextfield resignFirstResponder];
    [self.emailtextfield resignFirstResponder];
    [self.skilltextview resignFirstResponder];
    [self.describetextview resignFirstResponder];
}

-(void)tap {
    UIActionSheet* mySheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"从相册中选择" otherButtonTitles:nil, nil];
    [mySheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;
{
//    if (buttonIndex == 0) {
//        
//        [self.addpiclable removeFromSuperview];
//        UIImagePickerController *pick = [[UIImagePickerController alloc]init];
//        pick.delegate = self;
//        pick.sourceType = UIImagePickerControllerSourceTypeCamera;
//        pick.allowsEditing = YES;
//        [self presentViewController:pick animated:YES completion:NULL];
//    }
//    if (buttonIndex == 1) {
        [self.addpiclable removeFromSuperview];
        
        CTAssetsPickerController *picker = [[CTAssetsPickerController alloc] init];
    
        picker.maximumNumberOfSelection = 10;
        picker.assetsFilter = [ALAssetsFilter allAssets];
        picker.delegate = self;
        
      
        [self presentViewController:picker animated:YES completion:NULL];
//    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    BOOL iscamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    if (!iscamera) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"没有相机" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alert show];
    }
    UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
    imageview = [[UIImageView alloc]initWithFrame:CGRectMake(110, 10, 90, 80)];
    imageview.image = img;
    [self.titlescroll addSubview:imageview];
    
}
-(void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    
    [self.assets removeAllObjects];
    [button removeFromSuperview];
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
        imageview = [[UIImageView alloc]initWithFrame:CGRectMake((110+105*i), 10, 90, 80)];
        ALAsset *asset = [self.assets objectAtIndex:i];
        imageview.image = [UIImage imageWithCGImage:asset.thumbnail];
        imageview.userInteractionEnabled = YES;
        [_imagearry addObject:imageview];
        
        button = [[UIButton alloc]initWithFrame:CGRectMake(61, 71, 29, 9)];
        button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"member_r28_c21.png"]];
        button.tag = i + 100;
        [button addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
        [imageview addSubview:button];
        [_titlescroll addSubview:imageview];
    }
}
-(void)change:(UIButton *)mButton
{
    NSLog(@"%d",mButton.tag);
    NSLog(@"%@",_imagearry);
    UIImageView *thisimageview = [_imagearry objectAtIndex:mButton.tag - 100];
    [thisimageview removeFromSuperview];
}




@end
