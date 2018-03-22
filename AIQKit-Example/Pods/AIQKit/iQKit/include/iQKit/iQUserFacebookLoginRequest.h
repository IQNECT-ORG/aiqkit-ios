//
//  iQUserFacebookLogin.h
//  AIQ
//
//  Created by Liyi Huang on 17/01/2018.
//  Copyright (c) 2018 AIQ Pte Ltd. All rights reserved.
//

#import "iQAPIRequest.h"

@interface iQUserFacebookLoginRequest : iQAPIRequest

@property (nonatomic, strong) NSString *accessToken;

- (void)runWithCompletionHandler:(void (^)(NSDictionary *userDictionary, NSString *errorMessage))handler;

@end
