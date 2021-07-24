#import "StripePaymentService.h"

@implementation StripePaymentService

- (void)processPaymentAmount:(NSInteger)paymentAmount {
    NSLog(@"Stripe processed amount $%ld", (long)paymentAmount);
}

- (BOOL)canProcessPayment {
    const int min = 0;
    const int max = 1;
    return arc4random_uniform((max - min) + 1) + min == 0 ? NO : YES;
}

@end
