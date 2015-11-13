//
//  MapBigViewController.m
//  guyizu
//
//  Created by 蓝叶软件 on 11/23/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import "MapBigViewController.h"
#import "MapViewController.h"

@interface MapBigViewController ()

@end

@implementation MapBigViewController

@synthesize pointArry = _pointArry;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _pointArry = [[NSMutableArray alloc]initWithCapacity:8];
        
    }
    return self;
}

#pragma mark -

-(void)rightClick{
    
}

-(void)leftClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setBackgroundColor:[UIColor clearColor]];
    [customLab setText:@"信息列表"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"life_backlist.png"] forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(0, 0, 24, 17);
    [rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    _mapViewController = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
    _mapViewController.iscontentview=self.iscontentview;
    _mapViewController.delegate = self;
    _mapViewController.array=self.array;
    NSLog(@"arr=%@",_mapViewController.array);
    [self.view addSubview:_mapViewController.view];
    [_mapViewController.view setFrame:self.view.bounds];
    NSLog(@"pointarry=%@",_pointArry);
    [_mapViewController resetAnnitations:_pointArry];
    
	}
#pragma mark -

- (void)customMKMapViewDidSelectedWithInfo:(id)info
{
    NSLog(@"%@",info);
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
