//
//  HCiflyMSC.h
//  SoundRecording
//
//  Created by aton on 16/9/21.
//  Copyright © 2016年 aton. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "iflyMSC/IFlyMSC.h"
//不带界面的语音识别控件
#import "iflyMSC/IFlySpeechRecognizerDelegate.h"
#import "iflyMSC/IFlySpeechRecognizer.h"
//不带界面的语音合成控件
#import "iflyMSC/IFlySpeechSynthesizerDelegate.h"
#import "iflyMSC/IFlySpeechSynthesizer.h"

#import "ISRDataHelper.h"
#import "IATConfig.h"

@interface HCiflyMSC : NSObject<IFlySpeechRecognizerDelegate,IFlyRecognizerViewDelegate,UIActionSheetDelegate>

@property (nonatomic, strong) NSString *pcmFilePath;//音频文件路径
@property (nonatomic, strong) IFlySpeechRecognizer *iFlySpeechRecognizer;//不带界面的识别对象
@property (nonatomic, strong) IFlyRecognizerView *iflyRecognizerView;//带界面的识别对象
@property (nonatomic, strong) IFlyDataUploader *uploader;//数据上传对象


@property (nonatomic, strong) NSString * result;
@property (nonatomic, assign) BOOL isCanceled;


+ (instancetype)sharedInstance;
- (void)initUtility;
- (void)startRecognizer;

@end
