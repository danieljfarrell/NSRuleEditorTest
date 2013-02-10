//
//  Criterion.h
//  RuleEditorTest
//

#import <Cocoa/Cocoa.h>


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
