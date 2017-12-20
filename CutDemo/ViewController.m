//
//  ViewController.m
//  CutDemo
//
//  Created by 小白 on 16/8/19.
//  Copyright © 2016年 小白. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>
{
    UILabel *_textL;
    UITextView * _tv;
}

@property(nonatomic,strong)UIPasteboard * pasteboard;
@end

@implementation ViewController
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleDefault;
//    
//}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack; //状态栏字体白色
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
    //方法1：
     //自定义label
    
    //方法2:
    _textL = [[UILabel alloc] initWithFrame:CGRectMake(40, 40, 200, 100)];
    _textL.backgroundColor = [UIColor grayColor];
    _textL.userInteractionEnabled = YES;
    
    _textL.text = @"14rfaetagwdsaf";
    [self.view addSubview:_textL];

    self.pasteboard = [UIPasteboard generalPasteboard];
    UILongPressGestureRecognizer *longGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longHandle:)];
    [_textL addGestureRecognizer:longGR];
    
    _tv = [[UITextView alloc] initWithFrame:CGRectMake(40, 150, 200, 400)];
    _tv.backgroundColor = [UIColor grayColor];
    _tv.editable = YES;
    _tv.delegate = self;
    _tv.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_tv];
}

- (void)longHandle:(UILongPressGestureRecognizer *)sender
{
    
    if (sender.state == UIGestureRecognizerStateBegan)
    {
        [_textL becomeFirstResponder];
        
        UIMenuController * menuC = [UIMenuController sharedMenuController];
        //copy
        UIMenuItem * copyLink = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyToPasteboard:)];
        //cut
        UIMenuItem * cutLink = [[UIMenuItem alloc] initWithTitle:@"剪切" action:@selector(cutToPasteboard:)];
        
        UIMenuItem * pasteLink = [[UIMenuItem alloc] initWithTitle:@"粘贴" action:@selector(pasteToPasteboard:)];
        
        [menuC setMenuItems:@[copyLink,cutLink,pasteLink]];
        [menuC setTargetRect:_textL.frame inView:_textL.superview];
        [menuC setMenuVisible:YES animated:YES];
        
        
    }
}

//复制
- (void)copyToPasteboard:(id)sender
{
    if (_textL.text != nil)
    {
        _pasteboard.string = _textL.text;
    }
    else return;
}

//剪切
- (void)cutToPasteboard:(id)sender
{
    if (_textL.text != nil)
    {
        
//        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        _pasteboard.string = _textL.text;
        _textL.text = nil;
    }
    else return;
}

//粘贴
- (void)pasteToPasteboard:(id)sender
{
    _textL.text = self.pasteboard.string;
}
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(copyToPasteboard:))
    {
        return YES;
    }
    if (action == @selector(cutToPasteboard:))
    {
        return YES;
    }
    if (action == @selector(pasteToPasteboard:))
    {
        return YES;
    }
    return NO;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        //在这里写当你点击回车键时执行的事件
        [_tv resignFirstResponder];//关闭键盘
        return NO;
    }
    return YES;
}
-(void)creatBGview:(UIView *)bgView withImg:(NSString *)img
{
    //    bgView.frame = CGRectMake(0, bgView.top, SCREEN_WIDTH , bgView.height);
    //    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bgView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(200, 200)];
    //    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    //    maskLayer.frame = bgView.bounds;
    //    maskLayer.path = maskPath.CGPath;
    //    bgView.layer.mask = maskLayer;
    //    其中，byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight
    //    指定了需要成为圆角的角。该参数是UIRectCorner类型的，可选的值有：
    //    UIRectCornerTopLeft
    //    UIRectCornerTopRight
    //    UIRectCornerBottomLeft
    //    UIRectCornerBottomRight
    //    UIRectCornerAllCorners
    
    //    //创建出CAShapeLayer
    //    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    //    shapeLayer.frame = CGRectMake(0, 0, SCREEN_WIDTH * 1.5f, 175);//设置shapeLayer的尺寸和位置
    //    shapeLayer.position = bgView.center;
    ////    shapeLayer.fillColor = [UIColor clearColor].CGColor;//填充颜色为ClearColor
    //    shapeLayer.fillColor = (__bridge CGColorRef _Nullable)([UIColor colorWithPatternImage:[UIImage imageNamed:img]]);
    //
    //    shapeLayer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor colorWithPatternImage:[UIImage imageNamed:img]]);
    //
    //    //设置线条的宽度和颜色
    //    shapeLayer.lineWidth = 1.0f;
    //    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    //
    //    //创建出圆形贝塞尔曲线
    //    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, SCREEN_WIDTH * 1.5f, 175)];
    //
    //    //让贝塞尔曲线与CAShapeLayer产生联系
    //    shapeLayer.path = circlePath.CGPath;
    //    
    //    //添加并显示
    //    [bgView.layer addSublayer:shapeLayer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
