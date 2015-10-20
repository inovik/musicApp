//
//  INVAudioSaver.m
//  MuzOn
//
//  Created by Ivan Novikov on 17.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import "INVAudioSaver.h"

@implementation INVAudioSaver

+(NSString *)saveToDiskAudioWithURL:(NSURL *)url title:(NSString *)title{
    return [url absoluteString];
    
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,true);
    NSString* exportPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:title];
    
    @try {
        
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^(void){
            //Background Thread
            NSData* mainBundleFile = [NSData dataWithContentsOfURL:url];
            [[NSFileManager defaultManager] createFileAtPath:exportPath contents:mainBundleFile attributes:nil];
        });
        
    }
    @catch (NSException* ex)
    {
        NSLog(@"Ring tone save failed");
    }
    
    return exportPath;
}

@end
