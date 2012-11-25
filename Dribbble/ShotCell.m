//
//  ShotCell.m
//  Dribbble
//
//  Created by dragon on 25.11.2012.
//  Copyright (c) 2012 iOSCook. All rights reserved.
//

#import "ShotCell.h"
#import "UIImageView+AFNetworking.h"

@implementation ShotCell

- (id)initWithFrame:(CGRect)frame
{
    UINib *nib = [UINib nibWithNibName:@"ShotCell" bundle:nil];
    for (id view in [nib instantiateWithOwner:self options:nil])
    {
        if ([view isKindOfClass:[ShotCell class]])
        {
            self = (ShotCell*)view;
            break;
        }
    }
    
    self.selectedBackgroundView = self.bgr;
    
    return self;
}

- (void)reloadCellWithModel:(Shot*)model
{
    self.titleLabel.text = model.title;
    [self.imageView setImageWithURL:[NSURL URLWithString:model.imageTeaserUrl]];

}

@end
