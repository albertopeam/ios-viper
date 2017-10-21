//
//  RemoveFavoriteCityInteractor.m
//  viper
//
//  Created by Penas Amor, Alberto on 22/10/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "RemoveFavoriteCityInteractor.h"

@implementation RemoveFavoriteCityInteractor{
    id<RemoveFavoriteCity>removeFavoriteCity;
    NSOperationQueue *backgroundQueue;
    NSOperationQueue *mainQueue;
}

-(instancetype)initWithRemoveFavoriteCity:(id<RemoveFavoriteCity>)aRemoveFavoriteCity
                      withBackgroundQueue:(NSOperationQueue *)aBgQueue
                            withMainQueue:(NSOperationQueue *)aMainQueue{
    self = [super init];
    if (self) {
        removeFavoriteCity = aRemoveFavoriteCity;
        mainQueue = aMainQueue;
        backgroundQueue = aBgQueue;
    }
    return self;
}


-(void)remove:(NSString *)city withSuccess:(void (^)(void))onSuccess
                                 withError:(void (^)(NSException *))onError{
    [backgroundQueue addOperationWithBlock:^{
        @try {
            [removeFavoriteCity remove:city];
            [mainQueue addOperationWithBlock:^{
                onSuccess();
            }];
        } @catch (NSException *exception) {
            [mainQueue addOperationWithBlock:^{            
                onError(exception);
            }];
        }
    }];
}

@end
