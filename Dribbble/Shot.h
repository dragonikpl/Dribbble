//
//  Shot.h
//  Dribbble
//
//  Created by dragon on 25.11.2012.
//  Copyright (c) 2012 iOSCook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shot : NSObject

@property (nonatomic, copy) NSString *imageTeaserUrl;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;

-(id)initWithDictionary:(NSDictionary *)dictionaryWithData;

@end
