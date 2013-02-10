//
//  Criterion.m
//  RuleEditorTest
//

#import "Criterion.h"


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


- (void)addChild:(id)child
{
	if (!children)
		children = [[NSMutableArray alloc] init];
	[children addObject:child];
}

- (NSUInteger)numberOfChildren
{
	return [children count];
}

- (id)childAtIndex:(NSUInteger)index
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


@implementation SeparatorCriterion

- (id)displayValue
{
	return [NSMenuItem separatorItem];
}

@end


@implementation TextFieldCriterion

- (id)displayValue
{
	NSNib *nib = [[NSNib alloc] initWithNibNamed:@"TextField" bundle:nil];
	NSArray *objs = nil;
	//[nib instantiateNibWithOwner:nil topLevelObjects:&objs];
    [nib instantiateWithOwner:nil topLevelObjects:&objs];
	for (id obj in objs)
		if ([obj isKindOfClass:[NSTextField class]]) {
            NSLog(@"textfield responder %@", [(NSTextField*)obj nextResponder]);
            return obj;
            
        }
	return nil;
}

@end
