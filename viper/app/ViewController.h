//
//  ViewController.h
//  viper
//
//  Created by vagrant on 9/22/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Presenter.h"

@interface ViewController : UIViewController
@property Presenter *presenter;
-(void)onSuccess:(NSNumber*) success;
-(void)onError:(NSException*)exception;
@end

