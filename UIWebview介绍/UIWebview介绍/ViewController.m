//
//  ViewController.m
//  UIWebview介绍
//
//  Created by 汪大强 on 2018/9/27.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test4];
}

-(void)test1 {
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

-(void)test2 {
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(40, 0, 0, 0);
}

-(void)test3 {
    NSURL *url = [NSURL fileURLWithPath:@"/Users/wangdaqiang/Desktop/Day2/ppt/01-UI控件概览.pptx"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    self.webView.scalesPageToFit = true;
}

-(void)test4 {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"text.html" withExtension:nil];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    // 数据识别
    self.webView.dataDetectorTypes = UIDataDetectorTypeAll;
}

@end
