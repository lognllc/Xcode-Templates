//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

@interface UIColor (Hex)

+ (UIColor *)hexRGB:(NSUInteger)hex;
+ (UIColor *)hexWhite:(NSUInteger)hex;

+ (UIColor *)hexRGB:(NSUInteger)hex alpha:(CGFloat)alpha;
+ (UIColor *)hexWhite:(NSUInteger)hex alpha:(CGFloat)alpha;

@end
