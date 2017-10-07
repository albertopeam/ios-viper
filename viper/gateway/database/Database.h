//
//  Database.h
//  viper
//
//  Created by vagrant on 10/1/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Database : NSObject
-(NSManagedObjectContext*)moc;
@end
