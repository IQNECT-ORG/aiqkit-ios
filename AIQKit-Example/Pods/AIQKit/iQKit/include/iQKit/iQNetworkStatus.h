//
//  iQNetworkStatus.h
//  iQKit
//
//  Created by Li Tian on 3/11/14.
//  Copyright (c) 2015 AIQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iQNetworkStatus : NSObject

+ (instancetype)sharedInstance;

+ (bool)isNetworkAvailable;
+ (void)showNetworkUnavailableAlert;
+ (NSString *)networkNotAvailableText;

@end
