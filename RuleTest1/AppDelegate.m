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

- (id)init{
    self = [super init];
    if (self) {
        
        _criteria = [[NSMutableArray alloc] init];
        
        [_criteria addObject:[Criterion criterionWithName:@"From" children:
                             [Criterion criterionWithName:@"Contains" children:[TextFieldCriterion criterion], nil],
                             [Criterion criterionWithName:@"Ends with" children:[TextFieldCriterion criterion], nil],
                             nil]];
        [_criteria addObject:[Criterion criterionWithName:@"To" children:
                             [Criterion criterionWithName:@"Contains" children:[TextFieldCriterion criterion], nil],
                             [Criterion criterionWithName:@"Ends with" children:[TextFieldCriterion criterion], nil],
                             nil]];
        [_criteria addObject:[SeparatorCriterion criterion]];
        [_criteria addObject:[Criterion criterionWithName:@"Message Type" children:
                             [Criterion criterionWithName:@"is" children:
                              [Criterion criterionWithName:@"Mail"],
                              [Criterion criterionWithName:@"Note"],
                              [Criterion criterionWithName:@"RSS"],
                              nil],
                             nil]];
        [_criteria addObject:[SeparatorCriterion criterion]];
        [_criteria addObject:[Criterion criterionWithName:@"Message is Junk Mail"]];
        [_criteria addObject:[SeparatorCriterion criterion]];
        [_criteria addObject:[Criterion criterionWithName:@"Account" children:
                             [Criterion criterionWithName:@"steve@apple.com"],
                             [Criterion criterionWithName:@"bill@microsoft.com"],
                             nil]];
    }
    return self;
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [_editor addRow:self];
}


- (NSInteger)ruleEditor:(NSPredicateEditor *)editor numberOfChildrenForCriterion:(id)criterion withRowType:(NSRuleEditorRowType)rowType {
	if (criterion == nil)
		return [_criteria count];
	return [criterion numberOfChildren];
}

- (id)ruleEditor:(NSPredicateEditor *)editor child:(NSInteger)index forCriterion:(id)criterion withRowType:(NSRuleEditorRowType)rowType {
	if (criterion == nil)
		return [_criteria objectAtIndex:index];
	return [criterion childAtIndex:index];
}

- (id)ruleEditor:(NSPredicateEditor *)editor displayValueForCriterion:(id)criterion inRow:(NSInteger)row {
	return [criterion displayValue];
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
        NSLog(@"Display values for row #%ld:\n %@", idx, [ruleEditor displayValuesForRow:idx]); /* Is this really to row the user is editing? */
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
