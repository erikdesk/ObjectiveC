#import "PaymentGateway.h"

@implementation PaymentGateway

- (void)processPaymentAmount:(NSInteger)paymentAmount {
    if ([self.paymentDelegate canProcessPayment]) {
        [self.paymentDelegate processPaymentAmount:paymentAmount];
    } else {
        NSLog(@"Payment method unavailable.");
    }
}

@end
