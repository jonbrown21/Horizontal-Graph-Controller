//
//  iArrayController.m
//  iTunes Table Header
//
//  Created by Jon Brown on 11/1/13.
//  Copyright (c) 2013 Jon Brown Designs. All rights reserved.
//

#import "iArrayController.h"

@implementation iArrayController

-(void)awakeFromNib
{
	//Sorting at startup
	NSSortDescriptor* SortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"artist"
                                                                    ascending:YES selector:@selector(compare:)] autorelease];
	[self setSortDescriptors:[NSArray arrayWithObject:SortDescriptor]];
    
	//need to initialize the array
	[super awakeFromNib];
    
    //bind text colums to tex fields.
    [textField bind: @"value" toObject: self
              withKeyPath:@"arrangedObjects.@sum.rating" options:nil];
    
    [textField2 bind: @"value" toObject: self
        withKeyPath:@"arrangedObjects.@sum.time" options:nil];
    
    [textField3 bind: @"value" toObject: self
        withKeyPath:@"arrangedObjects.@sum.track" options:nil];

}



@end
