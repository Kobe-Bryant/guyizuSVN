//
//  messageModel.h
//  谷蚁族
//
//  Created by lanye on 13-12-30.
//  Copyright (c) 2013年 蓝叶软件. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface messageModel : NSObject

@property (strong,nonatomic) NSString *addtime;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *sid;
@property (strong,nonatomic) NSString *thumb;
@property (strong,nonatomic) NSString *pageviews;
@property (strong,nonatomic) NSString *content;


@property (strong,nonatomic) NSString *taskaddtime;
@property (strong,nonatomic) NSString *taskname;
@property (strong,nonatomic) NSString *taskdistance;
@property (strong,nonatomic) NSString *taskfinish_time;
@property (strong,nonatomic) NSString *taskstatus;
@property (strong,nonatomic) NSString *task_type;
@property (strong,nonatomic) NSString *taskthumb;
@property (strong,nonatomic) NSString *taskguestbooks;
@property (strong,nonatomic) NSString *taskc_apply_num;
@property (strong,nonatomic) NSString *taskc_price;

@end
