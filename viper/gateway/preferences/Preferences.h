//
//  Preferences.h
//  viper
//
//  Created by vagrant on 10/1/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Preferences : NSObject
-(Boolean)isExpiredWeather:(NSString*)city;
-(void)updatedWeather:(NSString*)city;
@end
