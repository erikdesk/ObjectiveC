// https://forums.macrumors.com/threads/converting-an-int-into-an-nsnumber-then-saving-to-an-array.547952/

#import <Foundation/Foundation.h>
#import "PaymentGateway.h"
#import "PaypalPaymentService.h"
#import "StripePaymentService.h"
#import "AmazonPaymentService.h"
#import "ApplePaymentService.h"

NSString *getUserInput(int maxLength, NSString *prompt) {
    if (maxLength < 1) {
        maxLength = 255;
    }
    NSLog(@"%@", prompt);
    
    char inputChars[maxLength];
    char *result = fgets(inputChars, maxLength, stdin);
    
    if (result != NULL) {
        NSString *string = [NSString stringWithUTF8String:inputChars];
        NSCharacterSet *whiteSpaceCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        return [string stringByTrimmingCharactersInSet:whiteSpaceCharacterSet];
    }
    return NULL;
}

NSInteger getNumber(NSString *inputString) {
    NSCharacterSet *nonNumberCharacterSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSRange characterRange = [inputString rangeOfCharacterFromSet:nonNumberCharacterSet];
    BOOL isAllDigits = characterRange.location == NSNotFound;
    
    if (!isAllDigits) {
        NSLog(@"Input cannot be converted to an integer.");
    }
    NSInteger convertedNumber = [inputString intValue];
    return convertedNumber;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        const int min = 101;
        const int max = 999;
        NSInteger dollarTotal = arc4random_uniform((max - min) + 1) + min;
        
        NSString *prompt = [NSString stringWithFormat:@"Thank you for shopping at Acme.com. Your total today is $%ld. Please select your payment method:\n1: Paypal\n2: Stripe\n3: Amazon\n4: Apple", dollarTotal];
        NSString *userInputString = getUserInput(255, prompt);
        NSInteger userInputNumber = getNumber(userInputString);
        
        PaymentGateway *paymentGateway = [PaymentGateway new];
        
        PaypalPaymentService *paypalPaymentService = [PaypalPaymentService new];
        StripePaymentService *stripePaymentService = [StripePaymentService new];
        AmazonPaymentService *amazonPaymentService = [AmazonPaymentService new];
        ApplePaymentService *applePaymentService = [ApplePaymentService new];
        
        switch (userInputNumber) {
            case 1:
                paymentGateway.paymentDelegate = paypalPaymentService;
                break;
            case 2:
                paymentGateway.paymentDelegate = stripePaymentService;
                break;
            case 3:
                paymentGateway.paymentDelegate = amazonPaymentService;
                break;
            case 4:
                paymentGateway.paymentDelegate = applePaymentService;
                break;
            default:
                NSLog(@"Invalid selection!");
                break;
        }
        [paymentGateway processPaymentAmount:dollarTotal];
    }
    return 0;
}
