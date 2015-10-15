//
//  INVAudioSingleModel.m
//  MuzOn
//
//  Created by Ivan Novikov on 12.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import "INVAudioSingleModel.h"
#import "INVAudioListCellModel.h"

@implementation INVAudioSingleModel

-(instancetype)initWithAVAudioCellModel:(INVAudioListCellModel *)cellModel{
    if (self == [super init]) {
        if(cellModel){
            self.cellModel = cellModel;
            self.titleAudio = cellModel.titleAudio;
            self.artistAudio = cellModel.artist;
            self.urlString = cellModel.urlAudio;
        }
    }
    
    return self;
}

@end
