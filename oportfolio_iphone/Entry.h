//
//  Entry.h
//  oportfolio_iphone
//
//  Created by Edward Wallitt on 26/01/2013.
//  Copyright (c) 2013 Edward Wallitt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (nonatomic) int userId;
@property (nonatomic) int entryId;
@property (nonatomic, weak) NSString *title;
@property (nonatomic, weak) NSString *description;
@property (nonatomic, weak) NSString *reflection;
@property (nonatomic, weak) NSDate *createdAt;
@property (nonatomic, weak) NSDate *occuredAt;


@end
