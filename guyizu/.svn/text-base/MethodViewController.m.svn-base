//
//  MethodViewController.m
//  Test-denglu
//
//  Created by lanye on 13-11-26.
//  Copyright (c) 2013年 lanye. All rights reserved.
//

#import "MethodViewController.h"

#define HTTP_URL @"http://www.guyizu.com/member.php?act=login_in&meth=find_email_step2"
#define HTTP_PHONE @"http://www.guyizu.com/member.php?act=login_in&meth=find_mobile_step2"

@interface MethodViewController ()
@property (weak, nonatomic) IBOutlet UILabel *phonelable;

@end

@implementation MethodViewController
@synthesize phoneview = _phoneview,segment = _segment,titlelable = _titlelable,titleimage = _titleimage,titleview = _titleview,sendbutton = _sendbutton ;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _username = [[NSMutableString alloc]initWithCapacity:0];
    }
    return self;
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
    
    _titleimage = [[UIImageView alloc]initWithFrame:CGRectMake(17, 14, 8, 16)];
    _titleimage.image = [UIImage imageNamed:@"member_phone.png"];
    [_titleview addSubview:_titleimage];
    
    _phoneview.layer.borderWidth = 0.4f;
    _phoneview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    phonetext = [[UITextField alloc] initWithFrame:CGRectMake(63.6f, 133.0f, 236.0f, 44.0f)];
    [phonetext setBorderStyle:UITextBorderStyleNone]; //外框类型
    phonetext.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    phonetext.layer.borderWidth = 0.4f;
    phonetext.layer.borderColor = [UIColor lightGrayColor].CGColor;
    phonetext.font = [UIFont systemFontOfSize:14.0];
    phonetext.placeholder = @" 请输入你的手机号"; //默认显示的字
    phonetext.backgroundColor = [UIColor whiteColor];
    phonetext.delegate = self;
    
    UIView *phoneview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    phonetext.leftView = phoneview;
    phonetext.leftViewMode = UITextFieldViewModeAlways;
    phonetext.keyboardType = UIKeyboardTypeNumberPad;
    [phonetext addTarget:self action:@selector(textFieldDone)  forControlEvents:UIControlEventTouchDown]; //用textFieldDone函数，实现关闭数字键盘
    
    [self.view addSubview:phonetext];
    
    _sendbutton = [[UIButton alloc]initWithFrame:CGRectMake(20, 215, 280, 44)];
    [_sendbutton setTitle:@"发 送" forState:UIControlStateNormal];
    [_sendbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _sendbutton.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [_sendbutton setBackgroundColor:[UIColor colorWithRed:0/255.0 green:160/255.0 blue:211/255.0 alpha:1]];
    [_sendbutton addTarget:self action:@selector(phone) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sendbutton];
    
}

-(void)mleftBarBttonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)select:(id)sender {
    
    UISegmentedControl *seg=(UISegmentedControl *)sender;
    NSInteger indexclick = seg.selectedSegmentIndex;
    if (indexclick ==0) {
        self.emailLab.hidden = YES;
        [_titleimage removeFromSuperview];
        [_sendbutton removeFromSuperview];
        [self textFieldDone];
       phonetext.placeholder = @" 请输入你的手机号";
       phonetext.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        phonetext.keyboardType = UIKeyboardTypeNumberPad;
        _titlelable.text = @"若您未捆绑手机号，请选择邮箱找回";
        _titlelable.font = [UIFont systemFontOfSize:13.0];
        
        _titleimage = [[UIImageView alloc]initWithFrame:CGRectMake(17, 14, 8, 16)];
        _titleimage.image = [UIImage imageNamed:@"member_phone.png"];
        [_titleview addSubview:_titleimage];
        
        
        _sendbutton = [[UIButton alloc]initWithFrame:CGRectMake(20, 215, 280, 44)];
        [_sendbutton setTitle:@"发 送" forState:UIControlStateNormal];
        [_sendbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _sendbutton.titleLabel.font = [UIFont systemFontOfSize:20.0];
        [_sendbutton setBackgroundColor:[UIColor colorWithRed:0 green:160/255.0 blue:211/255.0 alpha:1]];
        [_sendbutton addTarget:self action:@selector(phone) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_sendbutton];

    }
    else if(indexclick == 1)
    {
         self.phonelable.hidden = YES;
        [_titleimage removeFromSuperview];
        [_sendbutton removeFromSuperview];
        [self textFieldDone];
     
        
        phonetext.placeholder = @" 请输入你的电子邮箱地址";
        phonetext.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        phonetext.keyboardType = UIKeyboardTypeEmailAddress;
        _titlelable.text = @"输入你注册的邮箱";
        _titlelable.font = [UIFont systemFontOfSize:13.0];
        
        _titleimage = [[UIImageView alloc]initWithFrame:CGRectMake(14, 17, 15, 10)];
        _titleimage.image = [UIImage imageNamed:@"member_email.png"];
        [_titleview addSubview:_titleimage];
        
        _sendbutton = [[UIButton alloc]initWithFrame:CGRectMake(20, 215, 280, 44)];
        [_sendbutton setTitle:@"发 送" forState:UIControlStateNormal];
        [_sendbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _sendbutton.titleLabel.font = [UIFont systemFontOfSize:20.0];
        [_sendbutton setBackgroundColor:[UIColor colorWithRed:0 green:160/255.0 blue:211/255.0 alpha:1]];
        [_sendbutton addTarget:self action:@selector(email) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_sendbutton];
    }
}

- (IBAction)delekeyboard:(id)sender {
     [phonetext resignFirstResponder];
}

#pragma mark -

-(void)phone
{
    
    if ([phonetext.text isEqualToString:@""]) {
        self.phonelable.hidden = NO;
    }else{
        
        NSString *str = [HTTP_PHONE stringByAppendingFormat:@"&username=%@&mobile=%@", _username, phonetext.text];
        phoneRequest = [[LHYHTTPRequest alloc]initWith:str];
        phoneRequest.delegate = self;
        
        
    }
}

-(void)email
{       
   
    if ([phonetext.text isEqualToString:@""]) {
        self.emailLab.hidden = NO;
    }else{
        NSString *str = [HTTP_URL stringByAppendingFormat:@"&username=%@&email=%@", _username, phonetext.text];
        LHYHTTPRequest *sendRequest = [[LHYHTTPRequest alloc]initWith:str];
        sendRequest.delegate = self;
        
        
    }
}


-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest{
    NSLog(@"%@",send);
    NSNumber *nuber = [send objectForKey:@"status"];
    
    if (mLHYHTTPRequest == phoneRequest) {
        if ([nuber boolValue] == 1) {
            PhoneViewController *phone = [[PhoneViewController alloc]init];
            [self.navigationController pushViewController:phone animated:YES];

        }else{
            NSMutableString *str = [send objectForKey:@"msg"];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:str message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
        }

        
        return;
    }

    if ([nuber boolValue] == 1) {

        EmailViewController *email = [[EmailViewController alloc]init];
        [self.navigationController pushViewController:email animated:YES];

    }else{
        NSMutableString *str = [send objectForKey:@"msg"];
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:str message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }

    
    
}


#pragma mark -

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [phonetext resignFirstResponder];
    return YES;
}

-(void)textFieldDone{
    [phonetext resignFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
