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
+ (id)criterionWithName:(NSString *)name child:(id)child;

@property (readwrite, copy) NSString *name;

- (void)addChild:(id)child;

- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;

- (id)displayValue;

@end
