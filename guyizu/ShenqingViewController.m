//
//  ShenqingViewController.m
//  Shenqing
//
//  Created by lanye on 13-11-29.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "ShenqingViewController.h"
#import "LHYHTTPRequest.h"
#define  http @"http://www.guyizu.com/item.php?act=subject&meth=task_apply"
@interface ShenqingViewController ()
{
    NSMutableArray* array;
}
@end

@implementation ShenqingViewController
@synthesize backview = _backview,yingzhenglable = _yingzhenglable,yingzhengtextview = _yingzhengtextview,textfield = _textfield;

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
    array=[NSMutableArray new];
    //构建nav
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    [customLab setTextColor:[UIColor whiteColor]];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setText:@"申请应征"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    _textfield.delegate =self;
    _yingzhengtextview.delegate = self;
    
    _backview.layer.borderWidth = 0.5f;
    _backview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.textfield.keyboardType = UIKeyboardTypeNumberPad;
    
}

#pragma mark -
#pragma mark leftButtonClick

-(void)mleftBarBttonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -

-(void)textViewDidChange:(UITextView *)textView
{
    [_yingzhenglable removeFromSuperview];
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [_yingzhengtextview resignFirstResponder];
    }
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_textfield resignFirstResponder];
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    textField.text=[NSString stringWithFormat:@"¥%@.00",textField.text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeKey:(id)sender {
    [_textfield resignFirstResponder];
     [_yingzhengtextview resignFirstResponder];
}

- (IBAction)submit:(id)sender {
    array=[NSMutableArray new];
    if([_textfield.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"期望薪金不能为空!" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
    else if([_yingzhengtextview.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"应征理由不能为空!" message:nil delegate:nil
cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
    //电话号码目前没有；
    NSString* textfieldstring=[_textfield.text substringFromIndex:1];
    //测试
    //_sid=7893;
    NSString* string=[http stringByAppendingFormat:@"&apply_sid=%d&apply_price=%@&apply_desc=%@&apply_mobile=123",_sid,textfieldstring,_yingzhengtextview.text];
    NSLog(@"httpstring=%@",string);
    //网络数据下载
    if ([array count] == 0) {
        LHYHTTPRequest *sendReaquest = [[LHYHTTPRequest alloc]initWith:string];
        sendReaquest.delegate = self;
    }else{
        //下载完成；
    }
    }
}
-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest
{
    NSString* string=[send objectForKey:@"msg"];
    NSLog(@"string=%@",string);
    [array addObject:string];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:string message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
    
}
@end
