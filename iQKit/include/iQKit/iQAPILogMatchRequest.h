//
//  iQAPILogMatchRequest.h
//  iQKit
//
//  Created by Dan Silk on 15/08/2016.
//  Copyright © 2016 AIQ. All rights reserved.
//

#import "iQAPIRequest.h"

@class iQAPISearchResponse;

@interface iQAPILogMatchRequest : iQAPIRequest

@property (nonatomic, strong) iQAPISearchResponse *searchResponse;

- (void)runWithCompletionHandler:(void (^)(void))handler;

@end
