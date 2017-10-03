//
//  Gateway.h
//  viper
//
//  Created by vagrant on 9/24/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FetchWeatherDataSource.h"
#import "AFHTTPSessionManager+Synchronous.h"
#import <AFNetworking/AFNetworking.h>

@interface GetWeatherApiClient : NSObject <FetchWeatherDataSource>
- (instancetype)initWithManager:(AFHTTPSessionManager*)amanager;
@end
