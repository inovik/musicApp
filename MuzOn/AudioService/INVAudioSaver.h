//
//  INVAudioSaver.h
//  MuzOn
//
//  Created by Ivan Novikov on 17.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface INVAudioSaver : NSObject

+(NSString *)saveToDiskAudioWithURL:(NSURL *)url title:(NSString *)title;

@end
