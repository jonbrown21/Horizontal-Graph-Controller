//
//  AppDelegate.h
//  iTunes Table Header
//
//  Created by Jon Brown on 11/1/13.
//  Copyright (c) 2013 Jon Brown Designs. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    IBOutlet NSTableView *tableView;
    IBOutlet WebView* webView;
}


@property (assign) IBOutlet NSWindow *window;


@end
