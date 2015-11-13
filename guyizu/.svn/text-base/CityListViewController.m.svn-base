//
//  HomePageViewController.m
//  guyizu
//
//  Created by 蓝叶软件 on 11/21/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import "CityListViewController.h"

@interface CityListViewController ()
@property (nonatomic, retain) UIImageView* checkImgView;
@property NSUInteger curSection;
@property NSUInteger curRow;
@property NSUInteger defaultSelectionRow;
@property NSUInteger defaultSelectionSection;
@end

@implementation CityListViewController
@synthesize tbView;
@synthesize passHomePage = _passHomePage;

#define CHECK_TAG 1110

@synthesize cities, keys, checkImgView, curSection, curRow, delegate;
@synthesize defaultSelectionRow, defaultSelectionSection;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _mutableArry = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}

- (void)dealloc
{
    [tbView release];
    [super dealloc];
    [cities release];
    [keys release];
    [checkImgView release];
}

- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];

}

#pragma mark - View lifecycle

-(void)leftReturnClick{
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)blackViewClick{
    [blackView removeFromSuperview];
    blackView = nil;
    
    [self.mSearchBar resignFirstResponder];
}

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    blackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 400)];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha = 0.3;
    [self.view addSubview:blackView];
    
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(blackViewClick)];
    [blackView addGestureRecognizer:tapGest];
    
    return YES;
}

#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];
    curRow = NSNotFound;
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"选择城市"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"city_close.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 20, 20);
    [leftbutton addTarget:self action:@selector(leftReturnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    
    
    
//    self.view.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    self.checkImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check"]];
    checkImgView.tag = CHECK_TAG;

    NSString *path=[[NSBundle mainBundle] pathForResource:@"citydict"   
                                                   ofType:@"plist"]; 
    self.cities = [[NSDictionary alloc]   
                   initWithContentsOfFile:path];
    
    self.keys = [[cities allKeys] sortedArrayUsingSelector:  
                 @selector(compare:)]; 
    
    
    NSString* defaultCity = [delegate getDefaultCity];
    if (defaultCity) {
        NSArray *citySection;
        self.defaultSelectionRow = NSNotFound;
        //set table index to this city if it existed
        for (NSString* key in keys) {
            citySection = [cities objectForKey:key];
            self.defaultSelectionRow = [citySection indexOfObject:defaultCity];
            if (NSNotFound == defaultSelectionRow)
                continue;
            //found match recoard position
            self.defaultSelectionSection = [keys indexOfObject:key];
            break;
        }
        
        if (NSNotFound != defaultSelectionRow) {
            
            self.curSection = defaultSelectionSection;
            self.curRow = defaultSelectionRow;
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:defaultSelectionRow inSection:defaultSelectionSection];
            [self.tbView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
            
        }
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.keys = nil;
    self.cities = nil;
    self.checkImgView = nil;
    self.tbView = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [keys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *key = [keys objectAtIndex:section];  
    NSArray *citySection = [cities objectForKey:key];
    return [citySection count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    NSString *key = [keys objectAtIndex:indexPath.section];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
//        cell.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    } else {
        /*
        for (UIView *view in cell.contentView.subviews) {
            if (view.tag == CHECK_TAG) {
                if (indexPath.section != curSection || indexPath.row != curRow)
                    checkImgView.hidden = true;
                else
                    checkImgView.hidden = false;
            }
        }*/
    }
    
    // Configure the cell...
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    cell.textLabel.text = [[cities objectForKey:key] objectAtIndex:indexPath.row];
    
    if (indexPath.section == curSection && indexPath.row == curRow)
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{  
    NSString *key = [keys objectAtIndex:section];  
    return key;  
}  

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView  
{  
    return keys;  
} 


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    
    NSString *key = [keys objectAtIndex:indexPath.section];
    _passHomePage.cityName = [[cities objectForKey:key] objectAtIndex:indexPath.row];
    
    [self.navigationController popToViewController:_passHomePage animated:YES];
}


@end
