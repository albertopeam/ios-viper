//
//  Gateway.m
//  viper
//
//  Created by vagrant on 9/24/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "Gateway.h"

@implementation Gateway{
@private AFHTTPSessionManager* manager;
}

- (instancetype)initWithManager:(AFHTTPSessionManager*)amanager
{
    self = [super init];
    if (self) {
        manager = amanager;
    }
    return self;
}

-(Entity*)perform{
    //TODO: parse exception...change url to https or something that 
    NSError *error = nil;
    NSData *result = [manager syncGET:@"https://google.es"
                           parameters:@{}
                                 task:NULL
                                error:&error];
    NSLog(@"result: %@", result);
    if (!error) {
        return [Entity new];
    }
    @throw([NSException exceptionWithName:@"Network exception" reason:error.description userInfo:nil]);
}

@end
