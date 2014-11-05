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
    
    
    NSView *view = webView;
    [view setWantsLayer:YES];
    [myView addSubview:view];
    
    NSRect aFrame = [_window frame];
    aFrame.origin.y += (aFrame.size.height  - 150) ;
    aFrame.size.height = 340 ;  //original size is 400
    [_window setFrame:aFrame display:YES animate:YES];
    
    
}

- (IBAction)changeOperation:(id)sender {
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSString *html = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:nil];
    NSURL *url = [NSURL fileURLWithPath:path1];
    
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"pie-index" ofType:@"html"];
    NSString *html2 = [NSString stringWithContentsOfFile:path2 encoding:NSUTF8StringEncoding error:nil];
    NSURL *url2 = [NSURL fileURLWithPath:path2];
    
    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"fullpie-index" ofType:@"html"];
    NSString *html3 = [NSString stringWithContentsOfFile:path3 encoding:NSUTF8StringEncoding error:nil];
    NSURL *url3 = [NSURL fileURLWithPath:path3];
    
     NSRect aFrame = [_window frame];
    
    long operation;
    
    operation = [typeField selectedTag];
    
    switch (operation) {
        case 0:
            
            [[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:url]];
            
           
            aFrame.origin.y += (aFrame.size.height  - 500) ;
            aFrame.size.height = 340 ;  //original size is 400
            [_window setFrame:aFrame display:YES animate:YES];
            
            break;
        case 1:
            
            [[[webView mainFrame] frameView] setAllowsScrolling:NO];
            [[webView mainFrame] loadHTMLString:html2 baseURL:[[NSBundle mainBundle] resourceURL]];
            [[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:url2]];
            [webView setDrawsBackground:NO];
            NSLog(@"Donut");
            
            aFrame.origin.y += (aFrame.size.height  - 300) ;
            aFrame.size.height = 490 ;  //original size is 400
            [_window setFrame:aFrame display:YES animate:YES];
            
            break;
            
        case 2:
            
            [[[webView mainFrame] frameView] setAllowsScrolling:NO];
            [[webView mainFrame] loadHTMLString:html3 baseURL:[[NSBundle mainBundle] resourceURL]];
            [[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:url3]];
            [webView setDrawsBackground:NO];
            NSLog(@"Full Pie");
            
            aFrame.origin.y += (aFrame.size.height  - 300) ;
            aFrame.size.height = 495 ;  //original size is 400
            [_window setFrame:aFrame display:YES animate:YES];
            
            break;
    }
    
}



@end
