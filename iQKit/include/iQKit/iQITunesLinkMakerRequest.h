//
//  IQITunesLinkMakerRequest.h
//  iQNECT
//
//  Created by Ricardo Santos on 27/08/2014.
//  Copyright (c) 2014 NextFaze Pty Ltd. All rights reserved.
//

#import "iQRequest.h"

@interface iQITunesLinkMakerRequest : iQRequest

+ (instancetype)requestWithSearchTerm:(NSString *)searchTerm;

@property (nonatomic, strong) NSString *searchTerm;

- (void)runWithCompletionHandler:(void (^)(NSURL *iTunesLink))completion;

@end
