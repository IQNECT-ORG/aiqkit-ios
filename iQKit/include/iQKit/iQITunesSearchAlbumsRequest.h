//
//  IQITunesSearchAlbumsRequest.h
//  iQNECT
//
//  Created by Xu Zhao on 16/12/14.
//  Copyright (c) 2014 NextFaze Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iQRequest.h"

typedef NS_ENUM(NSUInteger, RequestType) {
     iTunesRequestTypeSearch,
     iTunesRequestTypeLookup
};

@interface iQITunesSearchAlbumsRequest : iQRequest

@property (nonatomic, assign) NSUInteger limit;
@property (nonatomic, assign) NSUInteger requestType;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *term;
@property (nonatomic, strong) NSString *entity;
@property (nonatomic, strong) NSString *exceptTrackName;

+ (instancetype)requestWithRequestType:(int)type;
- (void)runWithCompletionHandler:(void (^)(NSArray *records))completion;

@end
