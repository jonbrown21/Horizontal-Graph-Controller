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
    [NSUserDefaults.standardUserDefaults registerDefaults:@{@"NSDisabledCharacterPaletteMenuItem":@YES}];

    for (NSTableColumn *col in tableView.tableColumns) //    iHeaderStyle *iHeaderCell;
        [col setHeaderCell:[iHeaderStyle.alloc initTextCell:[col.headerCell stringValue]]];

    webView.drawsBackground = webView.mainFrame.frameView.allowsScrolling = NO;
    [webView.mainFrame loadHTMLString:[NSString stringWithContentsOfFile:
                                    [NSBundle.mainBundle pathForResource:@"index" ofType:@"html"]
                                                                encoding:NSUTF8StringEncoding error:nil]
                                                                 baseURL:NSBundle.mainBundle.resourceURL];

    
    
}




@end
