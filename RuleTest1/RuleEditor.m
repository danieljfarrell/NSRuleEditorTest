//
//  RuleEditor.m
//  RuleTest1
//
//  Created by Daniel Farrell on 09/02/2013.
//  Copyright (c) 2013 d. All rights reserved.
//

#import "RuleEditor.h"

@implementation RuleEditor

-(void) setAction:(SEL)aSelector{
    //NSLog(@"%s", __PRETTY_FUNCTION__);
    //NSLog(@"%@", NSStringFromSelector(aSelector));
    _savedAction = aSelector;
    [super setAction:aSelector];
}

- (SEL)action{
    //NSLog(@"%s", __PRETTY_FUNCTION__);
    SEL theSel = [super action];
    //NSLog(@"original action: %@", NSStringFromSelector(theSel));
    //NSLog(@"saved action: %@", NSStringFromSelector(_savedAction));
    return _savedAction;
}

-(void) setTarget:(id)anObject {
    //NSLog(@"%s", __PRETTY_FUNCTION__);
    //NSLog(@"%@", anObject);
    [super setTarget:anObject];
    _savedTarget = anObject;
}

-(id) target{
    //NSLog(@"%s", __PRETTY_FUNCTION__);
    //id tar = [super target];
    //NSLog(@"original target: %@", tar);
    //NSLog(@"saved target: %@", _savedTarget);
    return _savedTarget;
}

-(void) keyDown:(NSEvent *)theEvent {
NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"%@", theEvent);
    NSLog(@"next responder %@", self.nextResponder);
    
}

-(BOOL) acceptsFirstResponder {
    return YES;
}

@end

