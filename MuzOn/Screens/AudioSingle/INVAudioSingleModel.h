//
//  INVAudioSingleModel.h
//  MuzOn
//
//  Created by Ivan Novikov on 12.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class INVAudioListCellModel;


@interface INVAudioSingleModel : NSObject

@property (strong, nonatomic) INVAudioListCellModel *cellModel;

@property (copy, nonatomic)     NSString *titleAudio;
@property (copy, nonatomic)     NSString *artistAudio;
@property (strong, nonatomic)   NSURL *urlString;

-(instancetype)initWithAVAudioCellModel:(INVAudioListCellModel *)cellModel;


@end
