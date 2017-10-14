//
//  AddFavoriteCityInteractor.h
//  viper
//
//  Created by vagrant on 10/14/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteCity.h"

@interface AddFavoriteCityInteractor : NSObject
-(void)addFavoriteCity:(NSString*)city
           withSuccess:(void(^)(NSArray<FavoriteCity*>*cities))onSuccess
             withError:(void(^)(NSException*exception))onError;
@end
