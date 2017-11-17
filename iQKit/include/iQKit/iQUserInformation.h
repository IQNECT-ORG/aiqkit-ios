//
//  IQUserInformation.h
//  iQNECT
//
//  Created by Luke Scholefield on 5/05/2014.
//  Copyright (c) 2014 NextFaze Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iQUserInformation : NSObject

+ (instancetype)sharedInstance;

+ (BOOL)carouselHintsDisplayed;
+ (void)setCarouselHintsDisplayed;

@end
