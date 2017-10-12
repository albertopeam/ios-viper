//
//  FavoriteCitiesGateway.h
//  viper
//
//  Created by vagrant on 10/12/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteCities.h"
#import "Database.h"

@interface FavoriteCitiesGateway : NSObject<FavoriteCities>
- (instancetype)initWithDatabase:(Database *)adatabase;
@end
