//
//  GatewayProtocol.h
//  viper
//
//  Created by vagrant on 9/24/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"

@protocol GatewayProtocol <NSObject>
-(Entity*)perform;
@end