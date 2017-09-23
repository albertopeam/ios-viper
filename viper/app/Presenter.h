//
//  Presenter.h
//  viper
//
//  Created by vagrant on 9/22/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Interactor.h"
@interface Presenter : NSObject
-(instancetype)initWith:(Interactor*)interactor;
-(void)action;
@end
