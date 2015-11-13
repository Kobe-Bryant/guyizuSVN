//
//  PhoneViewController.m
//  Test-denglu
//
//  Created by lanye on 13-11-26.
//  Copyright (c) 2013年 lanye. All rights reserved.
//

#import "PhoneViewController.h"
#import "UnderLineLabel.h"
@interface PhoneViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testlable;
- (IBAction)delekeyboard:(id)sender;

@end

@implementation PhoneViewController

@synthesize textfield = _textfield;

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
    
    NSString *str = @"重新发送";
    UnderLineLabel *label = [[UnderLineLabel alloc] initWithFrame:CGRectMake(225, 104, 74, 21)];
    [label setTextColor:[UIColor blueColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    label.highlightedColor = [UIColor clearColor];
    label.shouldUnderline = YES;
    
   
    [label setText:str];
    [label addTarget:self action:@selector(llabelClicked)];
    [self.view addSubview:label];
    
    
    
    _textfield.layer.borderWidth = 0.5f;
    _textfield.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UIView *textview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    _textfield.leftView = textview;
    _textfield.leftViewMode = UITextFieldViewModeAlways;
    _textfield.keyboardType = UIKeyboardTypeNumberPad;
    [_textfield addTarget:self action:@selector(textFieldDone)  forControlEvents:UIControlEventTouchDown]; //用textFieldDone函数，实现关闭数字键盘
    
}

-(void)mleftBarBttonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)llabelClicked
{
   // NSLog(@"%@", NSStringFromSelector(_cmd));
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"确定发送？" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [alertView show];
  
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    if (buttonIndex == 0) {
        NSLog(@"1");
    }
    if (buttonIndex == 1) {
        [self textFieldDone];
    }

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
    
    if ([_textfield.text isEqualToString:@""]) {
        self.testlable.hidden = NO;
    }else{
        self.testlable.hidden = YES;
        
        ChangePhoneViewController *changephone = [[ChangePhoneViewController alloc]init];
        [self.navigationController pushViewController:changephone animated:YES];
    }
  
}


-(void)textFieldDone{
    [_textfield resignFirstResponder];
}

- (IBAction)delekeyboard:(id)sender {
    
     [_textfield resignFirstResponder];
}
@end
