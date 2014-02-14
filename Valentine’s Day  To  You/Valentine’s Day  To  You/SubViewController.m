//
//  SubViewController.m
//  Valentine’s Day  To  You
//
//  Created by yons on 14-2-13.
//  Copyright (c) 2014年 yons. All rights reserved.
//

#import "SubViewController.h"
#import "ThirdViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController
{
    UIWebView *webView1;
    UIWebView *webView2;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CGRect frame1 = CGRectMake(-50, 50, 320, 480);
    frame1.size = [UIImage imageNamed:@"10.gif"].size;
    // 读取gif图片数据
    NSData *gif1 = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"10" ofType:@"gif"]];
    // view生成
    webView1 = [[UIWebView alloc] initWithFrame:frame1];
    webView1.userInteractionEnabled = NO;//用户不可交互
    [webView1 loadData:gif1 MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView1];
    
    CGRect frame2 = CGRectMake(50, 250, 320, 480);
    frame2.size = [UIImage imageNamed:@"6.gif"].size;
    // 读取gif图片数据
    NSData *gif2 = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"6" ofType:@"gif"]];
    // view生成
    webView2 = [[UIWebView alloc] initWithFrame:frame2];
    webView2.userInteractionEnabled = NO;//用户不可交互
    [webView2 loadData:gif2 MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView2];
    
    [self playAV];
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(readyGo) userInfo:nil repeats:NO];
}

-(void)playAV
{
    NSString *str=@"妈的，还有谁";
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Language" ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i=0; i<[dictionary count]; i++) {
            NSDictionary *dic = [dictionary objectForKey:[NSString stringWithFormat:@"%d",i]];
            AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:[dic objectForKey:@"local"]];
            AVSpeechSynthesizer *av = [[AVSpeechSynthesizer alloc]init];
            AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:str];
            utterance.voice = voice;
            utterance.rate *= 0.7;
            [av speakUtterance:utterance];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.languageLabel.text = [dic objectForKey:@"name"];
            });
            [NSThread sleepForTimeInterval:3];
        }
    });
}

-(void)readyGo
{
    [webView2 removeFromSuperview];
    CGRect frame2 = CGRectMake(50, 250, 320, 480);
    frame2.size = [UIImage imageNamed:@"9.gif"].size;
    // 读取gif图片数据
    NSData *gif2 = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"9" ofType:@"gif"]];
    // view生成
    webView2 = [[UIWebView alloc] initWithFrame:frame2];
    webView2.userInteractionEnabled = NO;//用户不可交互
    [webView2 loadData:gif2 MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView2];
    
    [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(readyGo1) userInfo:nil repeats:NO];
}

-(void)readyGo1
{
    [webView2 removeFromSuperview];
    CGRect frame2 = CGRectMake(50, 250, 320, 480);
    frame2.size = [UIImage imageNamed:@"12.gif"].size;
    // 读取gif图片数据
    NSData *gif2 = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"12" ofType:@"gif"]];
    // view生成
    webView2 = [[UIWebView alloc] initWithFrame:frame2];
    webView2.userInteractionEnabled = NO;//用户不可交互
    [webView2 loadData:gif2 MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView2];
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(readyGo2) userInfo:nil repeats:NO];
}

-(void)readyGo2
{
    ThirdViewController *tvc=[[ThirdViewController alloc]init];
    [self presentViewController:tvc animated:NO completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
