//
//  Interactor.m
//  viper
//
//  Created by vagrant on 9/23/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "Interactor.h"

@implementation Interactor
-(void)run:(void(^)(Entity* entity))onResult onError:(void(^)(NSException *exception))onError {
    NSLog(@"Interactor run");
    if (onResult) {
        onResult([Entity new]);
    }
}
@end
