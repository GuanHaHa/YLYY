//
//  NTESSessionViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/18.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "NTESSessionViewController.h"
#import "NTESSessionConfig.h"
#import "NTESAttachment.h"
@interface NTESSessionViewController ()

@property (nonatomic,strong) NTESSessionConfig *config;

@end

@implementation NTESSessionViewController

- (instancetype)initWithSession:(NIMSession *)session
{
    self = [super initWithSession:session];
    if (self) {
        _config = [[NTESSessionConfig alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    [self setBackButton];
}

//- (NSString *)sessionTitle{
//    return @"聊天";
//}

- (id<NIMSessionConfig>)sessionConfig{
    return self.config;
}


#pragma mark - Private
//- (void)sendCustomMessage{
//    //构造自定义内容
//    NTESAttachment *attachment = [[NTESAttachment alloc] init];
//    attachment.title = @"这是一条自定义消息";
//    attachment.subTitle = @"这是自定义消息的副标题";
//    
//    //构造自定义MessageObject
//    NIMCustomObject *object = [[NIMCustomObject alloc] init];
//    object.attachment = attachment;
//    
//    //构造自定义消息
//    NIMMessage *message = [[NIMMessage alloc] init];
//    message.messageObject = object;
//    
//    //发送消息
//    [[NIMSDK sharedSDK].chatManager sendMessage:message toSession:self.session error:nil];
//}

@end
