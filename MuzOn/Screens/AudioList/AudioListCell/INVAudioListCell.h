//
//  INVAudioListCell.h
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "INVAudioListCellModel.h"

@interface INVAudioListCell : UITableViewCell

@property (strong, nonatomic) INVAudioListCellModel * model;


-(void)configureCellWithModel:(INVAudioListCellModel *)model;

@end
