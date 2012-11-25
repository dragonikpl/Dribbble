//
//  ViewController.h
//  Dribbble
//
//  Created by dragon on 25.11.2012.
//  Copyright (c) 2012 iOSCook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate>
{
    int currentPage;
    BOOL downloadingLock;
}

@property (nonatomic, strong) NSMutableArray *shots;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) UINib *shotNib;
@property (nonatomic, strong) WebViewController *webViewController;
@property (strong, nonatomic) IBOutlet UIView *loadingView;

-(void)parseDribbleDataPage:(int)page;

@end
