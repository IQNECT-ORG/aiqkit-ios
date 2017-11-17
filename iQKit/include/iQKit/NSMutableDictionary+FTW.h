//
//  NSMutableDictionary+FTW.h
//  iQNECT
//
//  Created by Ricardo Santos on 30/07/2014.
//  Copyright (c) 2014 NextFaze Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (FTW)

- (void)setObjectFTW:(id)anObject forKey:(id<NSCopying>)aKey;

@end
