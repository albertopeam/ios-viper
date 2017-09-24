//
//  Queues.h
//  viper
//
//  Created by vagrant on 9/24/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queues : NSObject
+(Queues*)manager;
@property (nonatomic, retain) NSOperationQueue*main;
@property (nonatomic, retain) NSOperationQueue*background;
@end
