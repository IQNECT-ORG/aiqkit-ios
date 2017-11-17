//
//  IQMusicItem.h
//  iQNECT
//
//  Created by Ric Santos on 14/07/2014.
//  Copyright (c) 2014 NextFaze Pty Ltd. All rights reserved.
//

#import "iQModelObject.h"
#import "iQKit.h"

@interface iQMusicItem : iQModelObject

@property (nonatomic, strong) NSString *itemId;
@property (nonatomic, strong) NSString *graceNoteId;
@property (nonatomic, strong) NSString *echoNestId;
@property (nonatomic, strong) NSString *trackName;
@property (nonatomic, strong) NSString *artistName;
@property (nonatomic, strong) NSString *albumArtURLString;
@property (nonatomic, strong) NSString *albumArtSnapShotURLString;
@property (nonatomic, strong) NSString *artistImageURLString;
@property (nonatomic, strong) NSString *albumTitle;
@property (nonatomic, strong) NSString *albumLabel;
@property (nonatomic, strong) NSString *albumYear;
@property (nonatomic, strong) NSString *albumGenre;

@end
