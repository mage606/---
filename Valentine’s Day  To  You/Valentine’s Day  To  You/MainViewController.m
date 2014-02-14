//
//  MainViewController.m
//  Valentine’s Day  To  You
//
//  Created by yons on 14-2-12.
//  Copyright (c) 2014年 yons. All rights reserved.
//

#import "MainViewController.h"
#import "SubViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
{
    UIWebView *webView;
    UIWebView *webView1;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView
{
    [super loadView];
    CGRect frame = CGRectMake(-150, 240, 320, 480);
    frame.size = [UIImage imageNamed:@"2.gif"].size;
    // 读取gif图片数据
    NSData *gif = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"2" ofType:@"gif"]];
    // view生成
    webView = [[UIWebView alloc] initWithFrame:frame];
    webView.backgroundColor=[UIColor clearColor];
    webView.userInteractionEnabled = NO;//用户不可交互
    [webView loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView];
    [NSTimer scheduledTimerWithTimeInterval:1 invocation:nil repeats:NO];
    [self readyGo];
}

-(void)playAV
{
    NSString *str=@"我就是我，是颜色不一样的烟火，天空海阔，没有你，一切都是泡沫";
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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    UIImageView *iv=[[UIImageView alloc]initWithFrame:self.view.frame];
//    iv.image=[UIImage imageNamed:@"1.jpg"];
//    [self.view addSubview:iv];
    
    CGRect frame1 = CGRectMake(60, 0, 320, 480);
    frame1.size = [UIImage imageNamed:@"3.gif"].size;
    // 读取gif图片数据
    NSData *gif1 = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"3" ofType:@"gif"]];
    // view生成
    webView1 = [[UIWebView alloc] initWithFrame:frame1];
    webView1.userInteractionEnabled = NO;//用户不可交互
    [webView1 loadData:gif1 MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView1];
}

-(void)readyGo
{
    [UIView animateWithDuration:10 animations:^{
       CGPoint rtPoint1=CGPointMake(0, 240);
       webView.frame=CGRectMake(rtPoint1.x, rtPoint1.y, 320, 4000);
    }];
//    CGPoint rtPoint1=CGPointMake(0, 240);
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    webView.frame=CGRectMake(rtPoint1.x, rtPoint1.y, 320, 480);
//    [UIView setAnimationDuration:20];
//    [UIView setAnimationDelay:2];
//    [UIView commitAnimations];
    [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(readyGo1) userInfo:nil repeats:NO];
}

-(void)readyGo1
{
    [webView1 removeFromSuperview];
    [webView removeFromSuperview];
    
    CGRect frame2 = CGRectMake(-30, 20, 320, 480);
    frame2.size = [UIImage imageNamed:@"8.gif"].size;
    // 读取gif图片数据
    NSData *gif2 = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"8" ofType:@"gif"]];
    // view生成
    UIWebView *webView2 = [[UIWebView alloc] initWithFrame:frame2];
    webView2.userInteractionEnabled = NO;//用户不可交互
    [webView2 loadData:gif2 MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView2];
    
    CGRect frame1 = CGRectMake(0, 250, 320, 480);
    frame1.size = [UIImage imageNamed:@"4.gif"].size;
    // 读取gif图片数据
    NSData *gif1 = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"4" ofType:@"gif"]];
    // view生成
    webView1 = [[UIWebView alloc] initWithFrame:frame1];
    webView1.userInteractionEnabled = NO;//用户不可交互
    [webView1 loadData:gif1 MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView1];
    
    [self playAV];
    
    CGRect frame = CGRectMake(150, 260, 320, 480);
    frame.size = [UIImage imageNamed:@"5.gif"].size;
    // 读取gif图片数据
    NSData *gif = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"5" ofType:@"gif"]];
    // view生成
    webView = [[UIWebView alloc] initWithFrame:frame];
    webView.backgroundColor=[UIColor clearColor];
    webView.userInteractionEnabled = NO;//用户不可交互
    [webView loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView];
    
    [NSTimer scheduledTimerWithTimeInterval:8 target:self selector:@selector(readyGo2) userInfo:nil repeats:NO];
}

-(void)readyGo2
{
    SubViewController *svc=[[SubViewController alloc]init];
    svc.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self presentViewController:svc animated:NO completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
