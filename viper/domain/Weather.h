//
//  Entity.h
//  viper
//
//  Created by vagrant on 9/23/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject
- (instancetype)initWithCity:(NSString*)acity withId:(NSNumber*)aremotedId withTemp:(NSNumber*)atemp withPressure:(NSNumber*)apressure withHumidity:(NSNumber*)ahumidity withMaxTemp:(NSNumber*)amaxTemp withMinTemp:(NSNumber*)aminTemp withTitle:(NSString*)aTitle withExtendedDescription:(NSString*)aExtendedDescription withIcon:(NSString*)anIcon withDateTime:(NSNumber*)aDateTime;
-(NSNumber*)remoteId;
-(NSString*)city;
-(NSNumber*)temperature;
-(NSNumber*)pressure;
-(NSNumber*)humidity;
-(NSNumber*)minTemp;
-(NSNumber*)maxTemp;
-(NSString*)icon;
-(NSString*)title;
-(NSString*)description;
-(NSDate*)datetime;
@end
