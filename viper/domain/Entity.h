//
//  Entity.h
//  viper
//
//  Created by vagrant on 9/23/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entity : NSObject
- (instancetype)initWithCity:(NSString*)acity withTemp:(NSNumber*)atemp withPressure:(NSNumber*)apressure withHumidity:(NSNumber*)ahumidity withMaxTemp:(NSNumber*)amaxTemp withMinTemp:(NSNumber*)aminTemp;
-(NSString*)name;
-(NSString*)temperature;
-(NSString*)pressure;
-(NSString*)humidity;
-(NSString*)minTemp;
-(NSString*)maxTemp;
@end
