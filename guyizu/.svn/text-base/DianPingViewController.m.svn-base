//
//  DianPingViewController.m
//  谷蚁族
//
//  Created by Macsyf on 13-12-25.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "DianPingViewController.h"
#import "LHYHTTPRequest.h"
#import "DengluViewController.h"
#define http @"http://www.guyizu.com/item.php?act=subject&meth=add_review"
@interface DianPingViewController ()
{

    NSMutableString* contentstring;
}
@end

@implementation DianPingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _startnum=0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    contentstring=[NSMutableString new];
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"写点评"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    UITapGestureRecognizer* tapone=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lightstar)];
    [_starimagefive addGestureRecognizer:tapone];
    UITapGestureRecognizer* taptwo=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(destoryonestar)];
    [_starimageone addGestureRecognizer:taptwo];
    UITapGestureRecognizer* tapthree=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(destorytwostar)];
    [_starimagetwo addGestureRecognizer:tapthree];
    UITapGestureRecognizer* tapfour=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(destorythreestar)];
    [_starimagethree addGestureRecognizer:tapfour];
    UITapGestureRecognizer* tapfive=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(destoryfourstar)];
    [_starimagefour addGestureRecognizer:tapfive];
    _starimageone.userInteractionEnabled=YES;
    _starimagetwo.userInteractionEnabled=YES;
    _starimagethree.userInteractionEnabled=YES;
    _starimagefour.userInteractionEnabled=YES;
    _starimagefive.userInteractionEnabled=YES;
    _textview.delegate=self;
    _viewone.layer.borderColor=[UIColor lightGrayColor].CGColor;
    _viewone.layer.borderWidth=0.5f;
    _viewtwo.layer.borderWidth=0.5f;
    _viewtwo.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textview resignFirstResponder];
}
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@"至少10个字"])
    {
        textView.text=@"";
    }
    textView.textColor=[UIColor blackColor];
    textView.layer.opacity=1;
    return YES;
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@""] )
    {
        textView.textColor=[UIColor grayColor];
        textView.layer.opacity=.5;
        textView.text=@"至少10个字";
    }
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
    }
    return YES;
}
-(void)lightstar
{
    NSLog(@"ff");
    static int i=0;
    if(i%2)
    {
        _starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
        _starimagetwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
        _starimagethree.image=[UIImage imageNamed:@"life_score_full_one.png"];
        _starimagefour.image=[UIImage imageNamed:@"life_score_full_one.png"];
        _starimagefive.image=[UIImage imageNamed:@"life_score_full_one.png"];
        _startnum=5;
    }
    else
    {
        _starimageone.image=[UIImage imageNamed:@"life_score_nix_one.png"];
        _starimagetwo.image=[UIImage imageNamed:@"life_score_nix_one.png"];
        _starimagethree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
        _starimagefour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
        _starimagefive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
    }
    i++;
}
-(void)destoryonestar
{
     NSLog(@"ff");
    static int i=0;
    if(i%2)
    {
        _starimageone.image=[UIImage imageNamed:@"life_score_nix_one.png"];
    }
    else
    {
        _starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
        _startnum=1;
    }
    i++;

}
-(void)destorytwostar
{
    static int i=0;
    if(i%2)
    {
        _starimageone.image=[UIImage imageNamed:@"life_score_nix_one.png"];
        _starimagetwo.image=[UIImage imageNamed:@"life_score_nix_one.png"];
    }
    else
    {
        _starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
        _starimagetwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
        _startnum=2;
    }
    i++;

}
-(void)destorythreestar
{
    static int i=0;
    if(i%2)
    {
        _starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
        _starimagetwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
        _starimagethree.image=[UIImage imageNamed:@"life_score_full_one.png"];
        _startnum=3;
    }
    else
    {
        _starimageone.image=[UIImage imageNamed:@"life_score_nix_one.png"];
        _starimagetwo.image=[UIImage imageNamed:@"life_score_nix_one.png"];
        _starimagethree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
    }
    i++;

}
-(void)destoryfourstar
{
    static int i=0;
    if(i%2)
    {
        _starimageone.image=[UIImage imageNamed:@"life_score_nix_one.png"];
        _starimagetwo.image=[UIImage imageNamed:@"life_score_nix_one.png"];
        _starimagethree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
        _starimagefour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
    }
    else
    {
         _starimageone.image=[UIImage imageNamed:@"life_score_full_one.png"];
         _starimagetwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
         _starimagethree.image=[UIImage imageNamed:@"life_score_full_one.png"];
        _starimagefour.image=[UIImage imageNamed:@"life_score_full_one.png"];
        _startnum=4;
    }
    i++;

}
-(void)leftClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)button:(UIButton *)sender
{
    //提交评论到网络数据接口；
    contentstring=[NSMutableString new];
    [contentstring appendString:_textview.text];
    
    if([contentstring isEqualToString:@""] || [contentstring isEqualToString:@"至少10个字"])
    {
        UIAlertView* alertview=[[UIAlertView alloc]initWithTitle:@"点评内容不能为空!" message:Nil delegate:Nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertview show];
    }
    else
    {
        BOOL islog=[[NSUserDefaults standardUserDefaults]boolForKey:@"islogin"];
        if(!islog)
        {
            DengluViewController* denglu=[DengluViewController new];
            denglu.isdianping=YES;
            [self presentViewController:denglu animated:YES completion:nil];
        }
        else
        {
        NSString* string=[http stringByAppendingFormat:@"&sid=%d&content=%@&sort1=%d",_sid,_textview.text,_startnum];
        NSLog(@"string=%@",string);
        LHYHTTPRequest* httprequest=[[LHYHTTPRequest alloc]initWith:string];
        httprequest.delegate=self;
        }
    }
    
}
-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest
{
   NSString* dianpingmsg=[send objectForKey:@"msg"];
    NSLog(@"dianping=%@",dianpingmsg);
    if([[send objectForKey:@"status"]intValue]==1)
    {
        UIAlertView* alertview=[[UIAlertView alloc]initWithTitle:dianpingmsg message:Nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertview show];
    }
    else
    {
        UIAlertView* alertview=[[UIAlertView alloc]initWithTitle:dianpingmsg message:Nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertview show];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
