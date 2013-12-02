//
//  GraphController.m
//  iTunes Table Header
//
//  Created by Jon Brown on 12/1/13.
//  Copyright (c) 2013 Jon Brown Designs. All rights reserved.
//

#import "GraphController.h"

@implementation GraphController

-(void)drawGraphFromSelectedList
{
    
    //Convert the item1 into an Integer
    
    NSString *item1 = [textField stringValue];
    
    //Convert the item2 into an Integer
    
    NSString *item2 = [textField2 stringValue];
    
    //Convert the item3 into an Integer
    
    NSString *item3 = [textField3 stringValue];
    
    //pass that to webview with javascript
    NSString *javascriptString = [NSString stringWithFormat:@"myFunction('%@','%@','%@')", item1, item2, item3];
    
    [self stringByEvaluatingJavaScriptFromString:javascriptString];
    
    
    
}

- (void) drawRect: (NSRect) rect
{
    
    [ self drawGraphFromSelectedList ];
    
    
}

- (void)awakeFromNib
{
    [iArrayController addObserver:self forKeyPath:@"arrangedObjects"
                            options: NSKeyValueObservingOptionNew  context:NULL];
    
    
}

- (IBAction)refreshData:(id)sender {
    
    [tableView reloadData];
    [ self drawGraphFromSelectedList ];
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context
{
    
    if ([keyPath isEqual:@"arrangedObjects"])
    {
        [ self setNeedsDisplay: YES ];
    }
}

@end
