//
//  RuleEditor.h
//  RuleTest1
//
//  Created by Daniel Farrell on 09/02/2013.
//  Copyright (c) 2013 d. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RuleEditor : NSRuleEditor
@property (unsafe_unretained) SEL savedAction;
@property (weak) id savedTarget;
@end
