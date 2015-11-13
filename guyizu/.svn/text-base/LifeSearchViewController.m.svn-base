//
//  LifeSearchViewController.m
//  guyizu
//
//  Created by 蓝叶软件 on 11/22/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import "LifeSearchViewController.h"
#import "DownloadSearchView.h"
#import "MyCollectionCell.h"
#import "ReWardListViewController.h"
#import "ListViewController.h"
@interface LifeSearchViewController ()
{
    NSMutableArray* searchsubarray;
    DownloadSearchView* searchview;
}
@end

@implementation LifeSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _isrewardtosearch=YES;
    }
    return self;
}
-(void)notificationaction:(NSNotification*)sender
{
    searchsubarray=sender.object;
    NSLog(@"array=%@",searchsubarray);
    _collectionview.delegate=self;
    _collectionview.dataSource=self;
    [_collectionview reloadData];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"searchorsubview" object:Nil];
}
-(void)viewWillAppear:(BOOL)animated
{
    searchview.catidstring=-1;
    searchview.keywordstring=nil;
    searchview.issearch=NO;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    searchsubarray=[NSMutableArray new];
    searchview=[DownloadSearchView shardsearchview];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationaction:) name:@"searchorsubview" object:Nil];
    [searchview startsearchsubview];
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    self.titleview.layer.masksToBounds = YES;
    self.titleview.layer.cornerRadius = 5.0;
    self.titleview.layer.borderWidth = 0.5f;
    self.titleview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(leftReturnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"搜索"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    _collectionview.backgroundColor=[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    [_collectionview registerClass:[MyCollectionCell class] forCellWithReuseIdentifier:@"1"];
    //设置UICollectionViewLayout(布局);
    _collectionview.scrollEnabled=NO;
    _scrollview.contentSize=CGSizeMake(320, 800);
   
   
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* string=@"1";
    static int x=0;
    static int y=0;
    MyCollectionCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:string forIndexPath:indexPath];
    if([searchsubarray count]!=0)
    {
        NSString* str=searchsubarray[1][indexPath.row];
        if(indexPath.row%4==0)
        {
            x=0;
            y=0;
        }
        if(x+str.length*16>300)
        {
            x=0;
            y+=4;
        }
        cell.frame=CGRectMake(x,(indexPath.row+y)/4*50, str.length*16, 40);
        [cell show:str];
        cell.layer.borderColor=[UIColor lightGrayColor].CGColor;
        cell.layer.borderWidth=0.5f;
        x+=(str.length*16+10);
    }
    UIView* view=[UIView new];
    view.backgroundColor=[UIColor colorWithRed:0/255.0 green:160/255.0 blue:211/255.0 alpha:1];
    cell.selectedBackgroundView=view;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   NSString* sidstring=searchsubarray[0][indexPath.row];
    _catid=[sidstring intValue];
    NSLog(@"row=%d",_catid);

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if([searchsubarray count]==0)
    {
        return 0;
    }
    else
    {
        NSInteger row=[searchsubarray[1] count];
        return row;
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textfield resignFirstResponder];
    return YES;
}

#pragma mark -

-(void)leftReturnClick{
    searchview.issearch=NO;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
- (IBAction)searchbutton:(UIButton *)sender
{
    //_textfield.text
    //_catid
    if(_catid==-1 || _catid==0)
    {
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"请选择关键字模块!" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
    else if([_textfield.text isEqualToString:@""])
    {
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"搜索的商品不能为空!" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
    searchview=[DownloadSearchView shardsearchview];
    searchview.keywordstring=_textfield.text;
    searchview.catidstring=_catid;
    searchview.issearch=YES;
    if(_isrewardtosearch==YES)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        ListViewController* vc=[ListViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    }
}
@end
