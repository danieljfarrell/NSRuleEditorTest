//
//  AppDelegate.m
//  RuleTest1
//
//  Created by Daniel Farrell on 09/02/2013.
//  Copyright (c) 2013 d. All rights reserved.
//

#import "AppDelegate.h"
#import "Criterion.h"

@implementation AppDelegate

- (id)init
{
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

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [_editor setTarget:_windowController];
    [_editor setAction:@selector(editorChanged:)];
    NSLog(@"editor NR %@", [_editor nextResponder]);
    NSLog(@"Window NR %@", [_window nextResponder]);
}


- (NSInteger)ruleEditor:(NSPredicateEditor *)editor numberOfChildrenForCriterion:(id)criterion withRowType:(NSRuleEditorRowType)rowType
{
	if (criterion == nil)
		return [_criteria count];
	return [criterion numberOfChildren];
}

- (id)ruleEditor:(NSPredicateEditor *)editor child:(NSInteger)index forCriterion:(id)criterion withRowType:(NSRuleEditorRowType)rowType
{
	if (criterion == nil)
		return [_criteria objectAtIndex:index];
	return [criterion childAtIndex:index];
}

- (id)ruleEditor:(NSPredicateEditor *)editor displayValueForCriterion:(id)criterion inRow:(NSInteger)row
{
	return [criterion displayValue];
}


- (void)ruleEditorRowsDidChange:(NSNotification *)notification {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"%@", notification);
    RuleEditor *ruleEditor = notification.object;
    NSLog(@"selected cell: %@", [ruleEditor selectedCell]);
    NSLog(@"selected row indexes: %@", [ruleEditor selectedRowIndexes]);
    NSLog(@"criteria for row: %@", [ruleEditor criteriaForRow:0]);
    NSLog(@"displayValuesForRow: %@", [ruleEditor displayValuesForRow:0]);
}

@end
