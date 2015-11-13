//
//  ChangepasswordViewController.m
//  ChangPassword
//
//  Created by lanye on 13-11-30.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "ChangepasswordViewController.h"
#import "DownloadmimaModel.h"
@interface ChangepasswordViewController ()

@end

@implementation ChangepasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization0
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mimaDownload) name:@"mimaDownloadOver" object:nil];
    
    //构建nav
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"密码修改"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    
    _oldpassview.layer.borderWidth = 0.5f;
    _oldpassview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    _newpassview.layer.borderWidth = 0.5f;
    _newpassview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    _newagainpassview.layer.borderWidth = 0.5f;
    _newagainpassview.layer.borderColor = [UIColor lightGrayColor].CGColor;

    
    self.oldpassfield.layer.borderWidth = 0.4f;
    self.oldpassfield.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.newpassfield.layer.borderWidth = 0.5f;
    self.newpassfield.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.newagainpassfield.layer.borderWidth = 0.4f;
    self.newagainpassfield.layer.borderColor = [UIColor lightGrayColor].CGColor;

    UIView *oldpass = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    self.oldpassfield.leftView = oldpass;
    self.oldpassfield.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:self.oldpassfield];

    UIView *newpass = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    self.newpassfield.leftView = newpass;
    self.newpassfield.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:self.newpassfield];

    UIView *newagain = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    self.newagainpassfield.leftView = newagain;
    self.newagainpassfield.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:self.newagainpassfield];
}

-(void)mimaDownload
{
   
    NSMutableDictionary *mDic = [DownloadmimaModel shareDownload].passDic;
    NSString *str;
     if ([[mDic objectForKey:@"msg"] isEqualToString:@""])
     {
         str = @"修改密码成功";
         
     }else{
        str =[mDic objectForKey:@"msg"];
     
     }
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:str delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
}

#pragma mark -
#pragma mark leftButtonClick

-(void)mleftBarBttonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.oldpassfield resignFirstResponder];
    [self.newagainpassfield resignFirstResponder];
    [self.newpassfield resignFirstResponder];
    return YES;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closekeyboard:(id)sender {
    [self.oldpassfield resignFirstResponder];
    [self.newagainpassfield resignFirstResponder];
    [self.newpassfield resignFirstResponder];
}

-(void)sendRequest
{
     NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"];
    [[DownloadmimaModel shareDownload]startDownload:str old:self.oldpassfield.text new1:self.newpassfield.text new2:self.newagainpassfield.text];
}

- (IBAction)submit:(id)sender {
    
    if ([self.newpassfield.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"新密码不能为空" message:nil delegate:self cancelButtonTitle:@" 确定" otherButtonTitles:@"取消", nil];
        [alert show];
    }else{
     
    if ([self.newpassfield.text isEqualToString:self.newagainpassfield.text]) {
        [self sendRequest];
       // UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"密码修改成功" message:nil delegate:self cancelButtonTitle:@" 确定" otherButtonTitles:nil, nil];
       // [alert show];
    }else{
        self.errorlable.hidden = NO;
       
    }}
    
}


@end
