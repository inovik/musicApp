//
//  CoreDataService.h
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#define CoreDataManager [CoreDataService sharedInstance]

@interface CoreDataService : NSObject <NSFetchedResultsControllerDelegate>

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;



+(instancetype) sharedInstance;
// следующие объявления сгенерируют compile time ошибки при попытке их вызвать вручную.
// добавляем -copyWithZone: -allocWithZone: -copy по вкусу
+(instancetype) alloc __attribute__((unavailable("alloc not available, call sharedInstance instead")));
-(instancetype) init __attribute__((unavailable("init not available, call sharedInstance instead")));
+(instancetype) new __attribute__((unavailable("new not available, call sharedInstance instead")));

- (NSArray *)loadAudio;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
@end
