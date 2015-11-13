//
//  ZhuceViewController.h
//  Test-denglu
//
//  Created by lanye on 13-11-26.
//  Copyright (c) 2013年 lanye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHYHTTPRequest.h"

@interface ZhuceViewController : UIViewController<UITextFieldDelegate, LHYHTTPRequestProtocol>
{
    UITextField *usertext;
    UITextField *settext;
    UITextField *suretext;
    UITextField *emailtext;
    UITextField *phonetext;
    
     UIView *_userview;
     UIView *_setview;
     UIView *_sureview;
     UIView *_emailview;
     UIView *_phoneview;
    
    NSInteger _height;
    NSInteger _tapCount;
    
    LHYHTTPRequest *dengluRequest;

}
@property (strong, nonatomic) IBOutlet UIView *userview;
@property (strong, nonatomic) IBOutlet UIView *setview;
@property (strong, nonatomic) IBOutlet UIView *sureview;
@property (strong, nonatomic) IBOutlet UIView *emailview;
@property (strong, nonatomic) IBOutlet UIView *phoneview;
@property (strong, nonatomic) IBOutlet UIScrollView *backscroll;



- (IBAction)zhuce:(id)sender;


@end
