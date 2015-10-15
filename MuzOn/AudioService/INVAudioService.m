//
//  INVAudioService.m
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import "INVAudioService.h"
#import <AVFoundation/AVFoundation.h>

@implementation INVAudioService

+(void)playSoundWithUrl:(NSURL *)url{
//    AVPlayer *objAVPlayer = [[AVPlayer alloc] initWithURL:url];
//    [objAVPlayer play];
//    NSData *_objectData = [NSData dataWithContentsOfURL:url];
    
    NSData *audioData = [NSData dataWithContentsOfURL:url];
    NSString *docDirPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@.mp3", docDirPath , @"somefile"];
    [audioData writeToFile:filePath atomically:YES];
    
    NSError *error;
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&error];
    if (player == nil) {
        NSLog(@"AudioPlayer did not load properly: %@", [error description]);
    } else {
        [player play];
    }
}

@end
