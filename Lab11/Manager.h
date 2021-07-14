#import <Foundation/Foundation.h>
#import "Kitchen.h"
//#import "DeliveryService.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ManagerDelegate <NSObject>

- (void)deliverPizza:(Pizza *)pizza;

@end

@interface Manager : NSObject<KitchenDelegate>

@property (nonatomic, weak) id<ManagerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
