//
//  ShotCell.h
//  Dribbble
//
//  Created by dragon on 25.11.2012.
//  Copyright (c) 2012 iOSCook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shot.h"

@interface ShotCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (void)reloadCellWithModel:(Shot*)model;

@end
