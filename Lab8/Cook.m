#import "Cook.h"

@implementation Cook

- (double)foodTruck:(FoodTruck *)truck priceForFood:(NSString *)food {
    return [food length] * 10;
}

@end
