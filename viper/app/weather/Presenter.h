//
//  Presenter.h
//  viper
//
//  Created by vagrant on 9/22/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Interactor.h"
@class ViewController;

@interface Presenter : NSObject
- (instancetype)initWithView:(ViewController*)viewController interactor:(Interactor*)interactor;
- (void)weatherForCity:(NSString*)query;
@end
