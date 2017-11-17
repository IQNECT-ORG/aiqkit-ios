//
//  IQYouTubeSearchRequest.h
//  iQNECT
//
//  Created by Ricardo Santos on 17/09/2014.
//  Copyright (c) 2014 NextFaze Pty Ltd. All rights reserved.
//

#import "iQRequest.h"

@interface iQYouTubeSearchRequest : iQRequest

+ (instancetype)requestWithSearchTerm:(NSString *)searchTerm;

@property (nonatomic, strong) NSString *searchTerm;

- (void)runWithCompletionHandler:(void (^)(NSString *youTubeId, NSURL *thumbnailURL))handler;

@end
