//
//  cell.h
//  Classinfo
//
//  Created by lanye on 13-11-30.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassInfocell : UITableViewCell


@property (strong, nonatomic) IBOutlet UIButton *modifybtn;
@property (strong, nonatomic) IBOutlet UIButton *cancelbtn;
@property (strong, nonatomic) IBOutlet UIButton *delebtn;

@property (strong, nonatomic) IBOutlet UILabel *pageCount;
@property (strong, nonatomic) IBOutlet UILabel *addTime;

@property (strong, nonatomic) IBOutlet UILabel *content;
@property (strong, nonatomic) IBOutlet UILabel *titleName;

@property (strong, nonatomic) IBOutlet UIImageView *thumbImage;

@property (strong, nonatomic) IBOutlet UIView *backview;

@property (strong,nonatomic) NSMutableArray *arry;

@end
