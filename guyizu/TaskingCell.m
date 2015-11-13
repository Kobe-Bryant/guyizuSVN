//
//  TaskingCell.m
//  MyApplying
//
//  Created by lanye on 13-12-5.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "TaskingCell.h"

@implementation TaskingCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)layoutSubviews
{
    self.backgroundView.frame = CGRectMake(0, 0, 300, 117);
    self.contentView.frame = CGRectMake(0, 0, 300, 117);
    self.selectedBackgroundView.frame = CGRectMake(0, 0, 300, 117);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
