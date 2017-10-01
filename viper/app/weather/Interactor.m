//
//  Interactor.m
//  viper
//
//  Created by vagrant on 9/23/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "Interactor.h"

@implementation Interactor{
    @private
    NSOperationQueue*backgroundQueue;
    @private
    NSOperationQueue*mainQueue;
    @private
    id<GatewayProtocol>gateway;
}

- (instancetype)initWithBackground:(NSOperationQueue*)bgQueue
                          withMain:(NSOperationQueue*)mQueue
                       withGateway:(id<GatewayProtocol>)agateway{
    self = [super init];
    if (self) {
        backgroundQueue = bgQueue;
        mainQueue = mQueue;
        gateway = agateway;
    }
    return self;
}

-(void)run:(void(^)(Weather* weather))onResult onError:(void(^)(NSException *exception))onError {
    [backgroundQueue addOperationWithBlock:^{
        @try {
            Weather* weather = [gateway perform];
            [mainQueue addOperationWithBlock:^{
                onResult(weather);
            }];
        } @catch (NSException *exception) {
            [mainQueue addOperationWithBlock:^{
                onError(exception);
            }];
        }
        
    }];
}
@end
