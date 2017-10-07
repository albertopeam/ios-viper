//
//  Presenter.h
//  viper
//
//  Created by vagrant on 9/22/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherInteractor.h"
@class WeatherViewController;

@interface WeatherPresenter : NSObject
- (instancetype)initWithView:(WeatherViewController*)viewController
                  interactor:(WeatherInteractor*)interactor;
- (void)weatherForCity:(NSString*)query;
@end
