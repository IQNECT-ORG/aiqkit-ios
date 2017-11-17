//
//  iQURLHandler.h
//  iQKit
//
//  Created by Dan Silk on 21/07/2015.
//  Copyright (c) 2015 iQNECT. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const iQMethodIQ;
extern NSString * const iQMethodIQMusic;
extern NSString * const iQMethodURL;
extern NSString * const iQMethodFullscreen;
extern NSString * const iQMethodVideo;
extern NSString * const iQMethodAppStore;

@interface iQURLHandler : NSObject

+ (NSDictionary *)parseURL:(NSURL *)url;
+ (id)parseComponentParameter:(NSString *)component withMethod:(NSString *)method;

@end
