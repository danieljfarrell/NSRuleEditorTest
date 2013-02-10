//
//  RuleEditor.m
//  RuleTest1
//
//  Created by Daniel Farrell on 09/02/2013.
//  Copyright (c) 2013 d. All rights reserved.
//

#import "RuleEditor.h"

@implementation RuleEditor

/* See header for explaination */

-(void) setAction:(SEL)aSelector{
    _savedAction = aSelector;
    [super setAction:aSelector];
}

- (SEL)action{
    return _savedAction;
}

-(void) setTarget:(id)anObject {
    [super setTarget:anObject];
    _savedTarget = anObject;
}

-(id) target{
    return _savedTarget;
}

-(void) keyDown:(NSEvent *)theEvent {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

-(BOOL) acceptsFirstResponder {
    return YES;
}

@end

