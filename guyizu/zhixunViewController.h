//
//  zhixunViewController.h
//  zhixun
//
//  Created by lanye on 13-11-29.
//  Copyright (c) 2013年 lanyes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHYHTTPRequest.h"
@interface zhixunViewController : UIViewController<UITextViewDelegate,UIAlertViewDelegate,LHYHTTPRequestProtocol>
{
    UIView *_backview;
    UITextView *_liuyantextview;
    UILabel *_liuyanlable;
}

@property int sid;
@property (strong, nonatomic) IBOutlet UIView *backview;
@property (strong, nonatomic) IBOutlet UITextView *liuyantextview;
@property (strong, nonatomic) IBOutlet UILabel *liuyanlable;

- (IBAction)leavemessage:(id)sender;


@end
