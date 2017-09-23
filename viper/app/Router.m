//
//  Factory.m
//  viper
//
//  Created by vagrant on 9/23/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "Router.h"
#import "Presenter.h"
#import "Interactor.h"

@implementation Router

+(ViewController*)provide{
    Interactor* interactor = [Interactor new];
    ViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"view_controller"];
    Presenter *presenter = [[Presenter alloc] initWithView:viewController interactor:interactor];
    [viewController setPresenter:presenter];
    return viewController;
}

@end
