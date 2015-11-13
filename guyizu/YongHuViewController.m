//
//  YongHuViewController.m
//  Test
//
//  Created by lanye on 13-11-25.
//  Copyright (c) 2013年 lanye. All rights reserved.
//

#import "YongHuViewController.h"

@interface YongHuViewController ()

@end

@implementation YongHuViewController
@synthesize scroll = _scroll;
@synthesize titleview = _titleview;

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
    
    arr = [[NSArray alloc]initWithObjects:@"修改",@"修改",@"重新发布", nil];
    iphoneimg = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"index_shake@2x.png"],[UIImage imageNamed:@"index_shake@2x.png"],[UIImage imageNamed:@"index_task.png"],nil];
    changeimg = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"member_alter.png"],[UIImage imageNamed:@"member_alter.png"],[UIImage imageNamed:@"member_again.png"],nil];
    deleimg = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"member_del.png"],[UIImage imageNamed:@"member_del.png"],[UIImage imageNamed:@"member_password@2x.png"],nil];
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"用户中心"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    _scroll.contentSize = CGSizeMake(320, 730);
    _scroll.backgroundColor = [UIColor colorWithRed:242/255.0 green:245/255.0 blue:244/255.0 alpha:1];
    
    table = [[UITableView alloc]initWithFrame:CGRectMake(10, 150, 300, 530) style:UITableViewStylePlain];
    table.backgroundView = nil;
    table.backgroundColor = [UIColor colorWithRed:242/255.0 green:245/255.0 blue:244/255.0 alpha:1];


    table.sectionHeaderHeight = 5.0;
    table.sectionFooterHeight = 5.0;
    
    table.scrollEnabled =  NO;
    table.delegate = self;
    table.dataSource = self;
    [_scroll addSubview:table];
    
    
    UIButton *fenleibutton = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 106.6, 45)];
    fenleibutton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [fenleibutton setBackgroundColor:[UIColor clearColor]];
    [fenleibutton setTitle:@"分类信息" forState:UIControlStateNormal];
    [fenleibutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    fenleibutton.layer.borderWidth = 0.5f;
    fenleibutton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_scroll addSubview:fenleibutton];
    
    UIButton *xuanshangbutton = [[UIButton alloc]initWithFrame:CGRectMake(106.6, 100, 106.6, 45)];
    xuanshangbutton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [xuanshangbutton setBackgroundColor:[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1]];
    [xuanshangbutton setTitle:@"悬赏任务" forState:UIControlStateNormal];
    [xuanshangbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    xuanshangbutton.layer.borderWidth = 0.5f;
    xuanshangbutton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_scroll addSubview:xuanshangbutton];
    
    UIButton *liuyanbutton = [[UIButton alloc]initWithFrame:CGRectMake(213.2, 100, 106.6, 45)];
    liuyanbutton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [liuyanbutton setBackgroundColor:[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1]];
    [liuyanbutton setTitle:@"留言资询" forState:UIControlStateNormal];
    [liuyanbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    liuyanbutton.layer.borderWidth = 0.5f;
    liuyanbutton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_scroll addSubview:liuyanbutton];
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indenfer = @"yonghuCell";
    cell *cell = [tableView dequeueReusableCellWithIdentifier:indenfer];
    if (cell ==nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"cell" owner:self options:nil]lastObject];
#if 1
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.contentView.layer.masksToBounds = YES;
        cell.layer.masksToBounds = YES;
        cell.contentView.layer.borderWidth = 0.5f;
        cell.layer.borderColor = [UIColor grayColor].CGColor;
        cell.changeview.layer.borderWidth = 0.25f;
        cell.changeview.layer.borderColor = [UIColor grayColor].CGColor;

        cell.delview.layer.borderWidth = 0.25f;
        cell.delview.layer.borderColor = [UIColor grayColor].CGColor;
    
        cell.backview.layer.borderWidth = 0.5f;
        cell.backview.layer.borderColor = [UIColor grayColor].CGColor;
#endif
    }
    
    cell.changetext.text = [arr objectAtIndex:indexPath.section];
    [cell.iphoneimage setImage:[iphoneimg objectAtIndex:indexPath.section]];
    [cell.changeimage setImage:[changeimg objectAtIndex:indexPath.section]];
    [cell.deleimage setImage:[deleimg objectAtIndex:indexPath.section]];
    
    return cell;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160.0f;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
