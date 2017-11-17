//
//  MOEvent.h
//  iQNECT
//
//  Created by Ricardo Santos on 8/01/2015.
//  Copyright (c) 2015 NextFaze Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MOEvent : NSManagedObject

@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * action;
@property (nonatomic, retain) NSString * label;
@property (nonatomic, retain) NSNumber * value;
@property (nonatomic, retain) NSDate * timeStamp;

@end
