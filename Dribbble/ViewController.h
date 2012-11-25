//
//  ViewController.h
//  Dribbble
//
//  Created by dragon on 25.11.2012.
//  Copyright (c) 2012 iOSCook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate>
{
    int currentPage;
    BOOL downloadingLock;
}

@property (nonatomic, strong) NSMutableArray *shots;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) UINib *shotNib;

-(void)parseDribbleDataPage:(int)page;

@end
