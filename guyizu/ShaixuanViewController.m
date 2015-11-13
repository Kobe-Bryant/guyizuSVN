//
//  ShaixuanViewController.m
//  谷蚁族
//
//  Created by Mac mini on 13-12-16.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "ShaixuanViewController.h"

@interface ShaixuanViewController ()

@end

@implementation ShaixuanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _mutableArry = [[NSMutableArray alloc]initWithCapacity:0];
        passArry = [[NSMutableArray alloc]initWithObjects:@"不限", @"跑腿", @"购物",@"创意" ,nil];
        //假数据
//        NSMutableArray *arr1 = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", nil];
        NSMutableArray *arr1 = [[NSMutableArray alloc]init];
        NSDictionary *mDic = [[NSDictionary alloc]initWithObjectsAndKeys:arr1,@"content",@"类别",@"head", nil];
//        NSMutableArray *arr2 = [[NSMutableArray alloc]initWithObjects:@"4", @"5", @"6", nil];
        NSMutableArray *arr2 = [[NSMutableArray alloc]init];
        NSDictionary *mDic2 = [[NSDictionary alloc]initWithObjectsAndKeys:arr2,@"content",@"任务类别",@"head", nil];
//        NSMutableArray *arr3 = [[NSMutableArray alloc]initWithObjects:@"7", @"8", @"9", nil];
        NSMutableArray *arr3 = [[NSMutableArray alloc]init];
        NSDictionary *mDic3 = [[NSDictionary alloc]initWithObjectsAndKeys:arr3,@"content",@"任务状态",@"head", nil];
        [_mutableArry addObject:mDic];
        [_mutableArry addObject:mDic2];
        [_mutableArry addObject:mDic3];
        
        NSLog(@"%@",_mutableArry);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //构建nav
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"筛选"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;

    

}

-(void)mleftBarBttonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_mutableArry count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[_mutableArry objectAtIndex:section] objectForKey:@"content"] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *oneCell = [tableView dequeueReusableCellWithIdentifier:@"shaixuanCell"];
    if (oneCell == nil) {
        oneCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"shaixuanCell"];
    }
    
    oneCell.selectedBackgroundView = [[UIView alloc] initWithFrame:oneCell.frame];
    oneCell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:0 green:160/255.0 blue:211/255.0 alpha:1];

    
    oneCell.textLabel.text = [[[_mutableArry objectAtIndex:indexPath.section] objectForKey:@"content"] objectAtIndex:indexPath.row];
    oneCell.textLabel.font = [UIFont systemFontOfSize:15.0];
    oneCell.textLabel.textColor = [UIColor colorWithRed:130/255.0 green:130/255.0 blue:130/255.0 alpha:1];
    
    
    return oneCell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [[_mutableArry objectAtIndex:section] objectForKey:@"head"];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 70, 24)];
    lab.text = [[_mutableArry objectAtIndex:section] objectForKey:@"head"];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    view.tag = 1010 + section;
    view.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    view.layer.borderWidth = 0.5f;
    view.layer.borderColor = [UIColor lightGrayColor].CGColor;

    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(mselectHeader:)];
    [view addGestureRecognizer:tapGest];
    [view addSubview:lab];
    
    return view;
}

-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44.0f;
}

BOOL isOpen = NO;
-(void)mselectHeader:(UIGestureRecognizer *)tap{
    NSInteger headNum = tap.view.tag - 1010;

    
#if 0
//    NSLog(@"%@",arr1);
    if (isOpen) {
//        [passArry setArray:[[_mutableArry objectAtIndex:headNum] objectForKey:@"content"]];
        
        [[[_mutableArry objectAtIndex:headNum] objectForKey:@"content"] removeAllObjects];

        [self.mTableView reloadData];
        
    }else{
        [[[_mutableArry objectAtIndex:headNum] objectForKey:@"content"] setArray:passArry];
        
        [self.mTableView reloadData];
    }
    
    isOpen = !isOpen;
    
#endif
    
    for (NSDictionary *mDic in _mutableArry) {
        if ([_mutableArry indexOfObject:mDic] == headNum) {
            [[mDic objectForKey:@"content"] setArray:passArry];
            
            
            [self.mTableView reloadData];
        }else{
            
            [[mDic objectForKey:@"content"] removeAllObjects];
            [self.mTableView reloadData];
        }
    }
}



#pragma mark UITableViewDelegate

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 35.0f;
}

#pragma mark -
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
