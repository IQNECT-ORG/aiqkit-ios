//
//  MOMusicLog.h
//  iQKit
//
//  Created by Dan Silk on 27/07/2015.
//  Copyright (c) 2015 iQNECT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MOMusicLog : NSManagedObject

@property (nonatomic, retain) NSString * itemId;
@property (nonatomic, retain) NSString * graceNoteId;
@property (nonatomic, retain) NSString * echoNestId;
@property (nonatomic, retain) NSString * trackName;
@property (nonatomic, retain) NSString * artistName;
@property (nonatomic, retain) NSString * albumArtURLString;
@property (nonatomic, retain) NSString * albumArtSnapShotURLString;
@property (nonatomic, retain) NSString * artistImageURLString;
@property (nonatomic, retain) NSString * albumTitle;
@property (nonatomic, retain) NSString * albumLabel;
@property (nonatomic, retain) NSString * albumYear;
@property (nonatomic, retain) NSString * albumGenre;
@property (nonatomic, retain) NSDate * timeStamp;

@end
