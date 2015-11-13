//
//  MyCollectionCell.m
//  谷蚁族
//
//  Created by Macsyf on 13-12-27.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import "MyCollectionCell.h"

@implementation MyCollectionCell
@synthesize lable;
- (id)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}
-(void)show:(NSString*)name
{
    self.backgroundColor=[UIColor whiteColor];
    lable=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, name.length*16, 20)];
    lable.textAlignment=NSTextAlignmentCenter;
    lable.font=[UIFont systemFontOfSize:12];
    lable.text=name;
    lable.textColor=[UIColor blackColor];
    lable.backgroundColor=[UIColor clearColor];
    [self.contentView addSubview:lable];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
