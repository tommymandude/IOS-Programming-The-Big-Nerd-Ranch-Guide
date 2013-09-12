//
//  BNRContainer.m
//  RandomPossesion
//
//  Created by Thomas Kimura on 2013-09-11.
//  Copyright (c) 2013 Thomas Kimura. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer
@synthesize containerName;



//DESCRIPTION
-(NSString *)description
{
    NSString *descriptionString = [[NSString alloc]initWithFormat:@"%@ is worth %d and contains: %@"
    ,containerName
    ,containerTotalValue
    ,arrayOfItems];
    
    return descriptionString;
}



//SETS CONTAINER ITEMS
-(void)setContainerItems:(BNRItem *)item
{
    containerItems = item;
    
    //Add item names to arrayOfItems
    [arrayOfItems addObject:[containerItems itemName]];
    
    //Captures and calculates total value
    containerTotalValue = containerValue + [containerItems valueInDollars];
}



//SETS ARRAY OF ITEM NAMES
-(void)setArrayOfItems:(NSMutableArray *)names
{
    //Takes emptyArray to be used
    arrayOfItems = names;
}


//SETS VALUE OF CONTAINER ITSELF
-(void)setContainerValue:(int)i
{
    containerValue = i;
}

@end
