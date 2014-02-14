//
//  SixthViewController.m
//  ValentinesDayToYou
//
//  Created by yons on 14-2-14.
//  Copyright (c) 2014年 yons. All rights reserved.
//

#import "SixthViewController.h"

@interface SixthViewController ()

@end

@implementation SixthViewController
{
    UIWebView *webView1;
    UIImageView *imageView;
    UIWebView *webView2;
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
    
    CGRect frame1 = CGRectMake(0, 150, 320, 480);
    frame1.size = [UIImage imageNamed:@"17.gif"].size;
    // 读取gif图片数据
    NSData *gif = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"17" ofType:@"gif"]];
    // view生成
    webView1 = [[UIWebView alloc] initWithFrame:frame1];
    webView1.userInteractionEnabled = NO;//用户不可交互
    [webView1 loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView1];
    
    [self playAV];
    
    [NSTimer scheduledTimerWithTimeInterval:8 target:self selector:@selector(readyGo) userInfo:nil repeats:NO];
}

-(void)readyGo
{
    [webView1 removeFromSuperview];
    
    imageView= [[UIImageView alloc]initWithFrame:CGRectMake(50, 150, 200, 200)];
    [imageView setImage:[UIImage imageNamed:@"18.jpg"]];
    imageView.layer.cornerRadius=30;
    imageView.userInteractionEnabled=YES;
    [self.view addSubview:imageView];
    
    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //设置抖动幅度
    shake.fromValue = [NSNumber numberWithFloat:-0.1];
    shake.toValue = [NSNumber numberWithFloat:+0.1];
    shake.duration = 0.1;
    shake.autoreverses = YES; //是否重复
    shake.repeatCount = 5000;
    [imageView.layer addAnimation:shake forKey:@"imageView"];
    imageView.alpha = 1.0;
    [UIView animateWithDuration:2.0 delay:2.0 options:UIViewAnimationOptionCurveEaseIn animations:nil completion:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(readyGo1) userInfo:nil repeats:NO];
}

-(void)readyGo1{
    [imageView removeFromSuperview];
    
    self.view.backgroundColor=[UIColor blackColor];
    CGRect frame2 = CGRectMake(0, 0, 320, 480);
    frame2.size = [UIImage imageNamed:@"21.gif"].size;
    // 读取gif图片数据
    NSData *gif2 = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"21" ofType:@"gif"]];
    // view生成
    webView2 = [[UIWebView alloc] initWithFrame:frame2];
    webView2.userInteractionEnabled = NO;//用户不可交互
    [webView2 loadData:gif2 MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView2];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 300, 300, 40)];
    label.text=@"六岁倾情制作   只为博君一乐";
    label.font=[UIFont systemFontOfSize:20];
    label.backgroundColor=[UIColor clearColor];
    label.textColor=[UIColor brownColor];
    [self.view addSubview:label];
}

-(void)playAV
{
    NSString *str=@"我能想到最浪漫的事，就是和你一起变老";
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
