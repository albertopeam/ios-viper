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
@property (weak, nonatomic) IBOutlet UILabel *datetimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *feelsLikeLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *precipitationsLabel;
@property (weak, nonatomic) IBOutlet UILabel *pressureLabel;
@property WeatherPresenter *presenter;
-(void)onSuccess:(WeatherViewModel*)weatherViewModel;
-(void)onError:(NSException*)exception;
-(void)showLoading;
-(void)hideLoading;
@end

