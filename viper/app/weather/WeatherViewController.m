//
//  ViewController.m
//  viper
//
//  Created by vagrant on 9/22/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherPresenter.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
#import "WeatherMO+CoreDataProperties.h"
#import "WeatherMO+CoreDataClass.h"
#import "Provider.h"

@interface WeatherViewController ()@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_presenter weatherForCity:@"A Coruna"];
}

- (IBAction)action:(id)sender {
    [_presenter weatherForCity:@"A Coruna"];
}

- (IBAction)gotoOpenweathermap:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://openweathermap.org/"]
                                       options:@{}
                             completionHandler:^(BOOL success) {
                                
                             }];

}

-(void)onSuccess:(WeatherViewModel*)weatherViewModel{
    //[_reloadButton setUserInteractionEnabled:YES];
    [_cityLabel setText:[weatherViewModel city]];
    [_descriptionLabel setText:[weatherViewModel description]];
    [_iconImage setImage:[weatherViewModel icon]];
    [_datetimeLabel setText:[weatherViewModel datetime]];
    [_temperatureLabel setText:[weatherViewModel temperature]];
    [_feelsLikeLabel setText:[weatherViewModel temperature]];
    [_pressureLabel setText:[weatherViewModel pressure]];
    [_humidityLabel setText:[weatherViewModel humidity]];
}

-(void)onError:(NSException*)exception{
    //[_reloadButton setUserInteractionEnabled:YES];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:[exception reason]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [alert dismissViewControllerAnimated:YES completion:nil];
    });
}

-(void)showLoading{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

-(void)hideLoading{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)dealloc{
    _presenter = nil;
}

@end
