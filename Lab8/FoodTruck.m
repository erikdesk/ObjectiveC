#import "FoodTruck.h"

@interface FoodTruck ()

@property (nonatomic) float earnings;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *foodType;

@end

@implementation FoodTruck

- (instancetype)initWithName:(NSString *)name andFoodType:(NSString *)foodType {
    self = [super init];
    if (self) {
        _name = name;
        _foodType = foodType;
    }
    return self;
}

- (void)serve:(int)orders {
    double price = [self.delegate foodTruck:self priceForFood:self.foodType];

    NSLog(@"Welcome to %@", self.name);
    NSLog(@"We serve %@ for $%0.2f", self.foodType, price);
    NSLog(@" ");

    self.earnings += orders * price;
}

- (void)cashOut {
    NSLog(@"%@ earned %0.2f today!", self.name, self.earnings);
}

@end
