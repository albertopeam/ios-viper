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
#import "Queues.h"
#import "GatewayProtocol.h"
#import "Gateway.h"

@implementation Router

+(ViewController*)provide{
    NSOperationQueue* background = [[Queues manager] background];
    NSOperationQueue* main = [[Queues manager] main];
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
