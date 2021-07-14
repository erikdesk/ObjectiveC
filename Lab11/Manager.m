#import "Manager.h"

@implementation Manager

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)pizzaSize andToppings:(NSArray *)toppings {
    return ![toppings containsObject: @"anchovies"];
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
    return NO;
}

- (void)kitchenDidMakePizza:(Pizza *)pizza {
    NSLog(@"Pizza ready!");
    [[self delegate] deliverPizza:pizza];
}

@end
