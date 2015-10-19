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
#import "CoreDataService.h"


@implementation INVAudioListModel

@synthesize itemsCount = _itemsCount;
@synthesize modelData = _modelData;

-(void)loadAudioFromServer{
    [VKManager getUserAuidioWithSuccesBlock:^(NSDictionary *response) {
        if (response) {
            NSArray *cellModelsArray = [self parseResponseHelper:response[@"items"] fromDB:NO];
            
            self.itemsCount = cellModelsArray.count;
            self.modelData = cellModelsArray;
        }
    }];
}

-(void)loadAudioFromDB{
    NSArray *localData = [CoreDataManager loadAudioFromDB];
    NSArray *cellModelsArray = [self parseResponseHelper:localData fromDB:YES];
    self.itemsCount = localData.count;
    self.modelData = cellModelsArray;
}

- (NSArray *)parseResponseHelper:(NSArray *)response fromDB:(BOOL)fromDB{
    NSMutableArray *cellModelsArray = [@[] mutableCopy];
    
    for (NSInteger i = 0; i < response.count; i++) {
        id audio;
        INVAudioListCellModel *cellModel;
        if (!fromDB) {
            audio = [[VKAudio alloc] initWithDictionary:response[i]];
            cellModel = [[INVAudioListCellModel alloc] initWithVKAudio:audio];
        }else{
            audio = response[i];
            cellModel = [[INVAudioListCellModel alloc] initWithINVAudio:audio];
        }
        
        [cellModelsArray addObject:cellModel];
    }
    
    return cellModelsArray;
}

@end
