//
//  INVAudioListModel.m
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import "INVAudioListModel.h"
#import "INVVKManager.h"
#import "INVAudioListCellModel.h"
#import "VKAudio.h"


@implementation INVAudioListModel

@synthesize itemsCount = _itemsCount;
@synthesize modelData = _modelData;

-(void)loadAudioList{
    [VKManager getUserAuidioWithSuccesBlock:^(NSDictionary *response) {
        if (response) {
            NSInteger itemsCount = [response[@"items"] count];
            NSMutableArray *cellModelsArray = [@[] mutableCopy];
            
            for (NSInteger i = 0; i < itemsCount; i++) {
                VKAudio *audio = [[VKAudio alloc] initWithDictionary:response[@"items"][i]];
                INVAudioListCellModel *cellModel = [[INVAudioListCellModel alloc] initWithVKAudio:audio];
                [cellModelsArray addObject:cellModel];
            }
            
            self.itemsCount = itemsCount;
            self.modelData = [NSArray arrayWithArray:cellModelsArray];
        }
    }];
}
@end
