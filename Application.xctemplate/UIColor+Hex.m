//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)hexRGB:(NSUInteger)hex
{
	return [self hexRGB:hex alpha:1];
}

+ (UIColor *)hexWhite:(NSUInteger)hex
{
	return [self hexWhite:hex alpha:1];
}

+ (UIColor *)hexWhite:(NSUInteger)hex alpha:(CGFloat)alpha
{
	CGFloat r = hex/255.f;
	return [UIColor colorWithWhite:r alpha:alpha];
}

+ (UIColor *)hexRGB:(NSUInteger)hex alpha:(CGFloat)alpha
{
	CGFloat ff = 255.f;
	CGFloat r = ((hex & 0xff0000) >> 16) / ff;
	CGFloat g = ((hex & 0xff00) >> 8) / ff;
	CGFloat b = (hex & 0xff) / ff;
	return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}

@end
