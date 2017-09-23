//
//  ViewController.m
//  viper
//
//  Created by vagrant on 9/22/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "ViewController.h"

#import "Presenter.h"
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

-(void)onSuccess:(NSNumber*) success{
    NSLog(@"ViewController onsuccess");
}

-(void)onError:(NSException*)exception{
    NSLog(@"ViewController onError %@", [exception reason]);
}

@end
