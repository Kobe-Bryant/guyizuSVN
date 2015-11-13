//
//  PlaneDynamicViewController.m
//  谷蚁族
//
//  Created by Macsyf on 13-12-20.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "PlaneDynamicViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface PlaneDynamicViewController ()
{
    NSTimer* timer;
}
@end

@implementation PlaneDynamicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)returnaction
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)showbord:(UIView*)view
{
    view.layer.borderColor=[UIColor lightGrayColor].CGColor;
    view.layer.borderWidth=.5f;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"航班动态";
    //设置导航栏标题属性；
    NSDictionary *textDic = [NSDictionary dictionaryWithObjectsAndKeys:
                             [UIColor whiteColor],NSForegroundColorAttributeName,
                             [UIFont boldSystemFontOfSize:20],NSFontAttributeName,nil];
    [self.navigationController.navigationBar setTitleTextAttributes:textDic];
    UIButton* button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(0, 0, 11, 20);
    [button setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(returnaction) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:button] animated:YES];
    [self showbord:_buttonthree];
    [self showbord:_buttonfour];
    [self showbord:_viewfive];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonfour:(UIButton *)sender
{
    //抵达城市
    
}
- (IBAction)buttonthree:(UIButton *)sender
{
    //出发城市

}
- (IBAction)searchbutton:(UIButton *)sender
{
    
}

- (IBAction)swapbutton:(UIButton *)sender
{
    CGMutablePathRef thepath=CGPathCreateMutable();
    CGPathMoveToPoint(thepath, nil, 35,20);
    CGPathAddLineToPoint(thepath, Nil, 215, 20);
    CAKeyframeAnimation* theAnimationone=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    theAnimationone.duration=.5;
    theAnimationone.path=thepath;
    [_startlable.layer addAnimation:theAnimationone forKey:@"position"];
    CGMutablePathRef thepathother=CGPathCreateMutable();
    CGPathMoveToPoint(thepathother, Nil, 215, 20);
    CGPathAddLineToPoint(thepathother, Nil, 35, 20);
    CAKeyframeAnimation* theAnimationtwo=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    theAnimationtwo.duration=.5;
    theAnimationtwo.path=thepathother;
    [_arrivelable.layer addAnimation:theAnimationtwo forKey:@"position"];
    CABasicAnimation* fadeAnim=[CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnim.fromValue=[NSNumber numberWithFloat:1];
    fadeAnim.toValue=[NSNumber numberWithFloat:0];
    fadeAnim.duration=.5;
    [_viewfive.layer addAnimation:fadeAnim forKey:@"opacity"];
    _viewfive.layer.opacity=1;
     timer=[NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(timeraction) userInfo:Nil repeats:NO];
}
-(void)timeraction
{
    NSString* startstring=_startlable.text;
    NSString* arrivestring=_arrivelable.text;
    _startlable.text=arrivestring;
    _arrivelable.text=startstring;
}

- (IBAction)datebutton:(UIButton *)sender
{
    
}
- (IBAction)buttonone:(UIButton *)sender
{
    _viewone.hidden=NO;
    _viewtwo.hidden=YES;
    [sender setTitleColor:[UIColor colorWithRed:0/255.0 green:160/255.0 blue:211/255.0 alpha:1] forState:UIControlStateNormal];
    [_buttontwo setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
}

- (IBAction)buttontwo:(UIButton *)sender
{
    _viewtwo.hidden=NO;
    _viewone.hidden=YES;
    [sender setTitleColor:[UIColor colorWithRed:0/255.0 green:160/255.0 blue:211/255.0 alpha:1] forState:UIControlStateNormal];
    [_buttonone setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
}
@end
