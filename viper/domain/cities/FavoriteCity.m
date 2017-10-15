//
//  City.m
//  viper
//
//  Created by vagrant on 10/11/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "FavoriteCity.h"

@implementation FavoriteCity{
    NSString* name;
}

-(instancetype)initWithName:(NSString*)aName{
    self = [super init];
    if (self) {
        name = aName;
    }
    return self;
}


-(NSString*)name{
    return name;
}
@end
