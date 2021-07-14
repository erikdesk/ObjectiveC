#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GreeterDelegate <NSObject>

@required
- (BOOL)shouldSayHello;

@optional

@end

@interface Greeter : NSObject

@property (nonatomic, weak) id<GreeterDelegate> delegate;

- (void)sayHello;

@end

NS_ASSUME_NONNULL_END
