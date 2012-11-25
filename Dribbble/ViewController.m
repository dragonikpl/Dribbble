//
//  ViewController.m
//  Dribbble
//
//  Created by dragon on 25.11.2012.
//  Copyright (c) 2012 iOSCook. All rights reserved.
//

#import "ViewController.h"
#import "DribbbleAPI.h"
#import "Shot.h"
#import "ShotCell.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // settings
    currentPage = 1;
    downloadingLock = NO;
    
    [self parseDribbleDataPage:currentPage];
    self.shotNib = [UINib nibWithNibName:@"ShotCell" bundle:nil];
}

-(void)parseDribbleDataPage:(int)page
{
    if (downloadingLock == NO)
    {
        downloadingLock = YES;
        
        [self showIndicator];
        
        [[DribbbleAPI sharedClient]
         getPath:@"shots/popular"
         parameters:@{@"page" : @(page)}
         success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             [self hideIndicator];
             downloadingLock = NO;
             if (self.shots == nil)
                 self.shots = [NSMutableArray array];
             
             [self.collectionView performBatchUpdates:
              ^{
                  for (NSDictionary *shot in responseObject[@"shots"])
                  {
                      [self.shots addObject:[[Shot alloc] initWithDictionary:shot]];
                      [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:self.shots.count-1 inSection:0]]];
                  }
             } completion:nil];
             
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             [self hideIndicator];
             downloadingLock = NO;
             UIAlertView *alert = [[UIAlertView alloc]
                                   initWithTitle:@"Network problem"
                                   message:[error debugDescription]
                                   delegate:nil
                                   cancelButtonTitle:@"Cancel"
                                   otherButtonTitles:nil];
             [alert show];
         }];
        
        currentPage++;
    }
    
}

#pragma mark - UICollectionView delegate/datasource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.shots.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView registerClass:[ShotCell class] forCellWithReuseIdentifier:@"ShotCell"];
    ShotCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ShotCell" forIndexPath:indexPath];
    
    [cell reloadCellWithModel:self.shots[indexPath.row]];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    if (self.webViewController == nil)
    {
        self.webViewController = [[WebViewController alloc] init];
        self.webViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        self.webViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    }
    
    [self presentViewController:self.webViewController animated:YES completion:nil];
    
    [self.webViewController openURL:[(Shot*)self.shots[indexPath.row] url]];
}

#pragma mark - UICollectionView scroll delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > (scrollView.contentSize.height - self.view.frame.size.height))
    {
        [self parseDribbleDataPage:currentPage];
    }
}

#pragma mark - Loading indicator animations

-(void)showIndicator
{
    self.loadingView.frame = (CGRect){270, -46, 33, 43};
    [UIView
     animateWithDuration:0.5f
     delay:0.0f
     options:UIViewAnimationCurveEaseInOut
     animations:^{
         self.loadingView.frame = (CGRect){270, 0, 33, 43};
     }
     completion:nil];
}

-(void)hideIndicator
{
    //self.loadingView.frame = (CGRect){277, -46, 33, 43};
    [UIView
     animateWithDuration:0.5f
     delay:0.0f
     options:UIViewAnimationCurveEaseInOut
     animations:^{
         self.loadingView.frame = (CGRect){270, -46, 33, 43};
     }
     completion:nil];
}

@end
