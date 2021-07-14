#import <Foundation/Foundation.h>
#import "Pizza.h"
#import "DeliveryService.h"

NS_ASSUME_NONNULL_BEGIN

@interface DeliveryCar : NSObject<DeliveryServiceDelegate>

- (void)deliverPizza:(Pizza *)pizza;

@end

NS_ASSUME_NONNULL_END
