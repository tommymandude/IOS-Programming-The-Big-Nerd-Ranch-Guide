//
//  BNRItem.h
//  RandomPossesion
//
//  Created by Thomas Kimura on 2013-09-09.
//  Copyright (c) 2013 Thomas Kimura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    //declare stuff for BNRItem
    NSString *itemName;
    NSString *itemSerial;
    int valueInDollars;
    NSDate *dateCreated;
}

+(id)randomItem;

//designated init
-(id)initWithItemName:(NSString *)name
       valueInDollars:(int)value
         serialNumber:(NSString *)sNumber;



//set and get methods for itemName
-(void)setItemName: (NSString *)str;
-(NSString *)itemName;

//set and get methods for itemSerial
-(void)setItemSerial: (NSString *)str;
-(NSString *)itemSerial;

//set and get methods for valueInDollars
-(void)setValueInDollars: (int)i;
-(int)valueInDollars;

-(void)setDateCreated;
-(NSDate *)dateCreated;




@end
