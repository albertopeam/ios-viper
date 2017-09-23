//
//  Presenter.m
//  viper
//
//  Created by vagrant on 9/22/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "Presenter.h"

@implementation Presenter{
    Interactor* interactor;
}

- (instancetype)initWith:(Interactor *)ainteractor{
    self = [super init];
    if (self) {
        interactor = ainteractor;
    }
    return self;
}

-(void)action{
    [interactor run];
}

@end
