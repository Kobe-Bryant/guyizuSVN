//
//  classifycell.m
//  Mycollection
//
//  Created by lanye on 13-12-2.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import "classifycell.h"

@implementation classifycell

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
    self.backgroundView.frame = CGRectMake(0, 0, 300, 115);
    self.contentView.frame =CGRectMake(0, 0, 300, 300);
    self.selectedBackgroundView.frame = CGRectMake(0, 0, 300, 115);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
