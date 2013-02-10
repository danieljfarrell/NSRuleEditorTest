//
//  MainWindowController.m
//  RuleTest1
//
//  Created by Daniel Farrell on 09/02/2013.
//  Copyright (c) 2013 d. All rights reserved.
//

#import "MainWindowController.h"

@implementation MainWindowController

- (IBAction)editorChanged:(id)sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
     NSEvent *event = [NSApp currentEvent];
    NSLog(@"%@", event);
    if ([event type] == NSKeyDown) {
        NSString *characters = [event characters];
        NSLog(@"%@", characters);
    }
}
@end
