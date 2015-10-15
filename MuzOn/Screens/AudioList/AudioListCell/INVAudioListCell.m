//
//  INVAudioListCell.m
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import "INVAudioListCell.h"

@interface INVAudioListCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleAudioLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationAudioLabel;

@end

@implementation INVAudioListCell

@synthesize durationAudioLabel = _durationAudioLabel;
@synthesize titleAudioLabel = _titleAudioLabel;

-(void)configureCellWithModel:(INVAudioListCellModel *)model{
    self.model = model;
    if (_model) {
        _durationAudioLabel.text = self.model.duration;
        [_titleAudioLabel setText: [NSString stringWithFormat:@"%@ - %@", self.model.artist, self.model.titleAudio]];
    }
    
}
@end
