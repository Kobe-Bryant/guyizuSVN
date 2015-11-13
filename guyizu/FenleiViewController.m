//
//  FenleiViewController.m
//  guyizu
//
//  Created by 蓝叶软件 on 11/22/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import "FenleiViewController.h"
#import "LifeSearchViewController.h"
#import "ListViewController.h"
#import "DownloadFenlei.h"
#import "LifeFenleiModel.h"
#import "ErshouViewController.h"


#define HTTP_URL @"http://www.guyizu.com/item.php?act=subject&meth=sub_category"

@interface FenleiViewController ()

@end

@implementation FenleiViewController

@synthesize rightArry = _rightArry;
@synthesize leftbutton = _leftbutton;
@synthesize isFenlei = _isFenlei;
@synthesize fatherID = _fatherID;
@synthesize sonID = _sonID;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _leftArry = [[NSMutableArray alloc]initWithCapacity:0];
        _rightArry = [[NSMutableArray alloc]initWithCapacity:0];
        
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
//    if ([_leftArry count] == 0 && _leftArry) {
//        [self fenleiDownloadOver];
//    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //分类下载
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fenleiDownloadOver) name:@"lifeFenleiDownloadOver" object:nil];
    [[DownloadFenlei shareDownload] startDownload];
   
    
    
    //navigationItem 
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    [customLab setText:@"生活分类"];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"life_top_search"] forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(0, 0, 20, 20);
    [rightButton addTarget:self action:@selector(shearchClickButton) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    
    leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 360) style:UITableViewStylePlain];
    leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    leftTableView.dataSource = self;
    leftTableView.delegate = self;
    [self.view addSubview:leftTableView];
    
    rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(320, 0, 220, 460) style:UITableViewStylePlain];
    rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    rightTableView.backgroundColor = [UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1.0];
    rightTableView.dataSource = self;
    rightTableView.delegate = self;
    [self.view addSubview:rightTableView];
    
    //添加手势给主View
    UIPanGestureRecognizer *panGest = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGest:)];
    [self.view addGestureRecognizer:panGest];
    
}

#pragma mark -

#pragma mark downloadOver

-(void)fenleiDownloadOver{
    
    NSArray *arr1 = [DownloadFenlei shareDownload].passArry;
    
        for (LifeFenleiModel *thisModel in arr1) {
            [_leftArry addObject:thisModel.name];
        }
        [leftTableView reloadData];
}

//右侧下载完成
-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest{
    [_rightArry removeAllObjects];
    
    NSArray *arr1 = [send objectForKey:@"data"];
    for (NSDictionary *mDic in arr1) {
        LifeFenleiModel *thisModel = [[LifeFenleiModel alloc]init];
        thisModel.name = [mDic objectForKey:@"name"];
        thisModel.mID = [mDic objectForKey:@"catid"];
        [_rightArry addObject:thisModel];
    }
    
    [rightTableView reloadData];
}

#pragma mark -

-(void)panGest:(UIPanGestureRecognizer *)recognizer{
    CGPoint translation = [recognizer translationInView:self.view];
//    CGFloat x = translation.x + recognizer.view.center.x;
    
    CGPoint thisPoint;
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        thisPoint = [recognizer locationInView:recognizer.view];
    }

   
    if (translation.x < 0 && translation.x > -90.0f) {
        NSLog(@"%f",translation.x);
        [UIView animateWithDuration:0.5 animations:^(void){
//            [leftTableView setFrame:CGRectMake(-40, 0, leftTableView.frame.size.width, leftTableView.frame.size.height)];
            [rightTableView setFrame:CGRectMake(120, 0, rightTableView.frame.size.width, rightTableView.frame.size.height)];
        }completion:^(BOOL fnished){
            
        }];
    }else if (translation.x > 0 && translation.x < 90.0f){
        [UIView animateWithDuration:0.5 animations:^(void){
//            [leftTableView setFrame:CGRectMake(0, 0, leftTableView.frame.size.width, leftTableView.frame.size.height)];
            [rightTableView setFrame:CGRectMake(320, 0, rightTableView.frame.size.width, rightTableView.frame.size.height)];
        }completion:^(BOOL fnished){
            
        }];
    }
}

-(void)shearchClickButton{
    LifeSearchViewController *lifeCtl = [[LifeSearchViewController alloc]initWithNibName:@"LifeSearchViewController" bundle:nil];
    lifeCtl.isrewardtosearch=NO;
    [self.navigationController pushViewController:lifeCtl animated:YES];
}

#pragma mark uitableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == leftTableView) {
        return [_leftArry count];
    }else{
        return [_rightArry count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    int section = indexPath.section;
    int row = indexPath.row;
    if (tableView == leftTableView) {
        UITableViewCell *leftCell = [tableView dequeueReusableCellWithIdentifier:@"leftCell"];
        if (leftCell == nil) {
            leftCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"leftCell"];
            
            UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, leftCell.frame.size.height-0.5, 320, 0.5)];
            footView.backgroundColor = [UIColor colorWithRed:191/255.0 green:191/255.0 blue:191/255.0 alpha:1];
            [leftCell.contentView addSubview:footView];
            
            UIView *backView = [[UIView alloc] initWithFrame:leftCell.frame];
            leftCell.selectedBackgroundView = backView;
            leftCell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1.0];
            leftCell.textLabel.font = [UIFont systemFontOfSize:15.0f];
        }
        
        //判断是否为零
        if (_leftArry && [_leftArry count] != 0) {
            //leftCell.textLabel.text = [_leftArry objectAtIndex:indexPath.row];
            switch (section) {
                case 0:
                    if (row ==0) {
                        UILabel *cell1lable1 = [[UILabel alloc]initWithFrame:CGRectMake(43,10 , 110, 24)];
                        cell1lable1.backgroundColor = [UIColor clearColor];
                        cell1lable1.text = [_leftArry objectAtIndex:indexPath.row];
                        cell1lable1.font =[UIFont systemFontOfSize:15.0f];
                        [leftCell.contentView addSubview:cell1lable1];
                    }
                    if (row ==1) {
                        UILabel *cell1lable1 = [[UILabel alloc]initWithFrame:CGRectMake(43,10 , 110, 24)];
                        cell1lable1.backgroundColor = [UIColor clearColor];
                        cell1lable1.text = [_leftArry objectAtIndex:indexPath.row];
                        cell1lable1.font =[UIFont systemFontOfSize:15.0f];
                        [leftCell.contentView addSubview:cell1lable1];
                    }
                    if (row ==2) {
                        UILabel *cell1lable1 = [[UILabel alloc]initWithFrame:CGRectMake(43,10 , 110, 24)];
                        cell1lable1.backgroundColor = [UIColor clearColor];
                        cell1lable1.text = [_leftArry objectAtIndex:indexPath.row];
                        cell1lable1.font =[UIFont systemFontOfSize:15.0f];
                        [leftCell.contentView addSubview:cell1lable1];
                    }
                    if (row ==3) {
                        UILabel *cell1lable1 = [[UILabel alloc]initWithFrame:CGRectMake(43,10 , 110, 24)];
                        cell1lable1.backgroundColor = [UIColor clearColor];
                        cell1lable1.text = [_leftArry objectAtIndex:indexPath.row];
                        cell1lable1.font =[UIFont systemFontOfSize:15.0f];
                        [leftCell.contentView addSubview:cell1lable1];
                    }
                    if (row ==4) {
                        UILabel *cell1lable1 = [[UILabel alloc]initWithFrame:CGRectMake(43,10 , 110, 24)];
                        cell1lable1.backgroundColor = [UIColor clearColor];
                        cell1lable1.text = [_leftArry objectAtIndex:indexPath.row];
                        cell1lable1.font =[UIFont systemFontOfSize:15.0f];
                        [leftCell.contentView addSubview:cell1lable1];
                    }
                    if (row ==5) {
                        UILabel *cell1lable1 = [[UILabel alloc]initWithFrame:CGRectMake(43,10 , 110, 24)];
                        cell1lable1.backgroundColor = [UIColor clearColor];
                        cell1lable1.text = [_leftArry objectAtIndex:indexPath.row];
                        cell1lable1.font =[UIFont systemFontOfSize:15.0f];
                        [leftCell.contentView addSubview:cell1lable1];
                    }
                    if (row ==6) {
                        UILabel *cell1lable1 = [[UILabel alloc]initWithFrame:CGRectMake(43,10 , 110, 24)];
                        cell1lable1.backgroundColor = [UIColor clearColor];
                        cell1lable1.text = [_leftArry objectAtIndex:indexPath.row];
                        cell1lable1.font =[UIFont systemFontOfSize:15.0f];
                        [leftCell.contentView addSubview:cell1lable1];
                    }
                    break;
                    
                default:
                    break;
            }
        }
        NSMutableArray *nameArry = [[NSMutableArray alloc]init];
        for (NSUInteger i = 1; i < 9; ++i) {
            NSString *nameStr = [NSString stringWithFormat:@"life_sort_0%d",i];
            [nameArry addObject:nameStr];
        }
        
        //只有7张图
        if ([_leftArry count] == 7) {
            leftCell.imageView.image = [UIImage imageNamed:[nameArry objectAtIndex:indexPath.row]];
        }
        
        
        return leftCell;
    }
    
    else{
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        UITableViewCell *rightCell = [tableView dequeueReusableCellWithIdentifier:@"rightCell"];
        if (rightCell == nil) {
            rightCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"rightCell"];
            rightCell.backgroundColor = [UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1.0];
            
            UIView *backView = [[UIView alloc] initWithFrame:rightCell.frame];
            rightCell.selectedBackgroundView = backView;
            rightCell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:0/255.0 green:160/255.0 blue:211/255.0 alpha:1.0];
            
            rightCell.textLabel.font = [UIFont systemFontOfSize:15.0f];
            
        }
        
        //判断是否为零
        if (_leftArry && [_leftArry count] != 0) {
            rightCell.textLabel.text = ((LifeFenleiModel *)[_rightArry objectAtIndex:indexPath.row]).name;
        }
         rightCell.textLabel.highlightedTextColor = [UIColor whiteColor];

        
        return rightCell;
    }
    
    UITableViewCell *hengheng = nil;
    return hengheng;
}

#pragma mark tableViewDelegate


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    if (tableView == leftTableView) {
        NSArray *arr1 = [DownloadFenlei shareDownload].passArry;
        LifeFenleiModel *thisModel = [arr1 objectAtIndex:indexPath.row];
        
        //获取左边id
        _fatherID = thisModel.mID;
        //获得ID后开始下载
        leftstr = [HTTP_URL stringByAppendingFormat:@"&id=%@", thisModel.mID];
        LHYHTTPRequest *mRequest = [[LHYHTTPRequest alloc]initWith:leftstr];
        mRequest.delegate = self;
        
        
        //取得左边tableView字符串
        leftstr = [_leftArry objectAtIndex:indexPath.row];
        
        //位移
        [UIView animateWithDuration:0.5 animations:^(void){
            [rightTableView setFrame:CGRectMake(120, 0, rightTableView.frame.size.width, rightTableView.frame.size.height)];
        }completion:^(BOOL fnished){
            
        }];
        
        
    }else{
        //取得右边id
        _sonID = ((LifeFenleiModel *)[_rightArry objectAtIndex:indexPath.row]).mID;
      
        
        
        //判断是否是分类还是发布
        if (_isFenlei == YES) {
            ListViewController *listCtl = [[ListViewController alloc]init];
            listCtl.ishometolistview=NO;
            listCtl.catid=[_sonID intValue];
            [self.navigationController pushViewController:listCtl animated:NO];
        }else{
            
            //右边字符串
            NSString *rightstr = ((LifeFenleiModel *)[_rightArry objectAtIndex:indexPath.row]).name;
            
            ErshouViewController *sendDetailCtl = [[ErshouViewController alloc]initWithNibName:@"ErshouViewController" bundle:nil];
            NSString *totlestr = [NSString stringWithFormat:@"%@ %@",leftstr,rightstr];
            [sendDetailCtl.passStr setString:totlestr];
            [sendDetailCtl.leftpasstr setString:_fatherID];
            [sendDetailCtl.rightpasstr setString:_sonID];
            [self.navigationController pushViewController:sendDetailCtl animated:YES];
        }
        
    }
    
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
