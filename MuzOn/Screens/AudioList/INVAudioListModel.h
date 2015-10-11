//
//  INVAudioListModel.h
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface INVAudioListModel : NSObject

@property (assign, nonatomic) NSInteger itemsCount;
@property (strong, nonatomic) NSArray *modelData;

-(void)loadAudioList;

@end
