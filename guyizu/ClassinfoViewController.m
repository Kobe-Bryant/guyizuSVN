//
//  ClassinfoViewController.m
//  Classinfo
//
//  Created by lanye on 13-11-30.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "ClassinfoViewController.h"
#import "AppDelegate.h"
#import "DownloadMemberClass.h"
#import "UIImageView+WebCache.h"
#define HTTP @"http://www.guyizu.com/"
@interface ClassinfoViewController ()
{
    ClassInfocell *tablecell;
    MemberClassModel *model;
    NSInteger deletag;
}
@end

@implementation ClassinfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _arry = [[NSMutableArray alloc]initWithCapacity:0];
        _endarry = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
      // self.backscroll.contentSize = CGSizeMake(320, 1900);
    //进行中
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DownloadOver) name:@"memberclassDownloadOver" object:nil];
    //删除
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleDownloadOver) name:@"deleDownloadOver" object:nil];
    [[DownloadMemberClass shareDownload] startDownload] ;
   
    //[[DownloadMemberClass shareDownload]startModifyDownload:]
    //已结束
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DownloadendOver) name:@"memberclassendDownloadOver" object:nil];
    [[DownloadMemberClass shareDownload]startendDownload];
    
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"分类信息"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;

    table = [[UITableView alloc]initWithFrame:CGRectMake(10, 50, 300, 450) style:UITableViewStyleGrouped];
    table.backgroundColor = [UIColor colorWithRed:242/255.0 green:245/255.0 blue:244/255.0 alpha:1];
    table.sectionHeaderHeight = 5.0;
    table.sectionFooterHeight = 5.0;
    table.showsVerticalScrollIndicator = NO;
    table.delegate = self;
    table.dataSource = self;
    [self.backscroll addSubview:table];
    
    endtable = [[UITableView alloc]initWithFrame:CGRectMake(10, 50, 300, 450) style:UITableViewStyleGrouped];
    endtable.backgroundColor = [UIColor colorWithRed:242/255.0 green:245/255.0 blue:244/255.0 alpha:1];
    endtable.sectionHeaderHeight = 5.0;
    endtable.sectionFooterHeight = 5.0;
    endtable.showsVerticalScrollIndicator = NO;
    endtable.delegate = self;
    endtable.dataSource = self;
    endtable.hidden = YES;
    [self.backscroll addSubview:endtable];
    
    //下啦刷新
    refresh = [[UIRefreshControl alloc]init];
    refresh.tintColor = [UIColor orangeColor];
    refresh.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [refresh addTarget:self action:@selector(refreshViewChanged:) forControlEvents:UIControlEventValueChanged];
    [table addSubview:refresh];
    
    //修改ios6uitableview的背景颜色
    AppDelegate *homeApp = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (homeApp.isIos6) {
        UIView *backView = [[UIView alloc]init];
        [table setBackgroundView:backView];
        [table setBackgroundColor:[UIColor clearColor]];
        UIView *backView1 = [[UIView alloc]init];
        [endtable setBackgroundView:backView1];
        [endtable setBackgroundColor:[UIColor clearColor]];
    }
}
//进行中
-(void)DownloadOver
{
    NSMutableArray *arr1 = [DownloadMemberClass shareDownload].mutableArry;
    for (MemberClassModel *thisModel in arr1) {
        [_arry addObject:thisModel];
    }
    [table reloadData];
}

//已结束
-(void)DownloadendOver
{
    NSMutableArray *arr2 = [DownloadMemberClass shareDownload].endmutableArry;
    for (MemberClassModel *this in arr2) {
        [_endarry addObject:this];
    }
    [endtable reloadData];
}
//删除
-(void)deleDownloadOver
{
    NSMutableDictionary *mdic = [DownloadMemberClass shareDownload].deleDic;
    NSString *str = [mdic objectForKey:@"status"];
    NSLog(@"status=%@",str);
}

#pragma mark 删除按钮
-(void)delebtn:(UIButton *)sender
{
    deletag = sender.tag;
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"确定删除" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        // [_arry removeObjectAtIndex:deleRow];
         [[DownloadMemberClass shareDownload]startDeleDownload:[NSString stringWithFormat:@"%d",deletag]];
        [table reloadData];
    }
    
}


#pragma mark - 下拉刷新
-(void)refreshViewChanged:(id)sender
{
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"刷新中"];
    [self performSelector:@selector(reloadData:) withObject:self afterDelay:2.0f];
}

-(void)reloadData:(id)sender
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:MM:ss"];
    NSString *dateString =  [formatter stringFromDate:[NSDate date]];
    [refresh endRefreshing];
    refresh.attributedTitle = [[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"最后更新 %@",dateString]];
    [table reloadData];
}

#pragma mark - table delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    return 160.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 10.0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView ==table) {
         return _arry.count;
    }else{
         return _endarry.count;
    }

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1.0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == table) {
        tablecell = [tableView dequeueReusableCellWithIdentifier:@"tablecell"];
        if (tablecell ==nil) {
            tablecell = [[[NSBundle mainBundle]loadNibNamed:@"ClassInfocell" owner:self options:nil]lastObject];
        
        tablecell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 去掉圆角边框
        tablecell.selectionStyle = UITableViewCellSelectionStyleNone;//取消选中颜色
        tablecell.selectedBackgroundView.frame = CGRectMake(0, 0, 300, 120);

        tablecell.layer.borderWidth = 0.5f;
        tablecell.layer.borderColor = [UIColor lightGrayColor].CGColor;
        tablecell.modifybtn.layer.borderWidth = 0.5f;
        tablecell.modifybtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [tablecell.modifybtn addTarget:self action:@selector(modifybtn) forControlEvents:UIControlEventTouchUpInside];
            
        tablecell.cancelbtn.layer.borderWidth = 0.5f;
        tablecell.cancelbtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [tablecell.cancelbtn addTarget:self action:@selector(cancelbtn) forControlEvents:UIControlEventTouchUpInside];
            
        tablecell.delebtn.layer.borderWidth = 0.5f;
        tablecell.delebtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
            [tablecell.delebtn addTarget:self action:@selector(delebtn:) forControlEvents:UIControlEventTouchUpInside];
           
        tablecell.backview.layer.borderWidth = 0.5f;
        tablecell.backview.layer.borderColor = [UIColor lightGrayColor].CGColor;
            
        }
        
        model = [_arry objectAtIndex:indexPath.section];
        
        tablecell.delebtn.tag = [model.sid intValue];
        tablecell.pageCount.text = model.pageviews;
        tablecell.addTime.text = model.addtime;
        tablecell.titleName.text = model.name;
        tablecell.content.text = model.content;
        
        if ([model.thumb isEqualToString:@""]) {
            tablecell.thumbImage.image = [UIImage imageNamed:@"member_r29_c46.png"];
        }else{
        NSString *str =[NSString stringWithFormat:@"%@",model.thumb];
        NSURL *url = [NSURL URLWithString:[HTTP stringByAppendingFormat:@"%@",str]];
        [tablecell.thumbImage setImageWithURL:url];
        }
        
        return tablecell;
    }else{
        endcell *endtablecell = [tableView dequeueReusableCellWithIdentifier:@"endtablecell"];
        if (endtablecell ==nil) {
            endtablecell = [[[NSBundle mainBundle]loadNibNamed:@"endcell" owner:self options:nil]lastObject];
            
            endtablecell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];// 去掉圆角边框
            endtablecell.selectionStyle = UITableViewCellSelectionStyleGray;
            endtablecell.selectedBackgroundView.frame = CGRectMake(0, 0, 300, 120);
            
            endtablecell.layer.borderWidth = 0.5f;
            endtablecell.layer.borderColor = [UIColor lightGrayColor].CGColor;
            
            endtablecell.backview.layer.borderWidth = 0.5f;
            endtablecell.backview.layer.borderColor = [UIColor lightGrayColor].CGColor;
            
            endtablecell.againbutton.layer.borderWidth = 0.5f;
            endtablecell.againbutton.layer.borderColor = [UIColor lightGrayColor].CGColor;
            
            endtablecell.delebutton.layer.borderWidth = 0.5f;
            endtablecell.delebutton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        }
        MemberClassModel *member = [_endarry objectAtIndex:indexPath.section];
        endtablecell.pages.text = member.pageviews;
        endtablecell.addtime.text = member.addtime;
        endtablecell.name.text = member.name;
        endtablecell.content.text = member.content;
        
        return endtablecell;
    }
    UITableViewCell *cells = nil;
    return cells;

}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

#pragma mark -
#pragma mark 修改取消按钮
-(void)modifybtn
{
    fenlei = [[FenleiViewController alloc]init];
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(rewardCtlLeftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    fenlei.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    [self.navigationController pushViewController:fenlei animated:YES];
}


-(void)cancelbtn
{
    self.segmentedCtl.selectedSegmentIndex = 1;
    table.hidden = YES;
    endtable.hidden = NO;
}
#pragma mark 页面跳转

-(void)rewardCtlLeftButtonClick{
    [fenlei.navigationController popViewControllerAnimated:YES];
}

-(void)mleftBarBttonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)select:(id)sender {
    
    UISegmentedControl *seg=(UISegmentedControl *)sender;
    NSInteger indexclick = seg.selectedSegmentIndex;
    if (indexclick ==0) {
        endtable.hidden = YES;
        table.hidden = NO;
    }
    if (indexclick ==1) {
        table.hidden = YES;
        endtable.hidden = NO;
    }
}
@end
