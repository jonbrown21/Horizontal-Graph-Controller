//
//  iArrayController.m
//  iTunes Table Header
//
//  Created by Jon Brown on 11/1/13.
//  Copyright (c) 2013 Jon Brown Designs. All rights reserved.
//

#import "iArrayController.h"

@implementation iArrayController

-(void)awakeFromNib { 	//Sorting at startup

	[self setSortDescriptors:@[[NSSortDescriptor.alloc initWithKey:@"artist" ascending:YES selector:@selector(compare:)]]];

	[super awakeFromNib]; 	//need to initialize the array

  for (NSArray *k in @[ @[ @"rating",  textField  ],   //bind text colums to tex fields.
                        @[ @"time",    textField2 ],
                        @[ @"track",   textField3 ]])

    [k[1] bind:@"value" toObject:self withKeyPath:[@"arrangedObjects.@sum." stringByAppendingString:k[0]] options:nil];
}

@end
