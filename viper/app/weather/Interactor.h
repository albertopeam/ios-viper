//
//  Interactor.h
//  viper
//
//  Created by vagrant on 9/23/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"
#import "GatewayProtocol.h"

@interface Interactor : NSObject
- (instancetype)initWithBackground:(NSOperationQueue*)bgQueue
                          withMain:(NSOperationQueue*)mQueue
                       withGateway:(id<GatewayProtocol>)agateway;
-(void)run:(void(^)(Weather* weather))onResult onError:(void(^)(NSException *exception))onError;
@end
