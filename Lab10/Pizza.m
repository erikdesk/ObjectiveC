#import "Pizza.h"

@interface Pizza ()

@end

@implementation Pizza

- (instancetype)initWithPizzaSize:(PizzaSize) pizzaSize withToppings:(NSArray *)toppings
{
    self = [super init];
    if (self) {
        _pizzaSize = pizzaSize;
        _toppings = toppings;
    }
    return self;
}

@end
