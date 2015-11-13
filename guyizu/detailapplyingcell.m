//
//  detailapplyingcell.m
//  Publishingtask
//
//  Created by lanye on 13-12-3.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "detailapplyingcell.h"

@implementation detailapplyingcell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    self.backgroundView.frame = CGRectMake(0, 0, 300, 100);
    self.contentView.frame =CGRectMake(0, 0, 300, 100);
    self.selectedBackgroundView.frame = CGRectMake(0, 0, 300, 100);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
