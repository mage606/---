//
//  FourthViewController.m
//  Valentine’s Day  To  You
//
//  Created by yons on 14-2-13.
//  Copyright (c) 2014年 yons. All rights reserved.
//

#import "FourthViewController.h"
#import "HSCButton.h"
#import "FirthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController
{
    HSCButton *redView;
    HSCButton *greenView;
    UIButton *btn;
    int count;
    BOOL isCanChange;
    UIButton *btn1;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)loadView
{
    [super loadView];
    
    
    
    count = 0;
    isCanChange = YES;
    
    redView = [[HSCButton alloc]initWithFrame:CGRectMake(20, 60, 220, 200)];
    redView.backgroundColor = [UIColor redColor];
    redView.layer.cornerRadius=50.0;
    redView.dragEnable=YES;
    [self.view addSubview:redView];
    
    greenView = [[HSCButton alloc]initWithFrame:CGRectMake(20, 60, 220, 200)];
    greenView.backgroundColor = [UIColor clearColor];
    greenView.layer.cornerRadius=50.0;
    greenView.dragEnable=YES;
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 220, 200);
    btn.backgroundColor=[UIColor clearColor];
    btn.layer.cornerRadius=50;
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [redView addSubview:btn];
    
    CGRect frame1 = CGRectMake(-150, -100, 280, 480);
    frame1.size = [UIImage imageNamed:@"14.gif"].size;
    // 读取gif图片数据
    NSData *gif = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"14" ofType:@"gif"]];
    // view生成
    webView1 = [[UIWebView alloc] initWithFrame:frame1];
    webView1.userInteractionEnabled = NO;//用户不可交互
    [webView1 loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [btn addSubview:webView1];
    
    btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(0, 0, 220, 200);
    btn1.backgroundColor=[UIColor clearColor];
    btn1.layer.cornerRadius=50;
    [btn1 addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [greenView addSubview:btn1];
    
    UILabel *label=[[UILabel alloc]init];
    label.layer.cornerRadius=50;
    label.text=@"我对你的爱永远不变，即使沧海桑田，岁月会变迁";
    label.numberOfLines=2;
    label.lineBreakMode=NSLineBreakByCharWrapping;
    label.backgroundColor=[UIColor blueColor];
    label.frame=CGRectMake(0, 0, 220, 200);
    [greenView addSubview:label];
}

-(void)playAV
{
    NSString *str=@"我对你的爱永远不变，即使沧海桑田，岁月会变迁";
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


-(void)btnClick
{
    if(count%2==0)
    {
        if(isCanChange)
        {
            [self playAV];
            [UIView animateWithDuration:0.5 animations:^{
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:redView cache:YES];
                [redView addSubview:greenView];
                isCanChange = NO;
            } completion:^(BOOL finished) {
                count++;
                isCanChange = YES;
            }];
            [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(readyGo3) userInfo:nil repeats:NO];
        }
    }
    else
    {
        if(isCanChange)
        {
            [UIView animateWithDuration:0.5 animations:^{
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:redView cache:YES];
                [greenView removeFromSuperview];
                isCanChange = NO;
            } completion:^(BOOL finished) {
                count++;
                isCanChange = YES;
            }];
        }
    }
}

-(void)readyGo3
{
    FirthViewController *fvc=[[FirthViewController alloc]init];
    [self presentViewController:fvc animated:NO completion:^{
        
    }];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
