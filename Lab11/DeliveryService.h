#import <Foundation/Foundation.h>
#import "Pizza.h"
#import "Manager.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DeliveryServiceDelegate <NSObject>

- (void)deliverPizza:(Pizza *)pizza;

@end

@interface DeliveryService : NSObject<ManagerDelegate>

@property (nonatomic, weak) id<DeliveryServiceDelegate> delegate;
@property (nonatomic) NSMutableArray *deliveredPizzas;

@end

NS_ASSUME_NONNULL_END
