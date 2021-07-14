#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Pizza : NSObject

@property (nonatomic, readonly) PizzaSize pizzaSize;
@property (nonatomic, readonly) NSArray *toppings;

- (instancetype)initWithPizzaSize:(PizzaSize) pizzaSize withToppings:(NSArray *)toppings;

@end

NS_ASSUME_NONNULL_END
