//
//  Interactor.h
//  viper
//
//  Created by vagrant on 9/23/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"

@interface Interactor : NSObject
-(void)run:(void(^)(Entity* entity))onResult onError:(void(^)(NSException *exception))onError;
@end
