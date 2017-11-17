//
//  iQModelObject.h
//  iQNECT
//
//  Created by Ricardo Santos on 30/07/2014.
//  Copyright (c) 2014 NextFaze Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableDictionary+FTW.h"

@interface iQModelObject : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;

// Parsing convenience
- (id)stringForKey:(NSString *)key fromDictionary:(NSDictionary *)dictionary;

@end
