//
//  AddFavoriteCityGateway.m
//  viper
//
//  Created by vagrant on 10/12/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "AddFavoriteCityGateway.h"
#import "FavoriteCityAlreadyExistsException.h"
#import "FavoriteCityMO+CoreDataClass.h"

@implementation AddFavoriteCityGateway{
    Database* database;
}

- (instancetype)initWithDatabase:(Database *)adatabase{
    self = [super init];
    if (self) {
        database = adatabase;
    }
    return self;
}

-(void)add:(FavoriteCity *)city{
    NSManagedObjectContext* moc = [database moc];
    NSError* error;
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"City"];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"name == %@", city.name];
    [request setPredicate:predicate];
    NSArray* results = [moc executeFetchRequest:request error:&error];
    if (results.count > 0) {
        @throw([FavoriteCityAlreadyExistsException new]);
    }
    FavoriteCityMO* favoriteCityMO =  [NSEntityDescription insertNewObjectForEntityForName:@"City" inManagedObjectContext:moc];
    favoriteCityMO.name = city.name;
    BOOL saved = [moc save:&error];
    if (!saved) {
        @throw([[NSException alloc] initWithName:@"CoreDataStoreException" reason:error.description userInfo:error.userInfo]);
    }
}
@end
