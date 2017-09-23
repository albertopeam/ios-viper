//
//  Interactor.m
//  viper
//
//  Created by vagrant on 9/23/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "Interactor.h"

@implementation Interactor
-(void)run:(void(^)(NSNumber* success))onResult onError:(void(^)(NSException *exception))onError {
    NSLog(@"Interactor run");
    if (onResult) {
        onResult([NSNumber numberWithBool:true]);
    }
}
@end
