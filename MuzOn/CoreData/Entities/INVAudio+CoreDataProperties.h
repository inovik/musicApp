//
//  INVAudio+CoreDataProperties.h
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "INVAudio.h"

NS_ASSUME_NONNULL_BEGIN

@interface INVAudio (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *artist;
@property (nullable, nonatomic, retain) NSString *titleAudio;
@property (nullable, nonatomic, retain) NSDate *dateAudio;
@property (nullable, nonatomic, retain) NSNumber *duration;
@property (nullable, nonatomic, retain) NSString *genreID;
@property (nullable, nonatomic, retain) NSString *ownerID;
@property (nullable, nonatomic, retain) NSString *urlFIle;
@property (nullable, nonatomic, retain) NSString *audioID;

@end

NS_ASSUME_NONNULL_END
