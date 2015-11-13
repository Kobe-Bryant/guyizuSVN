//
//  ChangePhoneViewController.m
//  Test-denglu
//
//  Created by lanye on 13-11-26.
//  Copyright (c) 2013年 lanye. All rights reserved.
//

#import "ChangePhoneViewController.h"

@interface ChangePhoneViewController ()
@property (weak, nonatomic) IBOutlet UILabel *changelable;
- (IBAction)delekeyboard:(id)sender;

@end

@implementation ChangePhoneViewController
@synthesize newview = _newview,sureview = _sureview;

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
    
    //构建上面tabBar
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
    
    _newview.layer.borderWidth = 0.5f;
    _newview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.newfieldtext.layer.borderWidth = 0.4f;
    self.newfieldtext.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.surefieldtext.layer.borderWidth = 0.4f;
    self.surefieldtext.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _sureview.layer.borderWidth = 0.5f;
    _sureview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UIView *new = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    self.newfieldtext.leftView = new;
    self.newfieldtext.leftViewMode = UITextFieldViewModeAlways;
    [self.newfieldtext addSubview:new];
    
    UIView *sure = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    self.surefieldtext.leftView = sure;
    self.surefieldtext.leftViewMode = UITextFieldViewModeAlways;
    [self.surefieldtext addSubview:sure];

}
-(void)mleftBarBttonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.newfieldtext resignFirstResponder];
    [self.surefieldtext resignFirstResponder];
    return YES;
}

- (IBAction)submit:(id)sender {
    if ([self.newfieldtext.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"密码不能为空" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alert show];
    }
    else{
        if ([self.newfieldtext.text isEqualToString:self.surefieldtext.text]) {
            SurePhoneViewController *surephone = [[SurePhoneViewController alloc]init];
            [self.navigationController pushViewController:surephone animated:YES];
        }else{
            self.changelable.hidden = NO;
        }
    }

}
- (IBAction)delekeyboard:(id)sender {
    
    [self.newfieldtext resignFirstResponder];
    [self.surefieldtext resignFirstResponder];
}
@end
