//
//  Gateway.h
//  viper
//
//  Created by vagrant on 9/24/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GatewayProtocol.h"
#import "AFHTTPSessionManager+Synchronous.h"
#import <AFNetworking/AFNetworking.h>

@interface Gateway : NSObject <GatewayProtocol>
- (instancetype)initWithManager:(AFHTTPSessionManager*)amanager;
@end
