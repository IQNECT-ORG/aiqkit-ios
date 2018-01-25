//
//  iQMOUserAccount+Additions.h
//  AIQ
//
//  Created by Liyi Huang on 17/01/2018.
//  Copyright (c) 2018 AIQ Pte Ltd. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import "iQMOUserAccount.h"

@interface iQMOUserAccount (Additions)

+ (CGSize)getAvatarSize;
+ (NSDictionary *)getAvatarSizeParams;

- (NSNumber *)age;
- (NSString *)fullName;
- (NSString *)fullMobileNumber;

- (BOOL)isFacebookUser;

@end
