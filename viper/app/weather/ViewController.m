//
//  ViewController.m
//  viper
//
//  Created by vagrant on 9/22/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "ViewController.h"
#import "Presenter.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
#import "WeatherMO+CoreDataProperties.h"
#import "WeatherMO+CoreDataClass.h"
#import "Database.h"

@interface ViewController ()@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //TODO: mover este codigo y el del app delegate a otro lado... inicializar el persistent container...
    
    Database* db = [Database manager];
    NSManagedObjectContext* moc = [db moc];
    WeatherMO *weatherMO = [NSEntityDescription insertNewObjectForEntityForName:@"Weather" inManagedObjectContext:moc];
    weatherMO.city = @"A Coruña";
    weatherMO.pressure = 1024;
    weatherMO.humidity = 80;
    weatherMO.temperature = 10;
    weatherMO.min_temp = 8;
    weatherMO.max_temp = 15;
    NSError *error = nil;
    if ([moc save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Weather"];
    error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Employee objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    NSLog(@"VIPER");
    //[_presenter action];
}

- (IBAction)action:(id)sender {
    [_presenter action];
}

-(void)onSuccess:(Entity*)entity{
    [_reloadButton setUserInteractionEnabled:YES];
    [_cityLabel setText:[entity name]];
    [_tempLabel setText:[entity temperature]];
    [_pressureLabel setText:[entity pressure]];
    [_humidityLabel setText:[entity humidity]];
    [_minTempLabel setText:[entity minTemp]];
    [_maxTempLabel setText:[entity maxTemp]];
}

-(void)onError:(NSException*)exception{
    [_reloadButton setUserInteractionEnabled:YES];
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
