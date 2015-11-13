//
//  ReWardCell.h
//  谷蚁族
//
//  Created by Macsyf on 13-12-26.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReWardCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *isonlineimage;
@property (weak, nonatomic) IBOutlet UIImageView *thumbimage;
@property (weak, nonatomic) IBOutlet UILabel *namelable;
@property (weak, nonatomic) IBOutlet UILabel *distancelable;
@property (weak, nonatomic) IBOutlet UILabel *pricelable;
@property (weak, nonatomic) IBOutlet UILabel *finishtimelable;
@property (weak, nonatomic) IBOutlet UILabel *is_selectlable;
@property (weak, nonatomic) IBOutlet UILabel *applynumlable;
@property (weak, nonatomic) IBOutlet UILabel *reviewslable;
@property (weak, nonatomic) IBOutlet UILabel *task_typelable;

@end
