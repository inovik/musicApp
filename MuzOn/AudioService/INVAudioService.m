//
//  INVAudioService.m
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import "INVAudioService.h"
#import <AVFoundation/AVFoundation.h>

@interface INVAudioService ()

@property(strong, nonatomic) AVPlayer *songPlayer;

@end


@implementation INVAudioService

+(instancetype) sharedInstance {
    static dispatch_once_t pred;
    static id shared = nil;
    dispatch_once(&pred, ^{
        shared = [[super alloc] initUniqueInstance];
    });
    return shared;
}

-(instancetype) initUniqueInstance {
    return [super init];
}

-(void)playSoundWithUrl:(NSURL *)url{    
    if(!self.songPlayer){
        AVPlayer *player = [[AVPlayer alloc]initWithURL:url];
        self.songPlayer = player;
        //    [[NSNotificationCenter defaultCenter] addObserver:self
        //                                             selector:@selector(playerItemDidReachEnd:)
        //                                                 name:AVPlayerItemDidPlayToEndTimeNotification
        //                                               object:[self.songPlayer currentItem]];
        [self.songPlayer addObserver:self forKeyPath:@"status" options:0 context:nil];
    }else{
        //        [[NSNotificationCenter defaultCenter] addObserver:self
        //                                                 selector:@selector(playerItemDidReachEnd:)
        //                                                     name:AVPlayerItemDidPlayToEndTimeNotification
        //                                                   object:[self.songPlayer currentItem]];
        
        [self.songPlayer removeObserver:self forKeyPath:@"status"];
        AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:url];
        
        [self.songPlayer replaceCurrentItemWithPlayerItem:item];
        
        [self.songPlayer addObserver:self forKeyPath:@"status" options:0 context:nil];
    }
    //    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
    

}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if (object == self.songPlayer && [keyPath isEqualToString:@"status"]) {
        if (self.songPlayer.status == AVPlayerStatusFailed) {
            NSLog(@"AVPlayer Failed");
            
        } else if (self.songPlayer.status == AVPlayerStatusReadyToPlay) {
            NSLog(@"AVPlayerStatusReadyToPlay");
            [self.songPlayer play];
            
            
        } else if (self.songPlayer.status == AVPlayerItemStatusUnknown) {
            NSLog(@"AVPlayer Unknown");
            
        }
    }
}
- (void)playerItemDidReachEnd:(NSNotification *)notification {
    
    //  code here to play next sound file
    
}


@end
