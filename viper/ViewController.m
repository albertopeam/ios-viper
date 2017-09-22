//
//  ViewController.m
//  viper
//
//  Created by vagrant on 9/22/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "ViewController.h"

#import "Presenter.h"
@interface ViewController ()

@end

@implementation ViewController{
Presenter *presenter;
}

- (instancetype)initWith:(Presenter*)apresenter{
    self = [super init];
    if (self) {
        presenter = apresenter;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
