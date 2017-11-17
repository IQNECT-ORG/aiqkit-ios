//
//  IQAPINewsRequest.h
//  iQNECT
//
//  Created by Ricardo Santos on 6/01/2015.
//  Copyright (c) 2015 NextFaze Pty Ltd. All rights reserved.
//

#import "iQAPIRequest.h"

@interface iQAPINewsRequest : iQAPIRequest

@property (nonatomic, strong) NSNumber *previewWidth;
@property (nonatomic, strong) NSNumber *previewHeight;

- (void)runWithCompletionHandler:(void (^)(NSArray *newsItems))handler;

@end
