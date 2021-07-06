#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Box : NSObject

@property (nonatomic) float height;
@property (nonatomic) float width;
@property (nonatomic) float length;

- (instancetype)initWithHeight: (float) height andWidth: (float) width andLength: (float) length;
- (float) volume;
- (int) fitWithBox: (Box *) innerBox;

@end

NS_ASSUME_NONNULL_END
