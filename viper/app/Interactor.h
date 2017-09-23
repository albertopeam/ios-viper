//
//  Interactor.h
//  viper
//
//  Created by vagrant on 9/23/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Interactor : NSObject
-(void)run:(void(^)(NSNumber* success))onResult onError:(void(^)(NSException *exception))onError;
@end
