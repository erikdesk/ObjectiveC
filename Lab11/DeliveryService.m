#import "DeliveryService.h"

@implementation DeliveryService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _deliveredPizzas = [NSMutableArray new];
    }
    return self;
}

- (void)deliverPizza:(Pizza *)pizza {
    [_deliveredPizzas addObject:pizza];
    [[self delegate] deliverPizza:pizza];
}

@end
