//
//  FavouriteCitiesViewController.m
//  viper
//
//  Created by vagrant on 10/10/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "FavouriteCitiesViewController.h"
#import "FavouriteCitiesDataSource.h"

@interface FavouriteCitiesViewController ()

@end

@implementation FavouriteCitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [_refreshControl beginRefreshing];
}

- (void)setup {
    _refreshControl = [[UIRefreshControl alloc] init];
    [_refreshControl addTarget:self action:@selector(onRefresh)
             forControlEvents:UIControlEventValueChanged];
    [_collectionView addSubview:_refreshControl];
    _collectionView.alwaysBounceVertical = YES;
    FavouriteCitiesDataSource* s
    [_collectionView setDataSource:];
}

- (void)onRefresh{
    NSLog(@"onRefresh");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
