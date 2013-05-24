//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

@interface UIImage (___PACKAGENAMEASIDENTIFIER___)

+ (UIImage *)imageFromColor:(UIColor *)color;
+ (UIImage *)imageFromColor:(UIColor *)color toColor:(UIColor *)toColor size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;
+ (UIImage *)imageFromColors:(NSArray *)colors locations:(NSArray *)locationsObjects size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;
+ (UIImage *)imageFromSize:(CGSize)size block:(void(^)(CGContextRef))block;

@end
