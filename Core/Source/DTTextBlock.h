//
//  DTTextBlock.h
//  DTCoreText
//
//  Created by Oliver Drobnik on 04.03.12.
//  Copyright (c) 2012 Drobnik.com. All rights reserved.
//

#import "DTCompatibility.h"

/**
 Class that represents a block of text with attributes like padding or a background color.
 */
@interface DTTextBlock : NSObject <NSCoding>

/**
 The space to be applied between the layouted text and the edges of the receiver
 */
@property (nonatomic, assign) DTEdgeInsets padding;
@property (nonatomic, assign) DTEdgeInsets margin;
@property (nonatomic, assign) CGFloat width;


/**
 The background color to paint behind the text in the receiver
 */
@property (nonatomic, strong) DTColor *backgroundColor;

/**
 The border width to paint behind the text in the receiver. By default borderWidth = (0,0,0,0)
 */
@property (nonatomic, assign) DTEdgeInsets borderWidth;
/**
 The border color to paint behind the text in the receiver
 */
@property (nonatomic, strong) DTColor *borderColor;
@property (nonatomic, assign) CGFloat borderRadius;


@end
