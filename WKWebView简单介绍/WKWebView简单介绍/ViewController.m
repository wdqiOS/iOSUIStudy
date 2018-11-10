//
//  ViewController.m
//  WKWebView简单介绍
//
//  Created by 汪大强 on 2018/9/27.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WKWebView.h>

@interface ViewController ()
/** WKWebView */
@property(nonatomic, strong) WKWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}


@end
