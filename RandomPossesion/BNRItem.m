//
//  BNRItem.m
//  RandomPossesion
//
//  Created by Thomas Kimura on 2013-09-09.
//  Copyright (c) 2013 Thomas Kimura. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

//random item
+(id)randomItem
{
    //array of adjectives
    NSArray *adjectives = [[NSArray alloc]initWithObjects:
                           @"Shiny",
                           @"Clear",
                           @"Bright",
                           @"Cool",
                           nil];
    
    //array of nouns
    NSArray *nouns = [[NSArray alloc]initWithObjects:
                      @"Lamp",
                      @"Desk",
                      @"Binder",
                      @"Hat",
                      nil];
    
    int aIndex = arc4random() % [adjectives count];
    int nIndex = arc4random() % [nouns count];
    
    NSString *randomItemName = [NSString stringWithFormat:@"%@ %@",
                                [adjectives objectAtIndex:aIndex],
                                [nouns objectAtIndex:nIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerial = [NSString stringWithFormat:@" %d%d%d%d",
                              'A' + rand() % 8,
                              'B' + rand() % 16,
                              'C' + rand() % 32,
                              'D' + rand() % 64];
    
    BNRItem *newItem = [[self alloc]initWithItemName:randomItemName
                                      valueInDollars:randomValue
                                        serialNumber:randomSerial];
    
    return newItem;
};

//implement designated init
- (id)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber
{
    //call super call designated
    self = [super init];
    
    if (self) {
        //give instance variable inittial value
        [self setItemName:name];
        [self setItemSerial:sNumber];
        [self setValueInDollars:value];
        dateCreated = [[NSDate alloc]init];
    }

    //return address
    return self;
}

//description
-(NSString *)description
{
    NSString *descriptionString =
        [[NSString alloc]initWithFormat:@"%@ (%@): Worth %d recorded on %@",
         itemName,
         itemSerial,
         valueInDollars,
         dateCreated];
    return descriptionString;
}

-(id)init
{
    return [self initWithItemName:@"Item"
                   valueInDollars:0
                     serialNumber:@"0"];
}


//set and get methods for itemName
-(void)setItemName:(NSString *)str
{
    itemName = str;
}
-(NSString *)itemName
{
    return itemName;
}


//set and get for itemSerial
-(void)setItemSerial:(NSString *)str
{
    itemSerial = str;
}
-(NSString *)itemSerial
{
    return itemSerial;
}

//set and get for value in dollars
-(void)setValueInDollars:(int)i
{
    valueInDollars = i;
}
-(int) valueInDollars
{
    return valueInDollars;
}

//set and get for date
-(void)setDateCreated
{
    NSDate *now = [NSDate date];
    dateCreated = now;
}
-(NSDate *)dateCreated
{
    return dateCreated;
}



@end
