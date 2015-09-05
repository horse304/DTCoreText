//
//  DTTextBlock.m
//  DTCoreText
//
//  Created by Oliver Drobnik on 04.03.12.
//  Copyright (c) 2012 Drobnik.com. All rights reserved.
//

#import "DTTextBlock.h"
#import "NSCoder+DTCompatibility.h"

@implementation DTTextBlock
{
	DTEdgeInsets _padding;
	DTEdgeInsets _margin;
	CGFloat _width;
	DTColor *_backgroundColor;
	DTEdgeInsets _borderWidth;
	DTColor *_borderColor;
	CGFloat _borderRadius;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = [super init];
	if (self) {
		_padding = [aDecoder decodeDTEdgeInsetsForKey:@"padding"];
		_margin = [aDecoder decodeDTEdgeInsetsForKey:@"margin"];
		_width = [aDecoder decodeDoubleForKey:@"width"];
		_backgroundColor = [aDecoder decodeObjectForKey:@"backgroundColor"];
		_borderWidth = [aDecoder decodeDTEdgeInsetsForKey:@"borderWidth"];
		_borderColor = [aDecoder decodeObjectForKey:@"borderColor"];
		_borderRadius = [aDecoder decodeDoubleForKey:@"borderRadius"];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeDTEdgeInsets:_padding forKey:@"padding"];
	[aCoder encodeDTEdgeInsets:_margin forKey:@"margin"];
	[aCoder encodeDouble:_width forKey:@"width"];
	[aCoder encodeObject:_backgroundColor forKey:@"backgroundColor"];
	[aCoder encodeDTEdgeInsets:_borderWidth forKey:@"borderWidth"];
	[aCoder encodeObject:_borderColor forKey:@"borderColor"];
	[aCoder encodeDouble:_borderRadius forKey:@"borderRadius"];
}

- (NSUInteger)hash
{
	NSUInteger calcHash = 7;
	
	calcHash = calcHash*31 + [_backgroundColor hash];
	calcHash = calcHash*31 + (NSUInteger)_padding.left;
	calcHash = calcHash*31 + (NSUInteger)_padding.top;
	calcHash = calcHash*31 + (NSUInteger)_padding.right;
	calcHash = calcHash*31 + (NSUInteger)_padding.bottom;
	calcHash = calcHash*31 + (NSUInteger)_margin.left;
	calcHash = calcHash*31 + (NSUInteger)_margin.top;
	calcHash = calcHash*31 + (NSUInteger)_margin.right;
	calcHash = calcHash*31 + (NSUInteger)_margin.bottom;
	calcHash = calcHash*31 + (NSUInteger)_width;
	calcHash = calcHash*31 + (NSUInteger)_borderWidth.top;
	calcHash = calcHash*31 + (NSUInteger)_borderWidth.left;
	calcHash = calcHash*31 + (NSUInteger)_borderWidth.bottom;
	calcHash = calcHash*31 + (NSUInteger)_borderWidth.right;
	calcHash = calcHash*31 + [_borderColor hash];
	calcHash = calcHash*31 + (NSUInteger)_borderRadius;
	
	return calcHash;
}

- (BOOL)isEqual:(id)object
{
	if (!object)
	{
		return NO;
	}
	
	if (object == self)
	{
		return YES;
	}
	
	if (![object isKindOfClass:[DTTextBlock class]])
	{
		return NO;
	}
	
	DTTextBlock *other = object;
	
	if (_padding.left != other->_padding.left ||
		_padding.top != other->_padding.top ||
		_padding.right != other->_padding.right ||
		_padding.bottom != other->_padding.bottom)
	{
		return NO;
	}
	
	if (_margin.left != other->_margin.left ||
		_margin.top != other->_margin.top ||
		_margin.right != other->_margin.right ||
		_margin.bottom != other->_margin.bottom)
	{
		return NO;
	}
	
	if (other->_width != _width)
	{
		return NO;
	}
	
	if (_borderWidth.left != other->_borderWidth.left ||
		_borderWidth.top != other->_borderWidth.top ||
		_borderWidth.right != other->_borderWidth.right ||
		_borderWidth.bottom != other->_borderWidth.bottom)
	{
		return NO;
	}
	
	if (other->_borderColor != _borderColor)
	{
		return NO;
	}
	
	if (other->_borderRadius != _borderRadius)
	{
		return NO;
	}
	
	if (other->_backgroundColor == _backgroundColor)
	{
		return YES;
	}
	
	return [other->_backgroundColor isEqual:_backgroundColor];
}

#pragma mark Properties

@synthesize padding = _padding;
@synthesize margin = _margin;
@synthesize width = _width;
@synthesize backgroundColor = _backgroundColor;
@synthesize borderWidth = _borderWidth;
@synthesize borderColor = _borderColor;
@synthesize borderRadius = _borderRadius;

@end
