//
//  SegmentedControl.m
//  shangmianDanli
//
//  Created by lanyes on 12/5/13.
//  Copyright (c) 2013 蓝叶软件. All rights reserved.
//

#import "SegmentedControl.h"

@implementation SegmentedControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:nil forControlEvents:UIControlEventValueChanged];
       
    }
    return self;
}

+(SegmentedControl *)shareSegmentdCtl{
 static SegmentedControl *shareSegmentdCtll = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareSegmentdCtll = [[SegmentedControl alloc]initWithItems:@[@"待选定",@"任务中",@"已结束"]];
        shareSegmentdCtll.frame = CGRectMake(10, 15, 300, 29);
        shareSegmentdCtll.tintColor = [UIColor colorWithRed:0/255.0 green:160/255.0 blue:211/255.0 alpha:1.0];

    });
    return shareSegmentdCtll;
}
//-(void)mSlect:(id)send
//{
//    
//    UISegmentedControl *seg=(UISegmentedControl *)send;
//    switch (seg.selectedSegmentIndex) {
//        case 0:
//            use.myAppCtl.endedtable.hidden = YES;
//            use.myAppCtl.applyingtable.hidden = NO;
//            use.myAppCtl.taskingtable.hidden = YES;
////                       if (seg.superview.tag ==602) {
////                       
////                        }
//            break;
//        case 1:
//            use.myAppCtl.applyingtable.hidden = YES;
//            use.myAppCtl.taskingtable.hidden = NO;
//            use.myAppCtl.endedtable.hidden = YES;
////                        if (seg.superview.tag ==601 || seg.superview.tag ==602) {
////                            [self.navigationController popToViewController:self animated:YES];
////                        }
//            break;
//        case 2:
//            use.myAppCtl.applyingtable.hidden = YES;
//            use.myAppCtl.taskingtable.hidden = YES;
//            use.myAppCtl.endedtable.hidden = NO;
//            //            if (seg.superview.tag ==601) {
//            //                [self.navigationController popToViewController:self animated:YES];
//            //            }
//            break;
//        default:
//            break;
//    }
//}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


@end

