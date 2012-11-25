//
//  Shot.m
//  Dribbble
//
//  Created by dragon on 25.11.2012.
//  Copyright (c) 2012 iOSCook. All rights reserved.
//

#import "Shot.h"

@implementation Shot

-(id)initWithDictionary:(NSDictionary *)dictionaryWithData
{
    self = [super init];
    
    if (self)
    {
        self.imageTeaserUrl = dictionaryWithData[@"image_teaser_url"];
        self.title = dictionaryWithData[@"title"];
        self.url = dictionaryWithData[@"url"];
    }
    
    return self;
}

@end
