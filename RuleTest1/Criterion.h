//
//  Criterion.h
//  RuleEditorTest
//

#import <Cocoa/Cocoa.h>

/* Example code from @kainjow http://forums.macrumors.com/showthread.php?t=948727 */

@interface Criterion : NSObject
{
	NSString *name;
	NSMutableArray *children;
}

+ (id)criterion;
+ (id)criterionWithName:(NSString *)name;
+ (id)criterionWithName:(NSString *)name children:(id)children, ...;

@property (readwrite, copy) NSString *name;

- (void)addChild:(id)child;
- (NSUInteger)numberOfChildren;
- (id)childAtIndex:(NSUInteger)index;

- (id)displayValue;

@end


@interface SeparatorCriterion : Criterion
@end


@interface TextFieldCriterion : Criterion
@end
