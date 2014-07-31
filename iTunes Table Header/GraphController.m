//
//  GraphController.m
//  iTunes Table Header
//
//  Created by Jon Brown on 12/1/13.
//  Copyright (c) 2013 Jon Brown Designs. All rights reserved.
//

#import "GraphController.h"

@implementation GraphController

-(void)drawGraphFromSelectedList {
    
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"myFunction('%@','%@','%@')", _textField.stringValue, _textField2.stringValue, _textField3.stringValue]];
}

- (void) drawRect:(NSRect) rect {
    
    [ self drawGraphFromSelectedList ];
}

- (void)awakeFromNib {

  [_iArrayController addObserver:self forKeyPath:@"arrangedObjects" options: NSKeyValueObservingOptionNew context:NULL];

  [NSNotificationCenter.defaultCenter addObserverForName:NSControlTextDidEndEditingNotification object:nil
                                                   queue:NSOperationQueue.mainQueue         usingBlock:^(NSNotification*n) {
    [self drawGraphFromSelectedList];
  }];
}

- (IBAction)refreshData:(id)sender {
    
    [_tableView reloadData];
    [self drawGraphFromSelectedList];
}

- (void)observeValueForKeyPath:(NSString*)keyPath   ofObject:(id)object
                        change:(NSDictionary*)change context:(void *)context
{
    
    if ([keyPath isEqual:@"arrangedObjects"]) [self setNeedsDisplay: YES ];
}

@end
