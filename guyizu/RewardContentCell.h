//
//  RewardContentCell.h
//  谷蚁族
//
//  Created by Macsyf on 13-12-26.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RewardContentCell : UITableViewCell
//留言；

@property (weak, nonatomic) IBOutlet UILabel *reviewsname;
@property (weak, nonatomic) IBOutlet UILabel *reviewstime;
@property (weak, nonatomic) IBOutlet UILabel *reviewscontent;

@end
