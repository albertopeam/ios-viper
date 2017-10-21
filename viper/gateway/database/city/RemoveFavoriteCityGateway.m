//
//  RemoveFavoriteCityGateway.m
//  viper
//
//  Created by Penas Amor, Alberto on 22/10/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "RemoveFavoriteCityGateway.h"
#import "FavoriteCityMO+CoreDataClass.h"

@implementation RemoveFavoriteCityGateway{
    Database* database;
}

- (instancetype)initWithDatabase:(Database *)adatabase{
    self = [super init];
    if (self) {
        database = adatabase;
    }
    return self;
}

-(void)remove:(NSString *)city{
    NSManagedObjectContext* moc = [database moc];
    NSError* error;
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"City"];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"name == %@", city];
    [request setPredicate:predicate];
    NSArray* results = [moc executeFetchRequest:request error:&error];
    FavoriteCityMO*favCity = [results firstObject];
    [moc deleteObject:favCity];
    if (![moc save:&error]){
        @throw([[NSException alloc] initWithName:@"CoreDataStoreException"
                                          reason:error.description
                                        userInfo:error.userInfo]);
    }
}

@end
