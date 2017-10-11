//
//  FavouriteCitiesViewController.m
//  viper
//
//  Created by vagrant on 10/10/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "FavouriteCitiesViewController.h"
#import "FavouriteCitiesDataSource.h"
#import "WeatherRouter.h"

@interface FavouriteCitiesViewController ()

@end

@implementation FavouriteCitiesViewController{
    FavouriteCitiesDataSource* datasource;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self getFavoriteCities];
}

-(void)setup {
    self.navigationItem.title = @"Favourites";
    _refreshControl = [[UIRefreshControl alloc] init];
    [_refreshControl addTarget:self
                        action:@selector(getFavoriteCities)
              forControlEvents:UIControlEventValueChanged];
    [_collectionView addSubview:_refreshControl];
    _collectionView.alwaysBounceVertical = YES;
    datasource = [FavouriteCitiesDataSource new];
    [_collectionView setDataSource:datasource];
}

-(void)getFavoriteCities{
    [_presenter getFavoriteCities];
}

-(void)onGetFavoriteCities:(NSArray<FavoriteCity*>*)cities{
    [datasource setCities:cities];
    [_collectionView reloadData];
}

-(void)showLoading{
    [_refreshControl beginRefreshing];
}

-(void)hideLoading{
    [_refreshControl endRefreshing];
}

#pragma mark - CollectionView
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    FavoriteCity* favoriteCity = [[datasource cities] objectAtIndex:indexPath.row];
    UIViewController* viewController = [WeatherRouter provide:favoriteCity];
    [self.navigationController pushViewController:viewController animated:YES];

}

- (void)collectionView:(UICollectionView *)colView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    [UIView animateWithDuration:0.1
                          delay:0
                        options:(UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [cell setBackgroundColor:[UIColor colorWithRed:232/255.0f green:232/255.0f blue:232/255.0f alpha:1]];
                     }
                     completion:nil];
}

- (void)collectionView:(UICollectionView *)colView  didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    [UIView animateWithDuration:0.1
                          delay:0
                        options:(UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [cell setBackgroundColor:[UIColor clearColor]];
                     }
                     completion:nil ];
}

#pragma mark - Search
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"searchBarSearchButtonClicked");
}

@end
