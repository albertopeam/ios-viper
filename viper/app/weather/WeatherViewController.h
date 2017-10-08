//
//  ViewController.h
//  viper
//
//  Created by vagrant on 9/22/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherPresenter.h"

@interface WeatherViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property WeatherPresenter *presenter;
-(void)onSuccess:(WeatherViewModel*)weatherViewModel;
-(void)onError:(NSException*)exception;
-(void)showLoading;
-(void)hideLoading;
@end

