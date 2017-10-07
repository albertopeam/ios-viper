//
//  Preferences.m
//  viper
//
//  Created by vagrant on 10/1/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "Preferences.h"

@implementation Preferences{
    int ttl;
}

-(instancetype)initWithTTL:(int)attl{
    self = [super init];
    if (self) {
        ttl = attl;
    }
    return self;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        ttl = 30*60;//30min
    }
    return self;
}

-(Boolean)isExpiredWeather:(NSString*)city{
    NSTimeInterval nowSeconds = [[NSDate date] timeIntervalSince1970];
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    double lastUpdated = [defaults doubleForKey:city];
    if (!lastUpdated) {
        return YES;
    }
    return nowSeconds - lastUpdated > ttl;
}

-(void)updatedWeather:(NSString*)city{
    NSTimeInterval nowSeconds = [[NSDate date] timeIntervalSince1970];
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:nowSeconds forKey:city];
    [defaults synchronize];
}

@end
