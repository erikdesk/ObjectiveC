#import "Kitchen.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(PizzaSize)pizzaSize toppings:(NSArray *)toppings
{
    Pizza *newPizza;
    if (_delegate) {
        if ([[self delegate] kitchen:self shouldMakePizzaOfSize:pizzaSize andToppings:toppings]) {
            if ([[self delegate] kitchenShouldUpgradeOrder:self]) {
                newPizza = [[Pizza alloc] initWithPizzaSize:Large withToppings:toppings];
            } else {
                newPizza = [[Pizza alloc] initWithPizzaSize:pizzaSize withToppings:toppings];
            }
            if ([[self delegate] respondsToSelector:@selector(kitchenDidMakePizza:)]) {
                [[self delegate] kitchenDidMakePizza:newPizza];
            }
            return newPizza;
            
        } else {
            // don't make pizza.
            return NULL;
        }
    } else {
        // no delegate.
        return NULL;
    }
}

@end
