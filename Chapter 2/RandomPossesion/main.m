//
//  main.m
//  RandomPossesion
//
//  Created by Thomas Kimura on 2013-09-09.
//  Copyright (c) 2013 Thomas Kimura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
            //Empty array where names will live
        NSMutableArray *emptyArray = [[NSMutableArray alloc]init];
    
        //Creating a container
    BNRContainer *container = [[BNRContainer alloc]init];
        
        //Set name and value of container
        [container setContainerName:@"My Awesome Container"];
        [container setContainerValue:169];
        
        //Allows arrayOfItems to access emptyArray
        [container setArrayOfItems:emptyArray];
        
        //Create 10 sub items
        for (int i = 0; i < 10; i++) {
            
            //Randomly generate BNRItem
            BNRItem *item = [BNRItem randomItem];
            
            //Takes BNRItem to be used
            //Add item names to arrayOfItems
            //Takes values from BNRItems to calculate value
            [container setContainerItems:item];
        }

NSLog(@"%@",[container description]);

    }
    return 0;
}

