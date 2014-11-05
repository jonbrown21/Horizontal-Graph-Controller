//
//  GraphController.m
//  iTunes Table Header
//
//  Created by Jon Brown on 12/1/13.
//  Copyright (c) 2013 Jon Brown Designs. All rights reserved.
//

#import "GraphController.h"
#import <WebKit/WebKit.h>

@implementation GraphController

-(void)drawGraphFromSelectedList
{
    //Convert the item1 into an Integer
    
    NSString *item1 = [textField stringValue];
    
    //Convert the item2 into an Integer
    
    NSString *item2 = [textField2 stringValue];
    
    //Convert the item3 into an Integer
    
    NSString *item3 = [textField3 stringValue];
    NSString *item4 = [textField4 stringValue];
    NSString *item5 = [textField5 stringValue];
    NSString *item6 = [textField6 stringValue];
    
    //pass that to webview with javascript Bar Graph
    NSString *javascriptString = [NSString stringWithFormat:@"myFunction('%@','%@','%@')", item1, item2, item3];
    
    //pass that to webview with javascript Donut Graph
    NSString *javascriptString2 = [NSString stringWithFormat:@"myFunction2(%@,%@,%@,'%@','%@','%@')", item1, item2, item3, item4, item5, item6];
    
    //pass that to webview with javascript Donut Graph
    NSString *javascriptString3 = [NSString stringWithFormat:@"myFunction3(%@,%@,%@,'%@','%@','%@')", item1, item2, item3, item4, item5, item6];
    
    NSLog(@"%@", javascriptString3);
    
    //pass that to webview with javascript Bar Graph
   [self stringByEvaluatingJavaScriptFromString:javascriptString];
    
    //pass that to webview with javascript Donut Graph
   [self stringByEvaluatingJavaScriptFromString:javascriptString2];
    
    //pass that to webview with javascript Donut Graph
    [self stringByEvaluatingJavaScriptFromString:javascriptString3];
    
    
}

- (void)drawRect:(NSRect)dirtyRect
{
    
[super drawRect:dirtyRect];
    
    // Force graph to reload / redraw on window size and on WebView load.
    
    [self performSelector:@selector(refreshData:) withObject:nil afterDelay:0.25];
    
}

- (void)awakeFromNib
{
    
    [iArrayController addObserver:self forKeyPath:@"arrangedObjects"
                            options: NSKeyValueObservingOptionNew  context:NULL];
    
}

- (IBAction)refreshData:(id)sender {
    
    [tableView reloadData];
    [self drawGraphFromSelectedList];
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context
{
    
    if ([keyPath isEqual:@"arrangedObjects"])
    {
        [self setNeedsDisplay: YES];
    }
}


@end
