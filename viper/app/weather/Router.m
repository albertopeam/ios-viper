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
#import "GatewayProtocol.h"
#import "Gateway.h"
#import "Provider.h"

@implementation Router

+(ViewController*)provide{
    Provider* provider = [Provider manager];
    NSOperationQueue* background = [provider backgroundQueue];
    NSOperationQueue* main = [provider mainQueue];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    id<GatewayProtocol>gateway = [[Gateway alloc]
                                  initWithManager:manager];
    Interactor* interactor = [[Interactor alloc]
                              initWithBackground:background
                              withMain:main
                              withGateway:gateway];
    ViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"view_controller"];
    Presenter *presenter = [[Presenter alloc]
                            initWithView:viewController
                            interactor:interactor];
    [viewController setPresenter:presenter];
    return viewController;
}

@end
