//
//  iQUserLoginRequest.h
//  AIQ
//
//  Created by Liyi Huang on 17/01/2018.
//  Copyright (c) 2018 AIQ Pte Ltd. All rights reserved.
//

#import "iQAPIRequest.h"

@interface iQUserLoginRequest : iQAPIRequest

@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *email;

- (void)runWithCompletionHandler:(void (^)(NSDictionary *userDictionary, NSString *errorMessage))handler;

@end
