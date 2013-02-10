//
//  MainWindowController.h
//  RuleTest1
//
//  Created by Daniel Farrell on 09/02/2013.
//  Copyright (c) 2013 d. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainWindowController : NSObject <NSWindowDelegate>
@property (unsafe_unretained) IBOutlet NSWindow *window;
- (IBAction)editorChanged:(id)sender;

@end
