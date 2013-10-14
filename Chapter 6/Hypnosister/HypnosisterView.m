//
//  HypnosisterView.m
//  Hypnosister
//
//  Created by Thomas Kimura on 2013-10-14.
//  Copyright (c) 2013 Thomas Kimura. All rights reserved.
//

#import "HypnosisterView.h"

@implementation HypnosisterView

@synthesize circleColor;



-(void)drawRect:(CGRect)dirtyRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    //Find center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.y + bounds.size.width / 2.0;
    center.y = bounds.origin.x + bounds.size.width / 2.0;
    
    //Set radius
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    //Thickness of line
    CGContextSetLineWidth(ctx, 10);
    
    //Line colour
    [[self circleColor]setStroke];
    
    //Draw concentrix circles from the outside in
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius-=20) {
       
        
        //Add a path to the context
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        //Draw
        CGContextStrokePath(ctx);
    }
    
    //Create string
    NSString *text = @"You are getting sleepy.";
    
    //Get font
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    
    //How big is this string
    textRect.size = [text sizeWithFont:font];
    
    //String in center
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    //Set color
    [[UIColor blackColor]setFill];
    
    //The shawdow
    CGSize offset = CGSizeMake(4, 3);
    
    //Shawdow color
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    
    //Draw shawdow
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    
    //Draw string
    [text drawInRect:textRect
            withFont:font];
}


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //Set to clear
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
    }
    return self;
}

-(void)setCircleColor:(UIColor *)clr
{
    circleColor = clr;
    [self setNeedsDisplay];
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        //Random colors
        float redValue = random() % 10;
        float greenValue = random() % 10;
        float blueValue = random() % 10;
        UIColor *randomColor = [UIColor colorWithRed:redValue/10 green:greenValue/10 blue:blueValue/10 alpha:1.0];
        
        NSLog(@"Device was shaked");
        [self setCircleColor:randomColor];
    }
}

@end
