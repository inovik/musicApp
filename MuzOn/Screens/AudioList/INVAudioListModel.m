//
//  INVAudioListModel.m
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import "INVAudioListModel.h"
#import "INVVKManager.h"

@implementation INVAudioListModel

@synthesize itemsCount = _itemsCount;
@synthesize modelData = _modelData;

-(void)loadAudioList{
    [VKManager getUserAuidioWithSuccesBlock:^(NSDictionary *response) {
        if (response) {
            self.itemsCount = [response[@"items"] count];
            self.modelData = [NSArray arrayWithArray:response[@"items"]];
        }
    }];
}
@end
