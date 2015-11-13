//
//  YingzhengViewController.m
//  Test-fabu
//
//  Created by lanye on 13-11-27.
//  Copyright (c) 2013年 lanye. All rights reserved.
//

#import "YingzhengViewController.h"
#import "ReWardFenleiViewController.h"
#import "DengluViewController.h"
#import "DownloadMessageAndReward.h"

@interface YingzhengViewController ()


@end

@implementation YingzhengViewController

@synthesize backscroll = _backscroll;
@synthesize leaveTabBar = _leaveTabBar;
@synthesize passStr = _passStr;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.assets = [[NSMutableArray alloc] init];
        _imagearry = [[NSMutableArray alloc]initWithCapacity:10];
        yeardata = [[NSMutableArray alloc]initWithObjects:@"2013",@"2014", nil];
        _passStr = [[NSMutableString alloc]initWithCapacity:0];
        
        _leftpasstr = [[NSMutableString alloc]init];
        _rightpasstr = [[NSMutableString alloc]init];
    
    
        mondata = [[NSMutableArray alloc]initWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",nil];
        daydata = [[NSMutableArray alloc]initWithObjects:@"01",@"02",@"03",@"04",@"05",@"05",@"07",nil];
        huordata = [[NSMutableArray alloc]initWithObjects:@"13",@"14",@"15",@"16",@"17",@"18",@"19",nil];
    
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //注册观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downloadOver) name:@"xuanshangfabuOver" object:nil];
    
    
    _backscroll.contentSize = CGSizeMake(320, 830);
    self.titlescroll.contentSize = CGSizeMake(640, 100);

    self.backview.layer.borderWidth = 0.5f;
    self.backview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.backPick.layer.borderWidth = 0.5f;
    self.backPick.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    UIButton *fabubutton = [[UIButton alloc]initWithFrame:CGRectMake(15, 575, 290, 40)];
    [fabubutton setTitle:@"发 布" forState:UIControlStateNormal];
    [fabubutton setTintColor:[UIColor whiteColor]];
    [fabubutton addTarget:self action:@selector(fabu) forControlEvents:UIControlEventTouchUpInside];
    [fabubutton setBackgroundColor:[UIColor colorWithRed:0/255.0 green:160/255.0 blue:211/255.0 alpha:1]];
    [_backscroll addSubview:fabubutton];
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"发布悬赏"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    //照相机
    self.titleImg.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(img)];
    [self.titleImg addGestureRecognizer:tap];
    
    //结束时间
    self.timebackView.userInteractionEnabled = YES;
    UITapGestureRecognizer *taptime = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(taptime)];
    [self.timebackView addGestureRecognizer:taptime];
    
    //类别
    self.leibieView.userInteractionEnabled = YES;
    UITapGestureRecognizer *leibieTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leibieTap)];
    [self.leibieView addGestureRecognizer:leibieTap];
    self.leibieLab.text = _passStr;
    
    
    self.phonetext.keyboardType = UIKeyboardTypeNumberPad;
    self.choujintextfield.keyboardType = UIKeyboardTypeNumberPad;
    self.dianfutextfield.keyboardType = UIKeyboardTypeNumberPad;
}

-(void)mleftBarBttonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -

-(void)fabu
{
    BOOL islog = [[NSUserDefaults standardUserDefaults] boolForKey:@"islogin"];
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    if (islog) {
        
        if ([self.choujintextfield.text isEqualToString:@""] || [self.dianfutextfield.text isEqualToString:@""] || [self.titletext.text isEqualToString:@""] || [self.cennecttext.text isEqualToString:@""] || [self.phonetext.text isEqualToString:@""] || [self.textview.text isEqualToString:@""]) {
            
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"请输入完整文字" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show];
            
        }else if (![phoneTest evaluateWithObject:self.phonetext.text]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"请输入正确手机号格式" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }else{
            [self sendRequeast];
        }

    }else{
        DengluViewController *denglu = [[DengluViewController alloc]initWithNibName:@"DengluViewController" bundle:nil];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:denglu];
        [self presentViewController:nav animated:YES completion:nil];
    }
}

#pragma mark -
#pragma mark DownloadOver

-(void)downloadOver{
    NSMutableDictionary *mDic = [DownloadMessageAndReward shareDownload].passDic;
    NSString *str = [[mDic objectForKey:@"data"] objectForKey:@"msg"];
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:str delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alertView show];

}

-(void)sendRequeast{
    //发送请求,在这里拼接URL字符串，然后发送请求
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"];
    
    [[DownloadMessageAndReward shareDownload] startRewardDownload:str mid:2 fatherID:_leftpasstr sonID:_rightpasstr lng:102.03310 lat:25.12680 name:self.titletext.text price:self.choujintextfield.text c_use_price:self.dianfutextfield.text content:self.cennecttext.text phoneNum:self.phonetext.text fnishTime:self.timeLab.text];
    
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"发布成功" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
//    [alert show];
}

#pragma mark -

-(void)textFieldDidBeginEditing:(UITextField *)textField{   //开始编辑时，整体上移
    if (textField.tag==10) {
       //[_backscroll scrollRectToVisible:CGRectMake(0, 120, 320, _backscroll.frame.size.height) animated:YES];
       [self moveView:-178];
   }
    if (textField.tag ==11 ) {
        [self moveView:-210];
    }

}
-(void)textFieldDidEndEditing:(UITextField *)textField{ //结束编辑时，整体下移
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
//pickView 的消失／出现
-(void)taptime
{
    [self.backPick becomeFirstResponder];
    [self.choujintextfield resignFirstResponder];
    [self.dianfutextfield resignFirstResponder];
    [self.titletext resignFirstResponder];
    [self.cennecttext resignFirstResponder];
    [self.phonetext resignFirstResponder];
    [self.textview resignFirstResponder];
    [self.leveyTabBarController hidesTabBar:YES animated:YES];// 控制tabbar的消失
    self.backPick.hidden = NO;
}

- (IBAction)pickBtn:(id)sender {
    [self.leveyTabBarController hidesTabBar:NO animated:YES];//控制tabbar的出现
    self.backPick.hidden = YES;
}


//显示照相机或相册
-(void)img {
    UIActionSheet* mySheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消"destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选择", nil];
     [mySheet showInView:self.view];
}

//显示类别的名称
-(void)leibieTap
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;

{
    if (buttonIndex == 0) {
        [self.leveyTabBarController hidesTabBar:NO animated:YES];//控制tabbar的出现
        [self.addpiclable removeFromSuperview];
        UIImagePickerController *pick = [[UIImagePickerController alloc]init];
        pick.delegate = self;
        pick.sourceType = UIImagePickerControllerSourceTypeCamera;
        pick.allowsEditing = YES;
        [self presentViewController:pick animated:YES completion:NULL];
        
    }
    if (buttonIndex == 1) {
        [self.addpiclable removeFromSuperview];
       
        CTAssetsPickerController *picker = [[CTAssetsPickerController alloc] init];
        picker.maximumNumberOfSelection = 10;
        picker.assetsFilter = [ALAssetsFilter allAssets];
        picker.delegate = self;
        //问题出在这里
        for (UIImageView *thisView in _imagearry) {
            [thisView removeFromSuperview];
        }
        [_imagearry removeAllObjects];

        
        [self presentViewController:picker animated:YES completion:NULL];
  
        
    }
  
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self.leveyTabBarController hidesTabBar:YES animated:YES];// 控制tabbar的消失
    BOOL iscamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    if (!iscamera) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"没有相机" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alert show];
    }
    UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
 
        imageview = [[UIImageView alloc]initWithFrame:CGRectMake(110, 10, 90, 80)];
        imageview.image = img;
        [self.titlescroll addSubview:imageview];
 
    [self dismissViewControllerAnimated:YES completion:NULL];
  
}
-(void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    [self.assets removeAllObjects];
    for (UIImageView *thisView in _imagearry) {
        [thisView removeFromSuperview];
    }

     [self.assets addObjectsFromArray:assets];
    
    for (NSInteger i = 0; i<self.assets.count; i++) {
        imageview = [[UIImageView alloc]initWithFrame:CGRectMake((110+105*i), 10, 90, 80)];
        imageview.userInteractionEnabled = YES;
        ALAsset *asset = [self.assets objectAtIndex:i];
        imageview.image = [UIImage imageWithCGImage:asset.thumbnail];
         [_imagearry addObject:imageview];
        button = [[UIButton alloc]initWithFrame:CGRectMake(61, 71, 29, 9)];
        button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"member_r28_c21.png"]];
        button.tag = i + 300;
        [button addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
        [imageview addSubview:button];
        [self.titlescroll addSubview:imageview];
    }
    
}

-(void)change:(UIButton *)mButton
{
//    NSLog(@"%d",mButton.tag);
//    NSLog(@"%@",_imagearry);
    UIImageView *thisimageview = [_imagearry objectAtIndex:mButton.tag - 300];
    [thisimageview removeFromSuperview];
}


- (IBAction)bendibutton:(id)sender {
    
    [self.bendibutton setBackgroundImage:[UIImage imageNamed:@"life_select_click.png"] forState:UIControlStateNormal];
    [self.xianshangbutton setBackgroundImage:[UIImage imageNamed:@"life_select.png"] forState:UIControlStateNormal];
    
}

- (IBAction)xianshangbutton:(id)sender {
    
    [self.xianshangbutton setBackgroundImage:[UIImage imageNamed:@"life_select_click.png"] forState:UIControlStateNormal];
     [self.bendibutton setBackgroundImage:[UIImage imageNamed:@"life_select.png"] forState:UIControlStateNormal];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.choujintextfield resignFirstResponder];
    [self.dianfutextfield resignFirstResponder];
    [self.titletext resignFirstResponder];
    [self.cennecttext resignFirstResponder];
    [self.phonetext resignFirstResponder];
    [self.textview resignFirstResponder];
    return YES;
}

- (IBAction)keyboard:(id)sender {
    
    [self.choujintextfield resignFirstResponder];
    [self.dianfutextfield resignFirstResponder];
     [self.titletext resignFirstResponder];
    [self.cennecttext resignFirstResponder];
    [self.phonetext resignFirstResponder];
    [self.textview resignFirstResponder];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 4;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component ==0) {
        return yeardata.count;
    }
    if (component ==1) {
        return mondata.count;
    }if (component == 2) {
         return daydata.count;
    }
    if (component == 3) {
        return huordata.count;
    }
    return component;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component ==0) {
        return [yeardata objectAtIndex:row];
    }
    if (component ==1) {
        return [mondata objectAtIndex:row];
    }if (component ==2) {
         return [daydata objectAtIndex:row];
    }
    if (component == 3) {
        return [huordata objectAtIndex:row];
    }
    return nil;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        timeStr1 = [yeardata objectAtIndex:row];
    }
    if (component == 1) {
        timeStr2 = [mondata objectAtIndex:row];
    }
    if (component ==2) {
         timeStr3 = [daydata objectAtIndex:row];
    }
    if (component == 3) {
        timeStr4 = [huordata objectAtIndex:row];
    }
    if (timeStr1 == NULL) {
        timeStr1 =[NSString stringWithFormat:@"00"];
    }
    if (timeStr2 == NULL) {
        timeStr2 =[NSString stringWithFormat:@"00"];
    }
    if (timeStr3 == NULL) {
        timeStr3 =[NSString stringWithFormat:@"00"];
    }
    if (timeStr4 == NULL) {
        timeStr4 =[NSString stringWithFormat:@"00"];
    }
    self.timeLab.text = [NSString stringWithFormat:@"%@-%@-%@ %@:00:00",timeStr1,timeStr2,timeStr3,timeStr4];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
