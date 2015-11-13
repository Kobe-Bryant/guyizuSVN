



#import <QuartzCore/QuartzCore.h>
#import "MessageListViewController.h"
#import "RegexKitLite.h"
#import "SCGIFImageView.h"
#import "CustomLongPressGestureRecognizer.h"
#import "AppDelegate.h"
#import "UIImageView+WebCache.h"

#define HTTP_URL @"http://www.guyizu.com/member.php?act=login_in&meth=member_msg_content"
#define SEND_URL @"http://www.guyizu.com/member.php?act=login_in&meth=member_msg_reply"

@interface MessageListViewController ()
{
    NSMutableArray *_picutreArry;
    NSMutableArray *_timeArry;
    NSMutableString *rec_image;
    NSMutableString *send_image;
    
    NSMutableArray *send_uid;
    NSMutableArray *rec_uid;
    NSMutableString *m_uid;
}
@end

@implementation MessageListViewController
@synthesize ui_tableView;
@synthesize ui_imageView;
@synthesize ui_textField;
@synthesize ui_sendButton;


- (void)moveInputBarWithKeyboardHeight:(float)keyboardHeight withDuration:(NSTimeInterval)animationDuration
{
    
    AppDelegate *thatApp = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSInteger tableHeight;
    if (thatApp.isIphone4) {
        tableHeight = 470 - 88;
    }else{
        tableHeight = 470;
    }
    [UIView animateWithDuration:animationDuration delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            
//        self.view.frame = CGRectMake(0, 0, 320, 568 - keyboardHeight);
        self.ui_tableView.frame = CGRectMake(0, 0, 320, tableHeight - keyboardHeight);
        self.ui_textField.frame = CGRectMake(self.ui_textField.frame.origin.x, tableHeight - keyboardHeight, self.ui_textField.frame.size.width, self.ui_textField.frame.size.height);
        
        [self.ui_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.m_textArray count] - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    } completion:^(BOOL finished) {
    }];

}

- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    [self moveInputBarWithKeyboardHeight:keyboardRect.size.height withDuration:animationDuration];
    
    
    
}
- (void)keyboardWillHide:(NSNotification *)notification {
    NSDictionary* userInfo = [notification userInfo];
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    [self moveInputBarWithKeyboardHeight: 0 withDuration:animationDuration];
}

#pragma mark -

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _mSendUid = [[NSMutableString alloc]initWithCapacity:0];
        _timeArry = [[NSMutableArray alloc]initWithCapacity:0];
        rec_image = [[NSMutableString alloc]initWithCapacity:0];
        send_image = [[NSMutableString alloc]initWithCapacity:0];
        send_uid = [[NSMutableArray alloc]initWithCapacity:0];
        rec_uid = [[NSMutableArray alloc]initWithCapacity:0];
        m_uid = [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //Mr Li
    self.ui_tableView.bounces = YES;
//    self.ui_tableView.backgroundView = nil;
    self.ui_tableView.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0];
 
    
    //构建nav
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 11, 20);
    [leftbutton addTarget:self action:@selector(mleftBarBttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"咨询留言"];
    [customLab setTextAlignment:NSTextAlignmentCenter];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;

    
    //发起连接请求
    NSString *uid = [[NSUserDefaults standardUserDefaults]objectForKey:@"uid"];
    NSString *str = [HTTP_URL stringByAppendingFormat:@"&uid=%@&senduid=%@", uid, _mSendUid];
    LHYHTTPRequest *lhySend = [[LHYHTTPRequest alloc]initWith:str];
    lhySend.delegate = self;
    
    //点击事件
    UITapGestureRecognizer *tableTapGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapshouldReturn)];
    [self.ui_tableView addGestureRecognizer:tableTapGest];
    
    
    
    
    
    self.m_textArray = [NSMutableArray array];
//    [self.m_textArray addObject:[CustomMethod escapedString:@"能不能把地址写的再详细点啊？"]];
//    [self.m_textArray addObject:[CustomMethod escapedString:@"哥们"]];
//    [self.m_textArray addObject:[CustomMethod escapedString:@"好的"]];
//    [self.m_textArray addObject:[CustomMethod escapedString:@"红岭南国大厦 "]];
//    [self.m_textArray addObject:[CustomMethod escapedString:@"收到"]];
//    [self.m_textArray addObject:[CustomMethod escapedString:@"测试http://lanyes.com"]];
//    [self.m_textArray addObject:[CustomMethod escapedString:@"测试0755-82438858"]];
    
//    NSArray *wk_paceImageNumArray = [[NSArray alloc]initWithObjects:@"emoji_0.png",@"emoji_1.png",@"emoji_2.png",@"emoji_3.png",@"emoji_4.png",@"emoji_5.png",@"emoji_6.png",@"emoji_7.png",@"emoji_8.png",@"emoji_9.png",@"emoji_10.png",@"emoji_11.png", nil];
//    NSArray *wk_paceImageNameArray = [[NSArray alloc]initWithObjects:@"[大笑]",@"[难过]",@"[伤心]",@"[尴尬]",@"[疑惑]",@"[喜欢]",@"[期待]",@"[呆萌]",@"[惊讶]",@"[生气]",@"[害羞]",@"[开心]", nil];
//    self.m_emojiDic = [[NSDictionary alloc] initWithObjects:wk_paceImageNumArray forKeys:wk_paceImageNameArray];
    
    self.m_labelArray = [NSMutableArray array];
    self.m_rowHeights = [NSMutableArray array];
    
    
}

#pragma mark -
#pragma mark leftButtonClick

-(void)mleftBarBttonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark DownloadOver

-(void)returnJsonDic:(id)send And:(id)mLHYHTTPRequest{
    if ([[[send objectForKey:@"status"] stringValue] isEqualToString:@"0"]) {
        return;
    }
    
    
    [self.m_textArray removeAllObjects];
    [_picutreArry removeAllObjects];
    [send_uid removeAllObjects];
    [rec_uid removeAllObjects];
    

    NSArray *arr1 = [send objectForKey:@"data"];
    for (NSInteger i = [arr1 count] -1 ; i >= 0 ; --i) {
        NSDictionary *obj = [arr1 objectAtIndex:i];
        NSString *contentStr = [obj objectForKey:@"content"];
        [self.m_textArray addObject:contentStr];
        NSString *timeStr = [obj objectForKey:@"posttime"];
        [_timeArry addObject:timeStr];
        NSString *recUid = [obj objectForKey:@"recvuid"];
        [rec_uid addObject:recUid];
        NSString *sendUid = [obj objectForKey:@"senduid"];
        [send_uid addObject:sendUid];
        
        [rec_image setString:[obj objectForKey:@"rec_thumb"]];
        [send_image setString:[obj objectForKey:@"send_thumb"]];
    }
    
    [self creatLabelArray];
    [self.ui_tableView reloadData];
    
    [self.ui_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.m_textArray count] - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}


#pragma mark -

- (IBAction)onSendButton:(id)sender
{
    if (self.ui_textField.text == nil || [self.ui_textField.text isEqualToString:@""]) {
        UIAlertView *ui_alertView =[[UIAlertView alloc]initWithTitle:@"不能发送空消息" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [ui_alertView show];
    }else{
        [self.m_textArray addObject:[CustomMethod escapedString:self.ui_textField.text]];
        
        NSString *timeStr = @"123";
        [_timeArry addObject:timeStr];
        [send_uid addObject:m_uid];
        
        //startLHY
        NSString *sendStr = [SEND_URL stringByAppendingFormat:@"&uid=%@&recvuid=%@&content=%@", m_uid, self.mSendUid, self.ui_textField.text];
//        NSLog(@"%@", sendStr);
        LHYHTTPRequest *fasongSend = [[LHYHTTPRequest alloc]initWith:sendStr];
        
        self.ui_textField.text = @"";
    }
    
    [self creatLabelArray];
    [self.ui_tableView reloadData];
    [self.ui_textField resignFirstResponder];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)creatLabelArray
{
    
    if (self.m_labelArray.count > 0) {
        [self.m_labelArray removeAllObjects];
    }
    if (self.m_rowHeights.count > 0) {
        [self.m_rowHeights removeAllObjects];
    }
    for (int i = 0; i < [self.m_textArray count]; i++) {
#warning 家校需要提取的地方
        OHAttributedLabel *label = [[OHAttributedLabel alloc] initWithFrame:CGRectZero];
        NSString *text = [self.m_textArray objectAtIndex:i];
        [self creatAttributedLabel:text Label:label];
        NSNumber *heightNum = [[NSNumber alloc] initWithFloat:label.frame.size.height];
        [self.m_labelArray addObject:label];
        [CustomMethod drawImage:label];
        [self.m_rowHeights addObject:heightNum];
    }
}

#warning 家校需要提取的地方
- (void)creatAttributedLabel:(NSString *)o_text Label:(OHAttributedLabel *)label
{
    [label setNeedsDisplay];
    NSMutableArray *httpArr = [CustomMethod addHttpArr:o_text];
    NSMutableArray *phoneNumArr = [CustomMethod addPhoneNumArr:o_text];
    NSMutableArray *emailArr = [CustomMethod addEmailArr:o_text];
    
    NSString *text = [CustomMethod transformString:o_text emojiDic:self.m_emojiDic];
    text = [NSString stringWithFormat:@"<font color='black' strokeColor='gray' face='Palatino-Roman'>%@",text];
    
    MarkupParser *wk_markupParser = [[MarkupParser alloc] init];
    NSMutableAttributedString* attString = [wk_markupParser attrStringFromMarkup: text];
    [attString setFont:[UIFont systemFontOfSize:16]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setAttString:attString withImages:wk_markupParser.images];
    
    NSString *string = attString.string;
    
    if ([emailArr count]) {
        for (NSString *emailStr in emailArr) {
            [label addCustomLink:[NSURL URLWithString:emailStr] inRange:[string rangeOfString:emailStr]];
        }
    }
    
    if ([phoneNumArr count]) {
        for (NSString *phoneNum in phoneNumArr) {
            [label addCustomLink:[NSURL URLWithString:phoneNum] inRange:[string rangeOfString:phoneNum]];
        }
    }
    
    if ([httpArr count]) {
        for (NSString *httpStr in httpArr) {
            [label addCustomLink:[NSURL URLWithString:httpStr] inRange:[string rangeOfString:httpStr]];
        }
    }

    label.delegate = self;
    CGRect labelRect = label.frame;
    labelRect.size.width = [label sizeThatFits:CGSizeMake(200, CGFLOAT_MAX)].width;
    labelRect.size.height = [label sizeThatFits:CGSizeMake(200, CGFLOAT_MAX)].height;
    label.frame = labelRect;
    label.underlineLinks = YES;//链接是否带下划线
    [label.layer display];
}

- (BOOL)attributedLabel:(OHAttributedLabel *)attributedLabel shouldFollowLink:(NSTextCheckingResult *)linkInfo
{
    NSString *requestString = [linkInfo.URL absoluteString];
    
    if ([[UIApplication sharedApplication]canOpenURL:linkInfo.URL]) {
        [[UIApplication sharedApplication]openURL:linkInfo.URL];
    }
    
    return NO;
}

#pragma mark
#pragma mark -  UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.m_textArray count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (![m_uid isEqualToString: [send_uid objectAtIndex:indexPath.row]]) {
        return([[self.m_rowHeights objectAtIndex:indexPath.row] floatValue] + 45);
    }else{
        return([[self.m_rowHeights objectAtIndex:indexPath.row] floatValue] + 25);
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"talkmessageCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        cell.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView *view = [[UIView alloc] init];
        view.tag = 1201;
        //添加背景图片imageView
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.tag = 1202;
        [view addSubview:imageView];
        

        //添加手势
        CustomLongPressGestureRecognizer *wk_longPressGestureRecognizer = [[CustomLongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [wk_longPressGestureRecognizer setMinimumPressDuration:0.5];
        [view addGestureRecognizer:wk_longPressGestureRecognizer];
        [cell.contentView addSubview:view];
        
        [cell bringSubviewToFront:view];

    }
    

    
    //重用Cell的时候移除label
    UIView *view = (UIView *)[cell viewWithTag:1201];
    view.frame = CGRectMake(20, 0, cell.contentView.frame.size.width-80, [[self.m_rowHeights objectAtIndex:indexPath.row] floatValue]+20);
    
    for (UIView *subView in [view subviews]) {
        if ([subView isKindOfClass:[OHAttributedLabel class]]) {
            [subView removeFromSuperview];
        }
    }
    
    
    NSArray *wk_labelArray = [cell.contentView subviews];
    for (int i = 0; i < wk_labelArray.count; i++) {
        if ([[wk_labelArray objectAtIndex:i] isKindOfClass:[UILabel class]]) {
            [[wk_labelArray objectAtIndex:i] removeFromSuperview];
        };
    }
    
    NSArray *wk_headButtonArray = [cell.contentView subviews];
    for (int i = 0; i < wk_headButtonArray.count; i++) {
        if ([[wk_headButtonArray objectAtIndex:i] isKindOfClass:[UIImageView class]]) {
            [[wk_headButtonArray objectAtIndex:i] removeFromSuperview];
        };
    }

    
    //时间
    NSDate *wk_currentTime = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:@"yyyy-MM-dd  HH:mm:ss"];
    NSString *timeString = [formatter stringFromDate:wk_currentTime];
    

    
    UILabel *wk_timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 300, 15)];
    wk_timeLabel.text = [_timeArry objectAtIndex:indexPath.row]; //time
    wk_timeLabel.textColor = [UIColor lightGrayColor];
    wk_timeLabel.backgroundColor = [UIColor clearColor];
    wk_timeLabel.textAlignment = NSTextAlignmentCenter;
    wk_timeLabel.font = [UIFont systemFontOfSize:12.0f];
    [cell.contentView addSubview:wk_timeLabel];
    
    UIImageView *wk_button = [[UIImageView alloc]init];
    wk_button.layer.masksToBounds = YES;
    wk_button.layer.cornerRadius = 17.0f;
    [cell.contentView addSubview:wk_button];
    

    UIImage *image;//气泡图片


   
        if (![m_uid isEqualToString: [send_uid objectAtIndex:indexPath.row]]) {
            wk_timeLabel.hidden = NO;
            [wk_button setFrame:CGRectMake(5, 19, 35, 35)];
            [wk_button setImageWithURL:[NSURL URLWithString:rec_image]];
            view.frame = CGRectMake(20, 0, cell.contentView.frame.size.width-80, [[self.m_rowHeights objectAtIndex:indexPath.row] floatValue]+40);
            image = [[UIImage imageNamed:@"message_send_box_other1.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(30, 20, 10, 20)];
        }else {
            wk_timeLabel.hidden = YES;
            [wk_button setFrame:CGRectMake(275, 2, 35, 35)];
            [wk_button setImageWithURL:[NSURL URLWithString:send_image]];
            image = [[UIImage imageNamed:@"message_send_box_self1.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(30, 20, 10, 20)];
        }
    
    

    
    [self tableView:self.ui_tableView heightForRowAtIndexPath:indexPath];
    
    UIImageView *imageView = (UIImageView *)[view viewWithTag:1202];
    imageView.image = image;
    imageView.frame = view.frame;
    
    CustomLongPressGestureRecognizer *recognizer = (CustomLongPressGestureRecognizer *)[view.gestureRecognizers objectAtIndex:0];
    //view内添加上label视图
    OHAttributedLabel *label = [self.m_labelArray objectAtIndex:indexPath.row];
    [label setCenter:view.center];
    [recognizer setLabel:label];
    
    if (![m_uid isEqualToString: [send_uid objectAtIndex:indexPath.row]]) {
        label.frame = CGRectMake(view.frame.origin.x+20, view.frame.origin.y+30, recognizer.label.frame.size.width, label.frame.size.height);
        imageView.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y+20, recognizer.label.frame.size.width+40, label.frame.size.height+20);
    }else{
        label.frame = CGRectMake(320-recognizer.label.frame.size.width-70-20, view.frame.origin.y+10, recognizer.label.frame.size.width, label.frame.size.height);
        
        imageView.frame = CGRectMake(label.frame.origin.x-20, view.frame.origin.y, recognizer.label.frame.size.width+40, label.frame.size.height+20);
    }
    
    [view addSubview:label];
    

    
    return cell;
}

#pragma mark
#pragma mark -  UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView cellForRowAtIndexPath:indexPath];
    UIView *view = [[UIView alloc] initWithFrame:cell.bounds];
    [view setTag:301];
    [view setBackgroundColor:[UIColor lightGrayColor]];
    [view setAlpha:0.5];
    [cell addSubview:view];
}



- (void)longPress:(CustomLongPressGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        currentLabel = gestureRecognizer.label;
        NSIndexPath *pressedIndexPath = [self.ui_tableView indexPathForRowAtPoint:[gestureRecognizer locationInView:self.ui_tableView]];
        currentIndexRow = pressedIndexPath.row;//长按手势在哪个Cell内
        UIAlertView *wk_alertView =  [[UIAlertView alloc] initWithTitle:@"确定复制该消息？" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [wk_alertView setTag:100];
        [wk_alertView show];
    }
}

#pragma mark
#pragma mark -  UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 100) {
        if (buttonIndex == 1) {
            NSString* o_text = [self.m_textArray objectAtIndex:currentIndexRow];//根据Cell Index 获取复制内容
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            [pasteboard setString:o_text];
        }
    }
    
}

#pragma mark UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField;
{
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self onSendButton:nil];
    [textField resignFirstResponder];
    return YES;
}

-(void)tapshouldReturn{
    
    for (UIView *obj in self.view.subviews) {
        if ([obj isKindOfClass:[UITextField class]]) {
            [obj resignFirstResponder];
        }
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField;
{
}

@end
