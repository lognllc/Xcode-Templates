//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

@implementation UIImage (___PACKAGENAMEASIDENTIFIER___)

+ (UIImage *)imageFromColor:(UIColor *)color
{
	return [self imageFromSize:CGSizeMake(1, 1) block:^(CGContextRef context) {
		CGRect rect = CGRectMake(0, 0, 1, 1);
		CGContextSetFillColorWithColor(context, [color CGColor]);
		CGContextFillRect(context, rect);
	}];
}

+ (UIImage *)imageFromSize:(CGSize)size block:(void(^)(CGContextRef))block
{
	UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
	CGContextRef context = UIGraphicsGetCurrentContext();
	block(context);
	UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return img;
}

+ (UIImage *)imageFromColors:(NSArray *)colors locations:(NSArray *)locationsObjects size:(CGSize)size cornerRadius:(CGFloat)cornerRadius
{
	return [self imageFromSize:size block:^(CGContextRef context) {
		CGRect rect = (CGRect){.size = size};
		UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
		CGContextAddPath(context, path.CGPath);
		
		NSMutableArray *convertedColorArray = [NSMutableArray arrayWithCapacity:colors.count];
		for (UIColor *color in colors) {
			[convertedColorArray addObject:(__bridge id)[color CGColor]];
		}
		
		CGFloat locations[locationsObjects.count];
		for (int i = 0; i < locationsObjects.count; i++) {
			locations[i] = [locationsObjects[i] floatValue];
		}
		CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
		CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)convertedColorArray, locations);
		CFRelease(colorSpace);
		CGContextClip(context);
		CGContextDrawLinearGradient(context, gradient, CGPointMake(0.5, 0), CGPointMake(0.5, size.height), 0);
		CFRelease(gradient);
	}];
}

+ (UIImage *)imageFromColor:(UIColor *)color toColor:(UIColor *)toColor size:(CGSize)size cornerRadius:(CGFloat)cornerRadius
{
	return [self imageFromColors:@[color, toColor] locations:@[@0, @1] size:size cornerRadius:cornerRadius];
}

@end
