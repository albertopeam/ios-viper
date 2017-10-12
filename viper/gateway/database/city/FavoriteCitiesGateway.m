//
//  FavoriteCitiesGateway.m
//  viper
//
//  Created by vagrant on 10/12/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "FavoriteCitiesGateway.h"
#import "FavoriteCityMO+CoreDataClass.h"

@implementation FavoriteCitiesGateway{
    Database* database;
}

- (instancetype)initWithDatabase:(Database *)adatabase{
    self = [super init];
    if (self) {
        database = adatabase;
    }
    return self;
}

-(NSArray<FavoriteCity *> *)fetchFavoriteCities{
    NSManagedObjectContext* moc = [database moc];
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"City"];
    NSError*error;
    NSArray*results = [moc executeFetchRequest:request error:&error];
    if (error) {
        @throw([NSException exceptionWithName:@"CoreDataException"
                                       reason:[error localizedDescription]
                                     userInfo:[error userInfo]]);
    }
    NSMutableArray* favoriteCities = [NSMutableArray new];
    for (FavoriteCityMO* cityMO in results) {
        FavoriteCity*favoriteCity = [[FavoriteCity alloc] initWithName:cityMO.name];
        [favoriteCities addObject:favoriteCity];
    }
    return [NSArray arrayWithArray:favoriteCities];
}

@end
