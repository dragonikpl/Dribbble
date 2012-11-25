//
//  DribbleAPI.m
//  Dribbble
//
//  Created by dragon on 25.11.2012.
//  Copyright (c) 2012 iOSCook. All rights reserved.
//

#import "DribbbleAPI.h"
#import "AFJSONRequestOperation.h"
#import "AFNetworkActivityIndicatorManager.h"

@implementation DribbbleAPI

static DribbbleAPI *sharedInstance = nil;

+(DribbbleAPI*)sharedClient
{
    if (nil != sharedInstance) {
        return sharedInstance;
    }
    
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        sharedInstance = [[DribbbleAPI alloc] init];
    });
    
    return sharedInstance;
}

-(id)init
{
    self = [super initWithBaseURL:[NSURL URLWithString:@"http://api.dribbble.com/"]];
    
    if (self)
    {
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
        
    }
    
    return self;
}

@end
