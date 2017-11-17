//
//  MOSearchLog.h
//  iQNECT
//
//  Created by Ricardo Santos on 24/12/2014.
//  Copyright (c) 2014 NextFaze Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MOSearchLog : NSManagedObject

@property (nonatomic, retain) NSNumber * channelID;
@property (nonatomic, retain) NSString * query;
@property (nonatomic, retain) NSDate * timeStamp;

@end
