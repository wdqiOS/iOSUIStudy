//
//  ViewController.m
//  UIWebView应用
//
//  Created by 汪大强 on 2018/9/27.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *goBack;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *goForward;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 加载网页
    [self.webView loadRequest:request];
    
    // 设置代理
    self.webView.delegate = self;
    
}
- (IBAction)gobackBtnClick:(id)sender {
    [self.webView goBack];
}

- (IBAction)goForwardBtnClick:(id)sender {
    [self.webView goForward];
}

- (IBAction)reloadBtnClick:(id)sender {
    [self.webView reload];
}

#pragma mark --------------------
#pragma mark - UIWebViewDelegate
// 即将加载某个请求的时候调用
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSLog(@"----- %@", request.URL.absoluteString);
    
    NSString *strM = request.URL.absoluteString;
    if ([strM containsString:@"newspage"]) {
        return NO;
    }

    return YES;
}

// 开始加载网页的时候调用
-(void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"%s", __func__);
}

// 加载完成的时候调用
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"%s", __func__);
    
    self.goBack.enabled = self.webView.canGoBack;
    self.goForward.enabled = self.webView.canGoForward;
}

// 加载失败的时候调用
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"%s", __func__);
}



@end
