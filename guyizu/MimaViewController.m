//
//  MimaViewController.m
//  Test-denglu
//
//  Created by lanye on 13-11-26.
//  Copyright (c) 2013年 lanye. All rights reserved.
//

#import "MimaViewController.h"

#define HTTP_URL @"http://www.guyizu.com/member.php?act=login_in&meth=find_step1"

@interface MimaViewController ()
- (IBAction)delekeyboard:(id)sender;

@end

@implementation MimaViewController
@synthesize userview = _userview;

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
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"找回密码"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    _userview.layer.borderWidth = 0.4f;
    _userview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    usertext = [[UITextField alloc] initWithFrame:CGRectMake(63.6f, 105.0f, 236.0f, 44.0f)];
    [usertext setBorderStyle:UITextBorderStyleNone]; //外框类型
    usertext.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直居中对齐
    usertext.layer.borderWidth = 0.4f;
    usertext.layer.borderColor = [UIColor lightGrayColor].CGColor;
    usertext.font = [UIFont systemFontOfSize:14.0];
    usertext.placeholder = @" 请输入你注册的用户名"; //默认显示的字
    usertext.backgroundColor = [UIColor whiteColor];
    usertext.delegate = self;
    
    UIView *userview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    usertext.leftView = userview;
    usertext.leftViewMode = UITextFieldViewModeAlways;
    
 
    
    [self.view addSubview:usertext];
}

-(void)mleftBarBttonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)method:(id)sender
{
    if ([usertext.text isEqualToString:@""]) {
        self.alertLab.hidden = NO;
    }
    
    
    if (usertext.text && ![usertext.text isEqualToString:@""]) {
        
        NSString *str = [HTTP_URL stringByAppendingFormat:@"&username=%@", usertext.text];
        LHYHTTPRequest *mRequest = [[LHYHTTPRequest alloc]initWith:str];
        mRequest.delegate = self;
        
        
    }else{
        
    }
    
    
}

#pragma mark -

-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest{
    NSNumber *str = [send objectForKey:@"status"];

    if ([str isEqualToNumber:[NSNumber numberWithInt:1]]) {
        if (_tapCount == 0) {
            MethodViewController *method = [[MethodViewController alloc]init];
            [method.username setString:usertext.text];
            [self.navigationController pushViewController:method animated:YES];
            ++_tapCount;
        }
    }


}

#pragma mark -

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [usertext resignFirstResponder];
    return YES;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)delekeyboard:(id)sender {
     [usertext resignFirstResponder];
}
@end
