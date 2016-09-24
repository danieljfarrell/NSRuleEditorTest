//
//  AppDelegate.m
//  RuleTest1
//
//  Created by Daniel Farrell on 09/02/2013.
//  Copyright (c) 2013 d. All rights reserved.
//

#import "AppDelegate.h"
#import "Criterion.h"

/* Example code based on @kainjow http://forums.macrumors.com/showthread.php?t=948727 */

@implementation AppDelegate

- (NSView *)makeTextField {
#if 1
    NSTextField *tf = [[NSTextField alloc] initWithFrame:NSMakeRect(0,0,60,19)];
    tf.autoresizingMask |= NSViewWidthSizable; // no effect
    tf.controlSize = NSControlSizeSmall;
    tf.action = @selector(editorChanged:);
    return tf;
#else
    NSNib *nib = [[NSNib alloc] initWithNibNamed:@"TextField" bundle:nil];
    NSArray *objs = nil;
    [nib instantiateWithOwner:nil topLevelObjects:&objs];
    for (id obj in objs)
        if ([obj isKindOfClass:[NSTextField class]]) {
            //NSLog(@"textfield responder %@", [(NSTextField*)obj nextResponder]);
            return obj;
    }
#endif
  return nil;
}

- (id)init{
    self = [super init];
    if (self) {
        
        _criteria = [Criterion criterionWithName:@"ROOT" children:        
        [Criterion criterionWithName:@"From" children:
                             [Criterion criterionWithName:@"Contains"  child:[self makeTextField]],
                             [Criterion criterionWithName:@"Ends with" child:[self makeTextField]],
                             nil],
        [Criterion criterionWithName:@"To" children:
                             [Criterion criterionWithName:@"Contains"  child:[self makeTextField]],
                             [Criterion criterionWithName:@"Ends with" child:[self makeTextField]],
                             nil],
        [NSMenuItem separatorItem],
        [Criterion criterionWithName:@"Message Type" children:
                             [Criterion criterionWithName:@"is"
                                        children:@"Mail", @"Note", @"RSS", nil],
                             nil],
        [NSMenuItem separatorItem],
        [Criterion criterionWithName:@"Message is Junk Mail"],
        [NSMenuItem separatorItem],
        [Criterion criterionWithName:@"Account" children:
                             [Criterion criterionWithName:@"steve@apple.com"],
                             [Criterion criterionWithName:@"bill@microsoft.com"],
                             nil],
      nil];
    }
    return self;
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [_editor addRow:self];
}


- (NSInteger)ruleEditor:(NSPredicateEditor *)editor numberOfChildrenForCriterion:(id)_parent withRowType:(NSRuleEditorRowType)rowType {
    id parent = _parent ?: self->_criteria;
    if (![parent respondsToSelector:@selector(count)])
        return 0;
    return [parent count];
}

- (id)ruleEditor:(NSPredicateEditor *)editor child:(NSInteger)index forCriterion:(id)_parent withRowType:(NSRuleEditorRowType)rowType {
    id parent = _parent ?: self->_criteria;
    if (![parent respondsToSelector:@selector(objectAtIndex:)])
        return nil; // has no children
    return [parent objectAtIndex:index];
}

- (id)ruleEditor:(NSPredicateEditor *)editor displayValueForCriterion:(id)criterion inRow:(NSInteger)row {
    if ([criterion respondsToSelector:@selector(displayValue)])
        return [criterion displayValue];
    return criterion;
}


- (void)ruleEditorRowsDidChange:(NSNotification *)notification {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    RuleEditor *ruleEditor = notification.object;
    NSIndexSet *indexes = [ruleEditor selectedRowIndexes];    /* This index set is always empty or doesn't
                                                               correspond to the row that the used is editing.
                                                               If we know the row that is being edited we can
                                                               access the values using -displayValuesForRow:
                                                               without knowing this, how can we responds to 
                                                               user edits? */

    [indexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        NSLog(@"Display values for row #%ld:\n %@", idx,
              [ruleEditor displayValuesForRow:idx]); /* Is this really to row the user is editing? */
    }];
    
    if ([indexes count] == 0) {
        NSLog(@"No rows selected");
    }

}

/* This is the target/action method of the editor, it is 
   called when the editor changes a value. We also connect
   the textfield to this method */
- (IBAction)editorChanged:(id)sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    if ([sender isKindOfClass:[NSTextField class]]) {
        NSTextField *textField = sender;
        NSLog(@"NSTextField fired target/action (takes the new value: %@)", [textField stringValue]);
    }
    
    if ([sender isKindOfClass:[RuleEditor class]]) {
        NSLog(@"RuleEditor fired target/action");
    }
}

@end
