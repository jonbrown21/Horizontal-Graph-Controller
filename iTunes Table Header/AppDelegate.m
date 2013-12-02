//
//  AppDelegate.m
//  iTunes Table Header
//
//  Created by Jon Brown on 11/1/13.
//  Copyright (c) 2013 Jon Brown Designs. All rights reserved.
//

#import "AppDelegate.h"
#import "iHeaderStyle.h"
#import <WebKit/WebKit.h>

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

-(void)awakeFromNib
{
    /* set preference defaults */
    [[NSUserDefaults standardUserDefaults] registerDefaults:
     [NSDictionary dictionaryWithObject: [NSNumber numberWithBool: YES]
                                 forKey: @"NSDisabledCharacterPaletteMenuItem"]];
   
    NSArray *columns = [tableView tableColumns];
    NSEnumerator *cols = [columns objectEnumerator];
    NSTableColumn *col = nil;
    
    iHeaderStyle *iHeaderCell;
    
    while (col = [cols nextObject]) {
        iHeaderCell = [[iHeaderStyle alloc]
                       initTextCell:[[col headerCell] stringValue]];
        [col setHeaderCell:iHeaderCell];
        [iHeaderCell release];
    }
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSString *html = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:nil];
    [[[webView mainFrame] frameView] setAllowsScrolling:NO];
    [[webView mainFrame] loadHTMLString:html baseURL:[[NSBundle mainBundle] resourceURL]];
    [webView setDrawsBackground:NO];
    
    
}




@end
