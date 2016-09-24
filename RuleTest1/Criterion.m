//
//  Criterion.m
//  RuleEditorTest
//

#import "Criterion.h"

/* Example code from @kainjow http://forums.macrumors.com/showthread.php?t=948727 */

@implementation Criterion

@synthesize name;

+ (id)criterion
{
	return [[self class] criterionWithName:nil children:nil];
}

+ (id)criterionWithName:(NSString *)name
{
	return [[self class] criterionWithName:name children:nil];
}

+ (id)criterionWithName:(NSString *)name children:(id)children, ...
{
	Criterion *crit = [[[self class] alloc] init];
	crit.name = name;
	va_list ap;
	va_start(ap, children);
	for (id next = children; next; next = va_arg(ap, id))
		[crit addChild:next];
	va_end(ap);
	return crit;
}
+ (id)criterionWithName:(NSString *)name child:(id)child {
  Criterion *crit = [[[self class] alloc] init];
  crit.name = name;
  [crit addChild:child];
  return crit;
}

- (void)addChild:(id)child
{
	if (!children)
		children = [[NSMutableArray alloc] init];
	[children addObject:child];
}

- (NSUInteger)count
{
	return [children count];
}

- (id)objectAtIndex:(NSUInteger)index
{
	return [children objectAtIndex:index];
}

- (id)displayValue
{
	return self.name;
}

- (NSString *)description
{
	return [[super description] stringByAppendingFormat:@" %@", [self displayValue]];
}

@end
