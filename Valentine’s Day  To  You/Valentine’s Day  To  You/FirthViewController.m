//
//  FirthViewController.m
//  Valentine’s Day  To  You
//
//  Created by yons on 14-2-13.
//  Copyright (c) 2014年 yons. All rights reserved.
//

#import "FirthViewController.h"
#import "SixthViewController.h"

@interface FirthViewController ()

@end

@implementation FirthViewController
{
    UIWebView *webView1;
}
@synthesize languageLabel;

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
    CGRect frame1 = CGRectMake(-5, 250, 320, 480);
    frame1.size = [UIImage imageNamed:@"20.gif"].size;
    // 读取gif图片数据
    NSData *gif = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"20" ofType:@"gif"]];
    // view生成
    webView1 = [[UIWebView alloc] initWithFrame:frame1];
    webView1.userInteractionEnabled = NO;//用户不可交互
    [webView1 loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView1];
    
    [self playAV];
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(readyGo) userInfo:nil repeats:NO];
}

-(void)playAV
{
    NSString *str=@"时光老去，岁月荏苒，花样年华，过隙白驹，我想起了夕阳下的奔跑，那是我们逝去的青春";
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
    CGRect frame1 = CGRectMake(150, 150, 320, 480);
    frame1.size = [UIImage imageNamed:@"19.gif"].size;
    // 读取gif图片数据
    NSData *gif = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"19" ofType:@"gif"]];
    // view生成
    webView1 = [[UIWebView alloc] initWithFrame:frame1];
    webView1.userInteractionEnabled = NO;//用户不可交互
    [webView1 loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView1];
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(readyGo1) userInfo:nil repeats:NO];
}

-(void)readyGo1
{
    SixthViewController *svc=[[SixthViewController alloc]init];
    [self presentViewController:svc animated:NO completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
