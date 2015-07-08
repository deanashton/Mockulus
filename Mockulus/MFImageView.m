//
//  MFImageView.m
//  Mockulus
//
//  Created by James Baker on 6/10/15.
//  Copyright (c) 2015 WDDG, Inc. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "MFImageView.h"

@implementation MFImageView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    _renderInterpolation = NSImageInterpolationNone;
}

- (void)drawRect:(NSRect)dirtyRect {

    if (self.rendering) {
        [NSGraphicsContext saveGraphicsState];
        [[NSGraphicsContext currentContext] setImageInterpolation:self.renderInterpolation];
        [super drawRect:dirtyRect];
        [NSGraphicsContext restoreGraphicsState];
    } else {
        [super drawRect:dirtyRect];
    }
}

- (void)setRenderInterpolation:(NSImageInterpolation)renderInterpolation
{
    if (_renderInterpolation != renderInterpolation) {
        _renderInterpolation = renderInterpolation;
    }

}

@end
