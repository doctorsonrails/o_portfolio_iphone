//
//  OPClientAuthentication.h
//  oportfolio
//
//  Created by Edward Wallitt on 26/01/2013.
//  Copyright (c) 2013 Edward Wallitt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking/AFHTTPClient.h"

@interface SBAPIManager : AFHTTPClient

- (void)setUsername:(NSString *)username andPassword:(NSString *)password;

+ (SBAPIManager *)sharedManager;

@end
