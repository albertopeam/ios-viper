//
//  RemoveFavoriteCityInteractor.h
//  viper
//
//  Created by Penas Amor, Alberto on 22/10/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemoveFavoriteCity.h"

@interface RemoveFavoriteCityInteractor : NSObject

- (instancetype)initWithRemoveFavoriteCity:(id<RemoveFavoriteCity>)aRemoveFavoriteCity
                      withBackgroundQueue:(NSOperationQueue*)aBgQueue
                            withMainQueue:(NSOperationQueue*)aMainQueue;
-(void)remove:(NSString*)city
           withSuccess:(void(^)(void))onSuccess
             withError:(void(^)(NSException*exception))onError;
@end
