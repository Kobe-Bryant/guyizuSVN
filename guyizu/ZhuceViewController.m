//
//  ZhuceViewController.m
//  Test-denglu
//
//  Created by lanye on 13-11-26.
//  Copyright (c) 2013年 lanye. All rights reserved.
//

#import "ZhuceViewController.h"

#define HTTP_URL @"http://www.guyizu.com/member.php?act=login_in&meth=reg"
#define DENGLU_URL @"http://www.guyizu.com/member.php?act=login_in&meth=login"

@interface ZhuceViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userlable;
@property (weak, nonatomic) IBOutlet UILabel *passlable;

@property (weak, nonatomic) IBOutlet UILabel *passwordlable;
@property (weak, nonatomic) IBOutlet UILabel *amaillable;
@property (weak, nonatomic) IBOutlet UILabel *phonelable;

@end

@implementation ZhuceViewController
@synthesize userview = _userview,setview = _setview,sureview = _sureview,emailview = _emailview,phoneview = _phoneview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    _tapCount = 0;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.backscroll.contentSize = CGSizeMake(320, 710);
    
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"用户注册"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    
    _userview.layer.borderWidth = 0.4f;
    _userview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    usertext = [[UITextField alloc] initWithFrame:CGRectMake(63.6f, 35.0f, 226.0f, 44.0f)];
    [usertext setBorderStyle:UITextBorderStyleNone]; //外框类型
    usertext.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//字体垂直居中对齐
    usertext.layer.borderWidth = 0.4f;
    usertext.layer.borderColor = [UIColor lightGrayColor].CGColor;
    usertext.font = [UIFont systemFontOfSize:14.0];
    usertext.placeholder = @" 请输入你的用户名"; //默认显示的字
    usertext.backgroundColor = [UIColor whiteColor];
    
    UIView *userview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    usertext.leftView = userview;
    usertext.leftViewMode = UITextFieldViewModeAlways;
    [self.backscroll addSubview:usertext];
    
    _setview.layer.borderWidth = 0.4f;
    _setview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    settext = [[UITextField alloc] initWithFrame:CGRectMake(63.6f, 99.0f, 226.0f, 44.0f)];
    [settext setBorderStyle:UITextBorderStyleNone]; //外框类型
    settext.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//字体垂直居中对齐
    settext.layer.borderWidth = 0.4f;
    settext.layer.borderColor = [UIColor lightGrayColor].CGColor;
    settext.font = [UIFont systemFontOfSize:14.0];
    settext.placeholder = @" 请设置密码"; //默认显示的字
    settext.backgroundColor = [UIColor whiteColor];
    
    UIView *setview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    settext.leftView = setview;
    settext.leftViewMode = UITextFieldViewModeAlways;
    
    [self.backscroll addSubview:settext];
    
    _sureview.layer.borderWidth = 0.4f;
    _sureview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    suretext = [[UITextField alloc] initWithFrame:CGRectMake(63.6f, 163.0f, 226.0f, 44.0f)];
    [suretext setBorderStyle:UITextBorderStyleNone]; //外框类型
    suretext.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//字体垂直居中对齐
    suretext.layer.borderWidth = 0.4f;
    suretext.layer.borderColor = [UIColor lightGrayColor].CGColor;
    suretext.font = [UIFont systemFontOfSize:14.0];
    suretext.placeholder = @" 请确认密码"; //默认显示的字
    suretext.backgroundColor = [UIColor whiteColor];
    
    UIView *sureview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    suretext.leftView = sureview;
    suretext.leftViewMode = UITextFieldViewModeAlways;
    
    [self.backscroll addSubview:suretext];
    
    _emailview.layer.borderWidth = 0.4f;
    _emailview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    emailtext = [[UITextField alloc] initWithFrame:CGRectMake(63.6f, 227.0f, 226.0f, 44.0f)];
    [emailtext setBorderStyle:UITextBorderStyleNone]; //外框类型
    emailtext.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    emailtext.layer.borderWidth = 0.4f;
    emailtext.layer.borderColor = [UIColor lightGrayColor].CGColor;
    emailtext.font = [UIFont systemFontOfSize:14.0];
    emailtext.placeholder = @" 请输入你的邮箱"; //默认显示的字
    emailtext.backgroundColor = [UIColor whiteColor];
    
    UIView *emailview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    emailtext.leftView = emailview;
    emailtext.leftViewMode = UITextFieldViewModeAlways;
    
    [self.backscroll addSubview:emailtext];
    
    _phoneview.layer.borderWidth = 0.4f;
    _phoneview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    phonetext = [[UITextField alloc] initWithFrame:CGRectMake(63.6f, 291.0f, 226.0f, 44.0f)];
    [phonetext setBorderStyle:UITextBorderStyleNone]; //外框类型
    phonetext.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    phonetext.layer.borderWidth = 0.4f;
    phonetext.layer.borderColor = [UIColor lightGrayColor].CGColor;
    phonetext.font = [UIFont systemFontOfSize:14.0];
    phonetext.placeholder = @" 请输入你的手机号码"; //默认显示的字
    phonetext.backgroundColor = [UIColor whiteColor];
    phonetext.keyboardType = UIKeyboardTypeNumberPad;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(close)];
    [self.backscroll addGestureRecognizer:tap];
    
    
    UIView *phoneview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    phonetext.leftView = phoneview;
    phonetext.leftViewMode = UITextFieldViewModeAlways;
    
//    [phonetext addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingDidBegin];
//    [phonetext addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventEditingDidEnd];
    
    [self.backscroll addSubview:phonetext];
    
    usertext.delegate = self;
    settext.delegate = self;
    suretext.delegate = self;
    emailtext.delegate = self;
    phonetext.delegate = self;
    
  
}



-(void)mleftBarBttonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)zhuce:(id)sender
{
    
    if ([usertext.text isEqualToString:@""]) {
        self.userlable.hidden = NO;
    }else{
        self.userlable.hidden = YES;
    }
    
    if ([settext.text isEqualToString:@""]) {
        self.passlable.hidden = NO;
    }else{
        self.passlable.hidden = YES;
    }
    
    if ([suretext.text isEqualToString:@""]) {
        self.passwordlable.hidden = NO;
    }else{
        self.passwordlable.hidden = YES;
    }
    
    if ([emailtext.text isEqualToString:@""]) {
        self.amaillable.hidden = NO;
    }else{
        self.amaillable.hidden = YES;
    }

    if ([phonetext.text isEqualToString:@""]) {
        self.phonelable.hidden = NO;
    }else{
        self.phonelable.hidden = YES;
    }
    
    //lihongyang
    if (self.userlable.hidden&&self.passlable.hidden&&self.passwordlable.hidden&&self.amaillable.hidden&&self.phonelable.hidden && _tapCount == 0) {
        
        NSString *str1 = [NSString stringWithFormat:@"&username=%@&password=%@&password2=%@&email=%@&mobile=%@", usertext.text, settext.text, suretext.text, emailtext.text, phonetext.text];
        NSString *str = [HTTP_URL stringByAppendingString:str1];
        LHYHTTPRequest *sendHttp = [[LHYHTTPRequest alloc]initWith:str];
        
        NSLog(@"delegate=%@",sendHttp.delegate);
        
        sendHttp.delegate = self;
        
        ++_tapCount;
    }

   
}

#pragma mark -

//BOOL isZhuceSecese = NO;
-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest{
    _tapCount = 0;
    
    if ((LHYHTTPRequest *)mLHYHTTPRequest == dengluRequest) {
        
        NSNumber *nuber = [send objectForKey:@"status"];
        
        if ([nuber boolValue] == 1) {
            //如果成功取得uid
            NSString *uidStr = [[send objectForKey:@"data"] objectForKey:@"uid"];
            
            //储存登陆信息
            [[NSUserDefaults standardUserDefaults] setObject:uidStr forKey:@"uid"];
            [[NSUserDefaults standardUserDefaults] setBool: YES forKey:@"islogin"];
            
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self dismissViewControllerAnimated:YES completion:nil];
            
            
            return;
        }else{
            NSMutableString *str = [send objectForKey:@"msg"];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:str message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
        }
        
        return;
    }
    

    NSNumber *nuber = [send objectForKey:@"status"];

    if ([nuber boolValue] == 1) {
        
        //login
        NSString *username = [NSString stringWithFormat:@"&username=%@", usertext.text];
        NSString *passworld = [NSString stringWithFormat:@"&password=%@", suretext.text];
        NSString *str = [DENGLU_URL stringByAppendingFormat:@"%@%@",username, passworld];
        dengluRequest = [[LHYHTTPRequest alloc]initWith:str];
        dengluRequest.delegate = self;
        return;
        
    }else{
        NSMutableString *str = [send objectForKey:@"msg"];
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:str message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
        return;
    }
}

#pragma mark -

- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    [emailtext resignFirstResponder];
    [suretext resignFirstResponder];
    [settext resignFirstResponder];
    [usertext resignFirstResponder];
   
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
     NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
        if ([phoneTest evaluateWithObject:phonetext.text]) {
            self.phonelable.hidden = YES;
        }else{
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"请输入有效邮箱格式" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            [alert show];
             self.phonelable.hidden = NO;
        }
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if ([emailTest evaluateWithObject:emailtext.text]) {
        
        self.amaillable.hidden = YES;
    }else
    {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"请输入正确手机号码格式" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
        
        self.amaillable.hidden = NO;
    }
    return YES;
}

-(void)close
{
    [emailtext resignFirstResponder];
    [suretext resignFirstResponder];
    [settext resignFirstResponder];
    [usertext resignFirstResponder];
     [phonetext resignFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}


@end
