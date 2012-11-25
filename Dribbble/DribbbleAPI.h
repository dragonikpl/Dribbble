//
//  DribbleAPI.h
//  Dribbble
//
//  Created by dragon on 25.11.2012.
//  Copyright (c) 2012 iOSCook. All rights reserved.
//

#import "AFHTTPClient.h"

@interface DribbbleAPI : AFHTTPClient

+(DribbbleAPI*)sharedClient;

@end
