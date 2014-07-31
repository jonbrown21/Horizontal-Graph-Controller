//
//  GraphController.h
//  iTunes Table Header
//
//  Created by Jon Brown on 12/1/13.
//  Copyright (c) 2013 Jon Brown Designs. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface GraphController : WebView

@property (assign) IBOutlet id iArrayController;
@property (assign) IBOutlet NSTextField *textField, *textField2, *textField3;
@property (assign) IBOutlet NSTableView *tableView;

- (IBAction)refreshData:(id)sender;
@end
