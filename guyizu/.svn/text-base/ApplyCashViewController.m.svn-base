//
//  ApplyCashViewController.m
//  MyApplying
//
//  Created by lanye on 13-12-5.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "ApplyCashViewController.h"
#import "DownloadApplyCash.h"
@interface ApplyCashViewController ()

@end

@implementation ApplyCashViewController
@synthesize paStr = _paStr;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _paStr = [[NSMutableString alloc]init];
        arr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DownloadOver) name:@"applycashDownloadOver" object:nil];
//    [[DownloadApplyCash shareDownload]startDownload];
    
    //构建nav
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"申请提现"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    self.backscroll.contentSize = CGSizeMake(320, 600);
    self.headview.layer.borderWidth = 0.5f;
    self.headview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.kahaotextfield.keyboardType = UIKeyboardTypeNumberPad;
    self.cashtextfield.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    
    self.hangLab.text = _paStr;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.hangView addGestureRecognizer:tap];

}

-(void)DownloadOver
{
    arr = [DownloadApplyCash shareDownload].mutableArry;
    applycashModel *thisModel = (applycashModel *)[arr firstObject];
    self.cashLab.text = thisModel.remaining;
    self.cashtextfield.text = thisModel.price;
   
}
-(void)sendRequest
{
    NSString *uidStr = [[NSUserDefaults standardUserDefaults]objectForKey:@"uid"];
    [[DownloadApplyCash shareDownload]startDownload:uidStr bank:self.hangLab.text cardNum:self.kahaotextfield.text account:self.nametextfield.text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tap
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark leftButtonClick

-(void)mleftBarBttonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.cashtextfield resignFirstResponder];
    [self.nametextfield resignFirstResponder];
    return YES;
}

- (IBAction)closekeyboard:(id)sender {
    [self.cashtextfield resignFirstResponder];
    [self.kahaotextfield resignFirstResponder];
    [self.nametextfield resignFirstResponder];
}

- (IBAction)submit:(id)sender {
    [self sendRequest];
    CashSuccessViewController *cash = [[CashSuccessViewController alloc]init];
    [self.navigationController pushViewController:cash animated:YES];
}
@end
