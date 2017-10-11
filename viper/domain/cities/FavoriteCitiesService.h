//
//  FavouriteCitiesService.h
//  viper
//
//  Created by vagrant on 10/11/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteCity.h"

@interface FavoriteCitiesService : NSObject
- (NSArray<FavoriteCity*>*)getFavorites;
@end
