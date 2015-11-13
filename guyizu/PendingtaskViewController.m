//
//  PendingtaskViewController.m
//  Pendingtask
//
//  Created by lanye on 13-12-2.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "PendingtaskViewController.h"

@interface PendingtaskViewController ()

@end

@implementation PendingtaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        arry = [[NSMutableArray alloc]initWithObjects:@"农业银行",@"招商银行",@"中国银行",@"工商银行",@"民生银行",@"华夏银行",@"中信银行",nil];
        imagearry = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"ABC.png"],[UIImage imageNamed:@"CMB.png"],[UIImage imageNamed:@"BOC.png"],[UIImage imageNamed:@"ICBC.png"],[UIImage imageNamed:@"CMBC.png"],[UIImage imageNamed:@"HXBANK.png"],[UIImage imageNamed:@"CITIC.png"], nil];
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
    [customLab setText:@"待选定任务"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    
    self.backscroll.contentSize = CGSizeMake(320, 600);
    self.titleview.layer.borderWidth = 0.5f;
    self.titleview.layer.borderColor = [UIColor redColor].CGColor;
    
    self.leftbutton.layer.borderWidth = 0.35f;
    self.leftbutton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.rightbutton.layer.borderWidth = 0.35f;
    self.rightbutton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    table = [[UITableView alloc]initWithFrame:CGRectMake(15, 170, 290, 310) style:UITableViewStylePlain];
    table.scrollEnabled = NO;
    table.delegate =self;
    table.dataSource = self;
    table.layer.borderWidth = 0.5f;
    table.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [table setSeparatorStyle:UITableViewCellSeparatorStyleSingleLineEtched];
    [self.backscroll addSubview:table];
}

#pragma mark -
#pragma mark leftButtonClick

-(void)mleftBarBttonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIView *blackView = [[UIView alloc]initWithFrame:CGRectMake(0, cell.frame.origin.y, 290, 0.5)];
        blackView.backgroundColor = [UIColor lightGrayColor];
        [cell addSubview:blackView];
        
    }
//    cell.layer.borderWidth = 0.5f;
//    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;

    cell.textLabel.text = [arry objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:19.0];
    cell.imageView.image = [imagearry objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str =[arry objectAtIndex:indexPath.row];
    ApplyCashViewController *applyCash = [[ApplyCashViewController alloc]initWithNibName:@"ApplyCashViewController" bundle:nil];
     [applyCash.paStr setString:str];
    [self.navigationController pushViewController:applyCash animated:YES];
    
    //    for (UIViewController *controller in self.navigationController.viewControllers) {
    //        if ([controller isKindOfClass:[applyCash class]]) {
    //
    //            [self.navigationController popToViewController:controller animated:YES];
    //        }
    //    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)leftbutton:(id)sender {
    
    [self.leftbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.leftbutton setBackgroundColor:[UIColor redColor]];
    [self.rightbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.rightbutton setBackgroundColor:[UIColor whiteColor]];
  
}

- (IBAction)rightbutton:(id)sender {
    [self.leftbutton setBackgroundColor:[UIColor whiteColor]];
    [self.leftbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.rightbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.rightbutton setBackgroundColor:[UIColor redColor]];
}
@end
