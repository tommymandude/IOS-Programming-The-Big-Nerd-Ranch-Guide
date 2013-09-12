//
//  BNRContainer.h
//  RandomPossesion
//
//  Created by Thomas Kimura on 2013-09-11.
//  Copyright (c) 2013 Thomas Kimura. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem
{
    //Name of the container
    NSString *containerName;
    
    //Individual subitems of container
    BNRItem *containerItems;
    
    //Array where master array will live
    NSMutableArray *arrayOfItems;
    
    //values of the container
    int containerValue;
    int containerTotalValue;
}

@property (strong, nonatomic) NSString *containerName;

-(void)setContainerItems:(BNRItem *)item;
-(void)setArrayOfItems:(NSMutableArray *)names;
-(void)setContainerValue:(int)i;


@end
