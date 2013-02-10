//
//  AppDelegate.h
//  RuleTest1
//
//  Created by Daniel Farrell on 09/02/2013.
//  Copyright (c) 2013 d. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainWindowController.h"
#import "RuleEditor.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, NSRuleEditorDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong) NSMutableArray *criteria;
@property (weak) IBOutlet RuleEditor *editor;
@property (weak) IBOutlet MainWindowController *windowController;

@end
