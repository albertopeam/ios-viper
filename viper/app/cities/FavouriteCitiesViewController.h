//
//  FavouriteCitiesViewController.h
//  viper
//
//  Created by vagrant on 10/10/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavouriteCitiesPresenter.h"
#import "FavoriteCity.h"

@interface FavouriteCitiesViewController : UIViewController<UICollectionViewDelegate, UISearchBarDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) FavouriteCitiesPresenter* presenter;
-(void)onGetFavoriteCities:(NSArray<FavoriteCity*>*)cities;
-(void)onRemovedFavoriteCity:(FavoriteCity*)favoriteCity;
-(void)showLoading;
-(void)hideLoading;
-(void)showError:(NSString*)message;
@end
