//
//  UserViewController.m
//  UserCenter
//
//  Created by lanye on 13-11-30.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "UserViewController.h"
#import "PeronalDataViewController.h"
#import "ChangepasswordViewController.h"
#import "collectionViewController.h"
#import "ClassinfoViewController.h"
#import "collectionViewController.h"
#import "InfoCenterViewController.h"
#import "MyApplyingViewController.h"
#import "ApplyingViewController.h"
#import "MessageListViewController.h"
#import "FriendSheetViewController.h"
#import "DengluViewController.h"
#import "AppDelegate.h"
#import "DownloadUser.h"
#import "UIImageView+WebCache.h"
@interface UserViewController ()

@end

@implementation UserViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DownloadOver) name:@"usercenterDownloadOver" object:nil];
    [[DownloadUser shareDownload] startDownload];

    self.view.backgroundColor = [UIColor colorWithRed:242/255.0 green:245/255.0 blue:244/255.0 alpha:1];
    self.backscroll.contentSize = CGSizeMake(320, 800);
    
    self.titleimage.layer.masksToBounds = YES;
    self.titleimage.layer.cornerRadius = 41.0;
    self.titleimage.layer.borderWidth = 2.5f;
    self.titleimage.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.aooly.layer.masksToBounds = YES;
    self.aooly.layer.cornerRadius = 5.0;
    self.aooly.layer.borderWidth = 1.5f;
    self.aooly.layer.borderColor = [UIColor whiteColor].CGColor;
    
    UIColor *backcolor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"member_r45_c1.png"]];
    self.titleview.backgroundColor = backcolor;
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"用户中心"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
   
    self.classifybtn.layer.borderWidth = 0.4f;
    self.classifybtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.rewardbtn.layer.borderWidth = 0.4f;
    self.rewardbtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.wordsbtn.layer.borderWidth = 0.4f;
    self.wordsbtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.leftbtn.layer.borderWidth = 0.5f;
    self.leftbtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.midbtn.layer.borderWidth = 0.5f;
    self.midbtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.rightbtn.layer.borderWidth = 0.5f;
    self.rightbtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    table = [[UITableView alloc]initWithFrame:CGRectMake(10, 140, 300, 530) style:UITableViewStyleGrouped];
    table.backgroundColor = [UIColor colorWithRed:242/255.0 green:245/255.0 blue:244/255.0 alpha:1];
    table.delegate = self;
    table.dataSource = self;
    table.sectionHeaderHeight = 5.0;
    table.sectionFooterHeight = 5.0;
    table.scrollEnabled =  NO;
   table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.backscroll addSubview:table];
    
    self.titleimage.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.titleimage addGestureRecognizer:tap];
    
    UIButton *_submitBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 590, 300, 40)];
    [_submitBtn setTitle:@"退出登陆" forState:UIControlStateNormal];
    [_submitBtn setTintColor:[UIColor whiteColor]];
    [_submitBtn setBackgroundColor:[UIColor redColor]];
    [_submitBtn addTarget:self action:@selector(zhuxiaoButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.backscroll addSubview:_submitBtn];
    
    AppDelegate *homeApp = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (homeApp.isIos6) {
        UIView *backView = [[UIView alloc]init];
        [table setBackgroundView:backView];
        [table setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark -
#pragma mark DownloadOver

-(void)DownloadOver{
    
    NSMutableArray *arr1 = [DownloadUser shareDownload].mutableArry;
    
    UserModel *thismodel = (UserModel *)[arr1 firstObject];
    self.username.text = thismodel.username;
    self.rmb.text = thismodel.rmb;
    self.item_count.text = thismodel.item_count;
    self.task_count.text = thismodel.task_count;
    self.select_count.text = thismodel.select_count;
    self.newmsg.text = thismodel.newmsg;
    self.subtask_count.text = thismodel.task_count;
    self.msgcount.text = thismodel.msgcount;
    if ([thismodel.facepath isEqualToString:@""]) {
        self.facepath.image = [UIImage imageNamed:@"abbb2.png"];
    }else{
        NSURL *url = [NSURL URLWithString:thismodel.facepath];
         [self.facepath setImageWithURL:url];
    }
    
}

#pragma mark -

-(void)zhuxiaoButtonClick{

    NSURLRequest *mrequest = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://www.guyizu.com/member.php?act=login_in&meth=logout"]];
    [NSURLConnection connectionWithRequest:mrequest delegate:nil];
    
    [[NSUserDefaults standardUserDefaults] setBool: NO forKey:@"islogin"];
    [self.navigationController popToRootViewControllerAnimated:YES];
    self.leveyTabBarController.selectedIndex = 0;
}

-(void)tap
{
    UIActionSheet* mySheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消"destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选择", nil];
    [mySheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    if (buttonIndex == 0) {
        UIImagePickerController *pick = [[UIImagePickerController alloc]init];
        pick.delegate = self;
        pick.sourceType = UIImagePickerControllerSourceTypeCamera;
        pick.allowsEditing = YES;
        [self presentViewController:pick animated:YES completion:NULL];
        
    }
    if (buttonIndex == 1) {
        UIImagePickerController *pick = [[UIImagePickerController alloc]init];
        pick.delegate = self;
        pick.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:pick animated:YES completion:NULL];
    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.titleimage.image = image;
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

#pragma mark -

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    static NSString *indenfer = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indenfer];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indenfer];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.backgroundColor = [UIColor whiteColor];
       
       AppDelegate *homeApp = (AppDelegate *)[UIApplication sharedApplication].delegate;
        if (homeApp.isIos6) {
            
       }else{
            UIView *blackView = [[UIView alloc]initWithFrame:CGRectMake(0, cell.frame.size.height - 0.5, 300, 0.5)];
            blackView.backgroundColor = [UIColor lightGrayColor];
            [cell.contentView addSubview:blackView];
            
            UIView *blackView1 = [[UIView alloc]initWithFrame:CGRectMake(0,cell.frame.origin.y,0.5 , 132)];
            blackView1.backgroundColor = [UIColor lightGrayColor];
            [cell.contentView addSubview:blackView1];
            
            UIView *blackView2 = [[UIView alloc]initWithFrame:CGRectMake(299,cell.frame.origin.y,0.5 , 132)];
            blackView2.backgroundColor = [UIColor lightGrayColor];
            [cell.contentView addSubview:blackView2];
            
            if (indexPath.row == 0) {
                UIView *blackView3 = [[UIView alloc]initWithFrame:CGRectMake(0, cell.frame.origin.y , 300, 0.5)];
                blackView3.backgroundColor = [UIColor lightGrayColor];
                [cell.contentView addSubview:blackView3];}
            
       }
    }
   
    switch (section) {
        case 0:
            if (row == 0) {
                UILabel *cell1lable1 = [[UILabel alloc]initWithFrame:CGRectMake(55,10 , 110, 24)];
                cell1lable1.backgroundColor = [UIColor clearColor];
                cell1lable1.text = @"分类信息管理";
                [cell.contentView addSubview:cell1lable1];
                
                cell.imageView.image = [UIImage imageNamed:@"member_r5_c15.png"];
            }if (row ==1) {
                UILabel *cell1lable1 = [[UILabel alloc]initWithFrame:CGRectMake(55,10 , 110, 24)];
                cell1lable1.backgroundColor = [UIColor clearColor];
                cell1lable1.text = @"消息中心";
                [cell.contentView addSubview:cell1lable1];
                
                cell.imageView.image = [UIImage imageNamed:@"member_r5_c22.png"];
            }
            if (row == 2) {
                UILabel *cell1lable1 = [[UILabel alloc]initWithFrame:CGRectMake(55,10 , 110, 24)];
                cell1lable1.backgroundColor = [UIColor clearColor];
                cell1lable1.text = @"我收藏的信息";
                [cell.contentView addSubview:cell1lable1];
                
                cell.imageView.image = [UIImage imageNamed:@"member_r11_c14.png"];
            }
            break;
        case 1:
            if (row == 0) {
                UILabel *cell1lable1 = [[UILabel alloc]initWithFrame:CGRectMake(55,10 , 110, 24)];
                cell1lable1.backgroundColor = [UIColor clearColor];
                cell1lable1.text = @"我的悬赏";
                [cell.contentView addSubview:cell1lable1];
                
                cell.imageView.image = [UIImage imageNamed:@"member_r4_c36.png"];
            }if (row ==1) {
                UILabel *cell1lable1 = [[UILabel alloc]initWithFrame:CGRectMake(55,10 , 110, 24)];
                cell1lable1.backgroundColor = [UIColor clearColor];
                cell1lable1.text = @"我的应征";
                [cell.contentView addSubview:cell1lable1];
                
                cell.imageView.image = [UIImage imageNamed:@"member_r3_c40.png"];
            }
            if (row == 2) {
                UILabel *cell1lable1 = [[UILabel alloc]initWithFrame:CGRectMake(55,10 , 110, 24)];
                cell1lable1.backgroundColor = [UIColor clearColor];
                cell1lable1.text = @"我收藏的任务";
                [cell.contentView addSubview:cell1lable1];
                
                cell.imageView.image = [UIImage imageNamed:@"member_r11_c14.png"];
            }
            break;
        case 2:
            if (row == 0) {
                UILabel *cell1lable1 = [[UILabel alloc]initWithFrame:CGRectMake(55,10 , 110, 24)];
                cell1lable1.backgroundColor = [UIColor clearColor];
                cell1lable1.text = @"咨询留言";
                [cell.contentView addSubview:cell1lable1];
                
                cell.imageView.image = [UIImage imageNamed:@"member_r11_c23.png"];
            }if (row ==1) {
                UILabel *cell1lable1 = [[UILabel alloc]initWithFrame:CGRectMake(55,10 , 110, 24)];
                cell1lable1.backgroundColor = [UIColor clearColor];
                cell1lable1.text = @"资料管理";
                [cell.contentView addSubview:cell1lable1];
                
                cell.imageView.image = [UIImage imageNamed:@"memeber_5_r1_c31.png"];
            }
            if (row == 2) {
                UILabel *cell1lable1 = [[UILabel alloc]initWithFrame:CGRectMake(55,10 , 110, 24)];
                cell1lable1.backgroundColor = [UIColor clearColor];
                cell1lable1.text = @"我的密码";
                [cell.contentView addSubview:cell1lable1];
                
                cell.imageView.image = [UIImage imageNamed:@"member_r10_c38.png"];
            }
            break;
            
        default:
            break;
    }
     [cell.imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"section:%d, row:%d",indexPath.section,indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
//                @"分类信息管理";
                ClassinfoViewController *classCtl = [[ClassinfoViewController alloc]initWithNibName:@"ClassinfoViewController" bundle:nil];
                [self.navigationController pushViewController:classCtl animated:YES];
               
            }if (indexPath.row ==1) {
//                 @"消息中心";
                InfoCenterViewController *infoCtl = [[InfoCenterViewController alloc]initWithNibName:@"InfoCenterViewController" bundle:nil];
                [self.navigationController pushViewController:infoCtl animated:YES];
               
            }
            if (indexPath.row == 2) {
//                 @"我收藏的信息";
                collectionViewController *collectionCtl = [[collectionViewController alloc]initWithNibName:@"collectionViewController" bundle:nil];
                [self.navigationController pushViewController:collectionCtl animated:YES];
            }
            break;
        case 1:
            if (indexPath.row == 0) {
//                 @"我的悬赏";
                ApplyingViewController *applingCtl = [[ApplyingViewController alloc]initWithNibName:@"ApplyingViewController" bundle:nil];
                [self.navigationController pushViewController:applingCtl animated:YES];
               
            }if (indexPath.row ==1) {
//                 @"我的应征";
                  MyApplyingViewController *myAppCtl = [[MyApplyingViewController alloc]initWithNibName:@"MyApplyingViewController" bundle:nil];
                [self.navigationController pushViewController:myAppCtl animated:YES];
            }
            if (indexPath.row == 2) {
//               @"我收藏的任务";
                collectionViewController *collectionCtl = [[collectionViewController alloc]initWithNibName:@"collectionViewController" bundle:nil];
                collectionCtl.selectIndex = 1;
                [self.navigationController pushViewController:collectionCtl animated:YES];
                [collectionCtl.segmentCtl setSelectedSegmentIndex:1];
            }
            break;
        case 2:
            if (indexPath.row == 0) {
                //消息
                FriendSheetViewController *friendCtl = [[FriendSheetViewController alloc]initWithNibName:@"FriendSheetViewController" bundle:nil];
                [self.navigationController pushViewController:friendCtl animated:YES];

            }if (indexPath.row ==1) {
//                @"资料管理";
                PeronalDataViewController *peronalCtl = [[PeronalDataViewController alloc]initWithNibName:@"PeronalDataViewController" bundle:nil];
                [self.navigationController pushViewController:peronalCtl animated:YES];
            }
            if (indexPath.row == 2) {
                // @"密码";
                ChangepasswordViewController *changeCtl = [[ChangepasswordViewController alloc]initWithNibName:@"ChangepasswordViewController" bundle:nil];
                [self.navigationController pushViewController:changeCtl animated:YES];
                
            }
            break;
            
        default:
            break;
    }
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)aooly:(id)sender {
    
    PendingtaskViewController *pend = [[PendingtaskViewController alloc]init];
    [self.navigationController pushViewController:pend animated:YES];
  
}

- (IBAction)leftbtn:(id)sender {
    self.leftbtn.layer.borderColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1].CGColor;
    [self.leftbtn setBackgroundColor:[UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1]];
    self.midbtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.midbtn setBackgroundColor:[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1]];
    self.rightbtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.rightbtn setBackgroundColor:[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1]];
}

- (IBAction)midbtn:(id)sender {
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0.5, 0, 0.5, 40)];
    view1.backgroundColor = [UIColor lightGrayColor];
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(107, 0, 0.5, 40)];
    view2.backgroundColor = [UIColor lightGrayColor];
    [self.midbtn addSubview:view1];
    [self.midbtn addSubview:view2];
    
    self.midbtn.layer.borderColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1].CGColor;
    [self.midbtn setBackgroundColor:[UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1]];
    self.leftbtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.leftbtn setBackgroundColor:[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1]];
    self.rightbtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.rightbtn setBackgroundColor:[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1]];
    
    ApplyingViewController *apply = [[ApplyingViewController alloc]init];
    [self.navigationController pushViewController:apply animated:YES];
}

- (IBAction)rightbtn:(id)sender {
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(0.5, 0, 0.5, 40)];
     view3.backgroundColor = [UIColor lightGrayColor];
     [self.rightbtn addSubview:view3];
   
    self.rightbtn.layer.borderColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1].CGColor;
    [self.rightbtn setBackgroundColor:[UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1]];
    self.leftbtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.leftbtn setBackgroundColor:[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1]];
    self.midbtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.midbtn setBackgroundColor:[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1]];
    
    FriendSheetViewController *friend = [[FriendSheetViewController alloc]init];
    [self.navigationController pushViewController:friend animated:YES];
    
}


@end
