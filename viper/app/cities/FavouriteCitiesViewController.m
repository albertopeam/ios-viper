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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [_refreshControl beginRefreshing];
}

- (void)setup {
    self.navigationItem.title = @"Favourites";
    _refreshControl = [[UIRefreshControl alloc] init];
    [_refreshControl addTarget:self action:@selector(onRefresh)
             forControlEvents:UIControlEventValueChanged];
    [_collectionView addSubview:_refreshControl];
    _collectionView.alwaysBounceVertical = YES;
    datasource = [FavouriteCitiesDataSource new];
    //TODO: sampe code
    NSArray* array = [NSArray arrayWithObject:@"A Coruna"];
    [datasource setCities:array];
    [_collectionView setDataSource:datasource];
}

- (void)onRefresh{
    NSLog(@"onRefresh");
}

#pragma mark - CollectionView
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController* viewController = [WeatherRouter provide];
    [self.navigationController pushViewController:viewController animated:YES];

}

#pragma mark - Search
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"searchBarSearchButtonClicked");
}

@end
