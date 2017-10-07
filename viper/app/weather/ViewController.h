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
@property (weak, nonatomic) IBOutlet UILabel *maxTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *minTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *pressureLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UIButton *reloadButton;
@property Presenter *presenter;
-(void)onSuccess:(Weather*)weather;
-(void)onError:(NSException*)exception;
-(void)showLoading;
-(void)hideLoading;
@end

