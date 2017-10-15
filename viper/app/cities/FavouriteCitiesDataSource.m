//
//  FavouriteCitiesDataSource.m
//  viper
//
//  Created by vagrant on 10/10/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "FavouriteCitiesDataSource.h"
#import "FavouriteCityCollectionViewCell.h"

@implementation FavouriteCitiesDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _cities.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FavoriteCity* favoriteCity = [_cities objectAtIndex:indexPath.row];
    FavouriteCityCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"city_cell" forIndexPath:indexPath];
    [cell.nameLabel setText:favoriteCity.name];
    return cell;
}
@end
