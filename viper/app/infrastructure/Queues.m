//
//  Queues.m
//  viper
//
//  Created by vagrant on 9/24/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "Queues.h"

@implementation Queues{
    NSOperationQueue*main;
    NSOperationQueue*background;
}

@synthesize main;
@synthesize background;

+(Queues*)manager {
    static Queues *queues = nil;
    @synchronized(self) {
        if (queues == nil){
            queues = [[self alloc] init];
            queues.main = [NSOperationQueue mainQueue];
            queues.background = [[NSOperationQueue alloc] init];
        }
    }
    return queues;
}

@end
