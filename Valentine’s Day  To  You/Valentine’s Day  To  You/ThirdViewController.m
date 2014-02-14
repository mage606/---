//
//  ThirdViewController.m
//  Valentine’s Day  To  You
//
//  Created by yons on 14-2-13.
//  Copyright (c) 2014年 yons. All rights reserved.
//

#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController
{
    UIWebView *webView2;
    UIWebView *webView1;
    UIWebView *webView3;
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
    CGRect frame2 = CGRectMake(0, 250, 320, 480);
    frame2.size = [UIImage imageNamed:@"13.gif"].size;
    // 读取gif图片数据
    NSData *gif2 = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"13" ofType:@"gif"]];
    // view生成
    webView2 = [[UIWebView alloc] initWithFrame:frame2];
    webView2.userInteractionEnabled = NO;//用户不可交互
    [webView2 loadData:gif2 MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView2];
    
    CGRect frame1 = CGRectMake(150, 250, 320, 480);
    frame1.size = [UIImage imageNamed:@"11.gif"].size;
    // 读取gif图片数据
    NSData *gif = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"11" ofType:@"gif"]];
    // view生成
    webView1 = [[UIWebView alloc] initWithFrame:frame1];
    webView1.userInteractionEnabled = NO;//用户不可交互
    [webView1 loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView1];
    
    [self playAV];
    [self readyGo];
    
    CGRect frame3 = CGRectMake(-150, 0, 320, 480);
    frame3.size = [UIImage imageNamed:@"15.gif"].size;
    // 读取gif图片数据
    NSData *gif3 = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"15" ofType:@"gif"]];
    // view生成
    webView3 = [[UIWebView alloc] initWithFrame:frame3];
    webView3.userInteractionEnabled = NO;//用户不可交互
    [webView3 loadData:gif3 MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView3];
    
    [self readyGo];
}

-(void)playAV
{
    NSString *str=@"一切的一切都在改变，唯有对你的思念不变";
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
    [UIView animateWithDuration:3 animations:^{
        webView1.frame=CGRectMake(-150, 250, 320, 480);
        webView2.frame=CGRectMake(-200, 250, 320, 480);
    }];
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(readyGo1) userInfo:nil repeats:NO];
}

-(void)readyGo1
{
    FourthViewController *fvc=[[FourthViewController alloc]init];
    [self presentViewController:fvc animated:NO completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
