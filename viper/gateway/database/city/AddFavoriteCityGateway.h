//
//  AddFavoriteCityGateway.h
//  viper
//
//  Created by vagrant on 10/12/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddFavoriteCity.h"
#import "Database.h"

@interface AddFavoriteCityGateway : NSObject<AddFavoriteCity>
-(instancetype)initWithDatabase:(Database *)adatabase;
@end
