//
//  iQAPIErrorResponse.h
//  iQKit
//
//  Copyright (c) 2015 iQNECT. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const IQAPICodeClientNotRegistered;
extern NSString * const IQAPICodeInvalidArgument;

@interface iQAPIErrorResponse : NSObject

@property (nonatomic, readonly) NSString *code;
@property (nonatomic, readonly) NSString *message;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSString*)stringForDictionary:(NSDictionary*)data;

@end
