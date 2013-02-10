//
//  RuleEditor.h
//  RuleTest1
//
//  Created by Daniel Farrell on 09/02/2013.
//  Copyright (c) 2013 d. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/* The only reason I have subsclassed NSRuleEditor is 
  because I noticed the target action was not firing.
  Is this a bug?
 
  This subclass intercepts the -setAction:, -action
  -setTarget: and -target methods and stores 'saved'
  versions as instance variables. The saved version
  are returned during target/action. It's very odd.
*/

@interface RuleEditor : NSRuleEditor
@property (assign) SEL savedAction;
@property (weak) id savedTarget;
@end
