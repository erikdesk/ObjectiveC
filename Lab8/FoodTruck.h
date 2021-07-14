#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class FoodTruck;

@protocol FoodTruckDelegate <NSObject>

- (double)foodTruck: (FoodTruck *) truck priceForFood: (NSString *) food;

@end

@interface FoodTruck : NSObject

@property (nonatomic, weak) id<FoodTruckDelegate> delegate;

- (instancetype)initWithName:(NSString *)name andFoodType:(NSString *)foodType;
- (void)serve:(int)orders;
- (void)cashOut;

@end

NS_ASSUME_NONNULL_END
