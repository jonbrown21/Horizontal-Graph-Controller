//
//  GraphController.h
//  iTunes Table Header
//
//  Created by Jon Brown on 12/1/13.
//  Copyright (c) 2013 Jon Brown Designs. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface GraphController : WebView
{
    IBOutlet id iArrayController;
    IBOutlet NSTextField *textField;
    IBOutlet NSTextField *textField2;
    IBOutlet NSTextField *textField3;
    IBOutlet NSTextField *textField4;
    IBOutlet NSTextField *textField5;
    IBOutlet NSTextField *textField6;
    IBOutlet NSTableView *tableView;
}
- (IBAction)refreshData:(id)sender;


@end
