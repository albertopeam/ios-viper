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

@interface ViewController ()@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)action:(id)sender {
    [_presenter action];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onSuccess:(Entity*)entity{
    NSLog(@"ViewController onsuccess");
}

-(void)onError:(NSException*)exception{
    NSLog(@"ViewController onError %@", [exception reason]);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:@"There was a problem fetching resources, try again later"
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



@end
