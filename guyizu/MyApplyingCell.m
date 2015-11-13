//
//  MyApplyingCell.m
//  MyApplying
//
//  Created by lanye on 13-12-5.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "MyApplyingCell.h"

@implementation MyApplyingCell

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
    self.backgroundView.frame = CGRectMake(0, 0, 300, 144);
    self.contentView.frame = CGRectMake(0, 0, 300, 144);
    self.selectedBackgroundView.frame = CGRectMake(0, 0, 300, 144);
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
