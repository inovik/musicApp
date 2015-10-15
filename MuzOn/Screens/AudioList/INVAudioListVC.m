//
//  INVAudioListVC.m
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import "INVAudioListVC.h"
#import "INVAudioListModel.h"
#import "INVAudioListCell.h"
#import "INVAudioSingleVC.h"
#import "INVAudioSingleModel.h"

#import "INVAudioService.h"
#import <AVFoundation/AVFoundation.h>

@interface INVAudioListVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic) INVAudioListModel *model;

@property(strong, nonatomic) AVPlayer *songPlayer;

@end

@implementation INVAudioListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.model = [[INVAudioListModel alloc] init];
    [self.model loadAudioList];
    
    [self.model addObserver:self forKeyPath:@"modelData" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"modelData"]) {
        [self.tableView reloadData];
    }
    
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


#pragma mark TableView Delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.model.itemsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"INVAudioListCellID";
    
    INVAudioListCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    [cell configureCellWithModel:self.model.modelData[indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    INVAudioListCellModel *cellModel = (INVAudioListCellModel *) self.model.modelData[indexPath.row];
    
    NSURL *url = cellModel.urlAudio;
    [self playselectedsong:url];
    
//    [INVAudioService playSoundWithUrl: cell.model.urlAudio];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ( ![segue.destinationViewController isKindOfClass:[INVAudioSingleVC class]] )
        return;
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    INVAudioSingleModel *model = [[INVAudioSingleModel alloc] initWithAVAudioCellModel:self.model.modelData[indexPath.row]];
    
    INVAudioSingleVC *vc = segue.destinationViewController;
    vc.model = model;
}

-(void)playselectedsong:(NSURL *)urString{
    if(!self.songPlayer){
    AVPlayer *player = [[AVPlayer alloc]initWithURL:urString];
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
        AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:urString];
        
        [self.songPlayer replaceCurrentItemWithPlayerItem:item];

        [self.songPlayer addObserver:self forKeyPath:@"status" options:0 context:nil];
    }
//    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
    
    
    
}

- (void)playerItemDidReachEnd:(NSNotification *)notification {
    
    //  code here to play next sound file
    
}

-(void)dealloc{
    [self.model removeObserver:self forKeyPath:@"modelData"];
}
@end
