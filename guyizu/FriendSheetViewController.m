//
//  FriendSheetViewController.m
//  FriendSheet
//
//  Created by lanye on 13-12-5.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "FriendSheetViewController.h"
#import "MessageListViewController.h"
#import "UIImageView+WebCache.h"

#define HTTP_URL @"http://www.guyizu.com/member.php?act=login_in&meth=member_msg_list"

@interface FriendSheetViewController ()

@end

@implementation FriendSheetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _namelable = [[NSMutableArray alloc]initWithObjects:@"似水流年",@"龙的传人",@"花儿绽放",@"似水流年",@"似水流年",@"似水流年", nil];
        _soureArry = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *uidStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"];
    NSString *UrlStr = [HTTP_URL stringByAppendingFormat:@"&uid=%@&new=1", uidStr];
    LHYHTTPRequest *sendRequest = [[LHYHTTPRequest alloc]initWith:UrlStr];
    sendRequest.delegate = self;
    
    
    //构建nav
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"咨询留言"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    self.backscroll.contentSize = CGSizeMake(320, 800);
    

    self.titleview.layer.masksToBounds = YES;
    self.titleview.layer.cornerRadius = 5.0;
    self.headerview.layer.borderWidth = 0.5f;
    self.headerview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    sheettable = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, 320, self.backscroll.contentSize.height - 60) style:UITableViewStylePlain];
//    NSLog(@"%f",self.backscroll.frame.size.height - 60);
    sheettable.delegate = self;
    sheettable.dataSource = self;
    sheettable.separatorStyle = UITableViewCellSeparatorStyleNone;
    sheettable.showsHorizontalScrollIndicator = NO;
    sheettable.showsVerticalScrollIndicator = NO;
    sheettable.scrollEnabled = NO;
    [self.backscroll addSubview:sheettable];
}

#pragma mark -

#pragma mark Download

-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest{
    
    [_soureArry removeAllObjects];
    NSDictionary *mDic = [send objectForKey:@"data"];
    for (NSDictionary *obj in [mDic allValues]) {
        [_soureArry addObject:obj];
    }
    
    [self reloadTableView];
}

-(void)reloadTableView{
    [sheettable reloadData];
}


#pragma mark leftButtonClick

-(void)mleftBarBttonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 10.0;
//}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.searchtext resignFirstResponder];
    return YES;
}

#pragma mark -

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0f;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_soureArry count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SheetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SheetCell" owner:self options:nil]lastObject];
    
        cell.img.layer.masksToBounds = YES;
        cell.img.layer.cornerRadius = 28.0;
        UIView *blackView = [[UIView alloc]initWithFrame:CGRectMake(0, cell.frame.size.height-0.5 , 320, 0.5)];
      
        blackView.backgroundColor = [UIColor lightGrayColor];
        [cell addSubview:blackView];
        if (indexPath.row ==0) {
            UIView *blackView1 = [[UIView alloc]initWithFrame:CGRectMake(0, cell.frame.origin.y , 320, 0.5)];
            blackView1.backgroundColor = [UIColor lightGrayColor];
            [cell addSubview:blackView1];
        }
        
    }
    
    cell.nameLabel.text = [[_soureArry objectAtIndex:indexPath.row] objectForKey:@"send_user"];
    cell.timeLabel.text = [[_soureArry objectAtIndex:indexPath.row] objectForKey:@"posttime"];
    cell.contentLabel.text = [[_soureArry objectAtIndex:indexPath.row] objectForKey:@"subject"];
    
    NSString *imagStr = [[_soureArry objectAtIndex:indexPath.row] objectForKey:@"send_thumb"];
    if (imagStr && !([imagStr isEqualToString:@""])) {
        [cell.img setImageWithURL:[NSURL URLWithString:imagStr]];
    }
   

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = [[_soureArry objectAtIndex:indexPath.row] objectForKey:@"senduid"];
    
    if ([str isEqualToString:@"0"]) {
        return;
    }
    
    MessageListViewController *mesageCtl = [[MessageListViewController alloc]initWithNibName:@"MessageListViewController" bundle:nil];
    [mesageCtl.mSendUid setString:str];
    
    [self.navigationController pushViewController:mesageCtl animated:YES];
    
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
