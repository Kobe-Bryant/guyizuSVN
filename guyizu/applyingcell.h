//
//  applyingcell.h
//  Publishingtask
//
//  Created by lanye on 13-12-3.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface applyingcell : UITableViewCell


@property (strong, nonatomic) IBOutlet UIButton *xiugai;
@property (strong, nonatomic) IBOutlet UIButton *cancel;
@property (strong, nonatomic) IBOutlet UIButton *dele;

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *c_price;
@property (strong, nonatomic) IBOutlet UILabel *finish_time;
@property (strong, nonatomic) IBOutlet UIImageView *thumb;


@property (strong, nonatomic) IBOutlet UIView *imagebackview;


@end
