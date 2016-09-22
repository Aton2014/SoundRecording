//
//  ViewController.m
//  SoundRecording
//
//  Created by aton on 16/9/21.
//  Copyright © 2016年 aton. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *txtContent;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title=@"英语听读";
    [[HCiflyMSC sharedInstance] initUtility];
    [[HCiflyTTS sharedInstance] initUtility];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnRecordingTouchDown:(id)sender {
    [HCiflyMSC sharedInstance].hciflyMSCDelegate=self;
    [[HCiflyMSC sharedInstance] startRecognizer];
}

- (IBAction)btnRecording_TouchUpInside:(id)sender {
    self.txtContent.text=@"";
    [[HCiflyMSC sharedInstance] stopRecognizer];
}

- (IBAction)btnTranslateTouchUpInside:(id)sender {
    [[HCiflyTTS sharedInstance] startSynthesizer:self.txtContent.text];
}

#pragma mark - HCiflyMSCDelegate
- (void)getContent:(NSString *)content {
    NSString *result=[NSString stringWithFormat:@"%@%@", self.txtContent.text, content];
    self.txtContent.text=[[result stringByReplacingOccurrencesOfString:@" " withString:@""] stringByReplacingOccurrencesOfString:@"。" withString:@""];
}
@end
