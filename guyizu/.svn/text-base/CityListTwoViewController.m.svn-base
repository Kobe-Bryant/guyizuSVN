//
//  CityListTwoViewController.m
//  guyizu
//
//  Created by Mac mini on 13-12-10.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "CityListTwoViewController.h"


//#define HTTP_URL @"http://www.guyizu.com/item.php?act=subject&meth=get_citys"
#define HTTP2 @"http://www.baidu.com"
#define HTTP3 @"http://www.guyizu.com/member.php?act=login_in&meth=login"
#define HTTP4 @"http://www.guyizu.com/item.php?act=subject&meth=top_category&mid=1"
#define HTTP5 @"http://www.guyizu.com/member.php?act=login_in&meth=get_city&lng=114.110383&lat=22.561992"


#define HTTP_URL @"http://www.guyizu.com/item.php?act=subject&meth=get_citys"
@interface CityListTwoViewController ()

@end

@implementation CityListTwoViewController

@synthesize passHomePage = _passHomePage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
       _mutableData = [[NSMutableData alloc]initWithCapacity:0];
        _mutableArry = [[NSMutableArray alloc]initWithCapacity:0];
        _hotArry = [[NSMutableArray alloc]initWithCapacity:0];
        _sortArry = [[NSMutableArray alloc]initWithCapacity:0];
        _initialArry = [[NSMutableArray alloc]initWithCapacity:0];
        hotarr = [[NSMutableArray alloc]initWithCapacity:0];
         _nameArry = [[NSMutableArray alloc]initWithCapacity:10];
        
        _arr1 = [[NSMutableArray alloc]initWithCapacity:0];
        _arr10 = [[NSMutableArray alloc]initWithCapacity:0];
        _a = [[NSMutableArray alloc]initWithCapacity:0];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DownloadOverWangcong) name:@"choosecityDownloadOverWangcong" object:nil];
//    
//    if ([[DownloadChooseCity shareDownload ].mutableArry count]) {
//        [DownloadChooseCity shareDownload ];
//    }else{
//        [self DownloadOverWangcong];
//    }
    //navigation
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setBackgroundColor:[UIColor clearColor]];
    [customLab setText:@"选择城市"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"city_close.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 20, 20);
    [leftbutton addTarget:self action:@selector(leftReturnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    table = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    table.delegate =self;
    table.dataSource = self;
    [self.view addSubview:table];
    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:HTTP_URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:HTTP_URL]];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    [self startDownload];
}


-(void)startDownload
{
        LHYHTTPRequest *citysend = [[LHYHTTPRequest alloc]initWith:HTTP_URL];
        citysend.delegate = self;
}

-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest{
    NSMutableArray *arr;
    NSMutableArray *arr2;
    NSDictionary *mDic = [send objectForKey:@"data"];
    NSMutableDictionary *citysDic = [mDic objectForKey:@"citys"];
    for (NSMutableDictionary *sdic in citysDic) {
        NSString *str = [sdic objectForKey:@"sort"];
        arr = [[NSMutableArray alloc]initWithObjects:str, nil];
        [_arr1 addObject:arr];
        
        arr2 = [sdic objectForKey:@"city"];
        for (NSMutableDictionary *cityname in arr2) {
            [_arr10 removeAllObjects];
            NSString *strr = [cityname objectForKey:@"name"];
            [_arr10 addObject:strr];
            [_a addObject:_arr10];
        }
        NSMutableArray *cityArr = [sdic objectForKey:@"city"];
         city *thisModel = [[city alloc]init];
            for (NSMutableDictionary *scity in cityArr) {
                
                thisModel.aid = [scity objectForKey:@"aid"];
                thisModel.initial = [scity objectForKey:@"initial"];
                thisModel.name = [scity objectForKey:@"name"];
                [_initialArry addObject:thisModel.initial];
                [_nameArry addObject:thisModel.name];
                [_mutableArry addObject:thisModel];
            }
        
    }
    NSMutableDictionary *hotDic = [mDic objectForKey:@"hot"];
    
    for (NSMutableDictionary *hot in hotDic) {
        city *this = [[city alloc]init];
        this.hotaid = [hot objectForKey:@"aid"];
        this.hotname = [hot objectForKey:@"name"];
         [hotarr addObject:this.hotname];
        [_hotArry addObject:this];
    }
    [table reloadData];
    NSLog(@"_initialArry=%@",_initialArry);
     NSLog(@"count=%d",_initialArry.count);
    NSLog(@"_nameArry=%@",_nameArry);
//    NSString *strr = @"rr";
//     NSArray *hoArr = [[NSArray alloc]initWithObjects:strr, nil];
     //[_arr1 addObject:hoArr];
    //[_a addObject:_hotArry];
    
//    NSLog(@"arr1=%@",_arr1);
//     NSLog(@"a=%@",_a);
    
}
#pragma mark -

#pragma mark navigationButtonClick
-(void)leftReturnClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark DownloadOver


//-(void)DownloadOverWangcong
//{
//    _mutableArry = [DownloadChooseCity shareDownload].mutableArry;
//    _hotArry = [DownloadChooseCity shareDownload].hotArry;
//    _arr1 = [DownloadChooseCity shareDownload].arr1;
//    _arr10 = [DownloadChooseCity shareDownload].a;
//    NSString *strr = @"rr";
//    NSArray *hoArr = [[NSArray alloc]initWithObjects:strr, nil];
//    [_arr1 addObject:hoArr];
//    
//    for (city *this in _hotArry) {
//        [hotarr addObject:this.hotname];
//    }
//    [_arr10 addObject:hotarr];
//     _dic = [NSMutableDictionary dictionaryWithObjects:_arr10 forKeys: _arr1];
//    
//  
//    for (city *obj in _mutableArry) {
//        [_nameArry addObject:obj.name];
//        [_initialArry addObject:obj.initial];
//    }
//    [_initialArry addObject:@"热门城市"];
//   NSLog(@"---%@",_initialArry);
//  
//    [table reloadData];
//}


#pragma mark UItableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   
    return _initialArry.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSString *key = [[_dic allKeys] objectAtIndex:section];
//    NSArray *arry = [_dic objectForKey:key];

    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *oneCell = [tableView dequeueReusableCellWithIdentifier:@"CityCell"];
    if (oneCell == nil) {
        oneCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CityCell"];
    }
    oneCell.textLabel.text =[_nameArry objectAtIndex:indexPath.section];
    
    return oneCell;
}

////每个section的分栏
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_initialArry objectAtIndex:section];
   
}

////索引栏
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _initialArry;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *key = [_nameArry objectAtIndex:indexPath.section];
    _passHomePage.cityName = key;
    
    [self.navigationController popToViewController:_passHomePage animated:YES];
}

////返回索引对应的位置
//-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
//{
//    
//    for (int i=0; i<[dic allKeys].count; i++) {
//        if ([title isEqualToString:[[dic allKeys] objectAtIndex:i]]) {
//            return i;
//        }
//    }
//    return 0;
//}



#pragma mark NSURLConnection

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [_mutableData setLength:0];
    [_mutableArry removeAllObjects];
   // NSHTTPURLResponse *mResponse = (NSHTTPURLResponse *)response;
    //NSLog(@"%@",mResponse.allHeaderFields);
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_mutableData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{

//    NSDictionary *mDic = [NSJSONSerialization JSONObjectWithData:_mutableData options:NSJSONReadingMutableLeaves error:nil];
//    NSDictionary *mDic2 = [mDic objectForKey:@"data"];
//    NSArray *citysArry = [mDic2 objectForKey:@"citys"];
//    NSArray *hotArry = [mDic2 objectForKey:@"hot"];
    
    //NSLog(@"1%@",[[NSString alloc]initWithData:_mutableData encoding:NSUTF8StringEncoding]);
//    NSString *str = [[NSString alloc]initWithData:_mutableData encoding:NSUTF8StringEncoding];
   // NSLog(@"2%@",[NSJSONSerialization JSONObjectWithData:_mutableData options:NSJSONReadingMutableLeaves error:nil]);
    
//    NSLog(@"%@", [[NSString alloc]initWithData:_mutableData encoding:NSUTF8StringEncoding]);
//    NSLog(@"%d",[NSJSONSerialization isValidJSONObject:_mutableData]);
    
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
   // NSLog(@"city connection error");
}


#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
