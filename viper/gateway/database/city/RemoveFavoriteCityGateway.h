//
//  RemoveFavoriteCityGateway.h
//  viper
//
//  Created by Penas Amor, Alberto on 22/10/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemoveFavoriteCity.h"
#import "Database.h"

@interface RemoveFavoriteCityGateway : NSObject<RemoveFavoriteCity>
-(instancetype)initWithDatabase:(Database *)adatabase;
@end
