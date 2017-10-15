//
//  FavouriteCitiesDataSource.h
//  viper
//
//  Created by vagrant on 10/10/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FavoriteCity.h"

@interface FavouriteCitiesDataSource : NSObject<UICollectionViewDataSource>
    @property(strong, nonatomic) NSArray<FavoriteCity*>* cities;
@end
