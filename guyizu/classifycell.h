//
//  classifycell.h
//  Mycollection
//
//  Created by lanye on 13-12-2.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface classifycell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIView *backview;

@property (strong, nonatomic) IBOutlet UILabel *addtime;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UIImageView *thumb;
@property (strong, nonatomic) IBOutlet UILabel *pageviews;

@property (strong, nonatomic) IBOutlet UILabel *content;

@end
