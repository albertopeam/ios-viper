//
//  AddFavoriteCity.h
//  viper
//
//  Created by vagrant on 10/12/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteCity.h"

@protocol AddFavoriteCity <NSObject>
-(void)add:(FavoriteCity*)city;
@end
