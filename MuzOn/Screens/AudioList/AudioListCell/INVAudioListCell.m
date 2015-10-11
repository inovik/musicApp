//
//  INVAudioListCell.m
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import "INVAudioListCell.h"
#import "INVAudioListCellModel.h"

@interface INVAudioListCell ()

@property (strong, nonatomic) INVAudioListCellModel * model;

@end

@implementation INVAudioListCell

@synthesize durationAudioLabel = _durationAudioLabel;
@synthesize titleAudioLabel = _titleAudioLabel;

-(void)configureCellWithDictionary:(NSDictionary *)cellProperties{
    self.model = [[INVAudioListCellModel alloc] initWithDictionary:cellProperties];
    if (_model) {
        _durationAudioLabel.text = self.model.duration;
        [_titleAudioLabel setText: self.model.titleAudio];
    }
    
}
@end
