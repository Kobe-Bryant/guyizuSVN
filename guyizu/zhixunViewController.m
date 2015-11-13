//
//  zhixunViewController.m
//  zhixun
//
//  Created by lanye on 13-11-29.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "zhixunViewController.h"
#import "DengluViewController.h"
#define  Http_url @"http://www.guyizu.com/item.php?act=subject&meth=reward_review"

@interface zhixunViewController ()
{
    NSMutableArray* array;
    NSString* msg;

}
@end

@implementation zhixunViewController
@synthesize backview = _backview,liuyanlable = _liuyanlable, liuyantextview = _liuyantextview;

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
    [customLab setText:@"发表留言"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    
    _backview.layer.borderWidth = 0.5f;
    _backview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
}

#pragma mark -
#pragma mark leftButtonClick

-(void)mleftBarBttonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -

-(void)textViewDidChange:(UITextView *)textView
{
    [_liuyanlable removeFromSuperview];
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [_liuyantextview resignFirstResponder];
    }
    return YES;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0)
    {
        //
        if(![msg isEqualToString:@""])
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}
-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest
{
    NSDictionary *mDic = [send objectForKey:@"data"];
    msg=[mDic objectForKey:@"msg"];
    NSLog(@"msg=%@",msg);
    [array addObject:msg];
    if([msg isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"留言提交失败!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:msg message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
}
- (IBAction)leavemessage:(id)sender {
    array=[NSMutableArray new];
    if([_liuyantextview.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"留言内容不能为空!" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
    BOOL islog = [[NSUserDefaults standardUserDefaults] boolForKey:@"islogin"];
    if (!islog) {
        DengluViewController *dengluCtl = [[DengluViewController alloc]initWithNibName:@"DengluViewController" bundle:nil];
        dengluCtl.iszixun=YES;
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:dengluCtl];
        [self presentViewController:nav animated:YES completion:nil];
        
    }else{
            BOOL isuid=[[NSUserDefaults standardUserDefaults]boolForKey:@"uid"];
            if(isuid)
            {
            NSString* uidstring=[[NSUserDefaults standardUserDefaults]objectForKey:@"uid"];
            NSString* string=[Http_url stringByAppendingFormat:@"&sid=%d&content=%@&uid=%@",_sid,_liuyantextview.text,uidstring];
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
    }
}
@end
