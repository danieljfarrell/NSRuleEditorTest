//
//  AppDelegate.h
//  RuleTest1
//
//  Created by Daniel Farrell on 09/02/2013.
//  Copyright (c) 2013 d. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RuleEditor.h"

/* Example code based on @kainjow http://forums.macrumors.com/showthread.php?t=948727 */

@interface AppDelegate : NSObject <NSApplicationDelegate, NSRuleEditorDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong) NSMutableArray *criteria;
@property (weak) IBOutlet RuleEditor *editor;
- (IBAction)editorChanged:(id)sender;

@end
