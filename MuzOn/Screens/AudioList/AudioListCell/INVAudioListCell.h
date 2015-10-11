//
//  INVAudioListCell.h
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface INVAudioListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleAudioLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationAudioLabel;

-(void)configureCellWithDictionary:(NSDictionary *)cellProperties;

@end
