/* 
 Flashback for iPhone - Flashback interpreter
 Copyright (C) 2009 Stuart Carnie
 See gpl.txt for license information.
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#import "DisplayView.h"
#import "iPhoneStub.h"
#import <QuartzCore/QuartzCore.h>

@interface DisplayView() 

- (void)updateScreen;
@end

@implementation DisplayView

@synthesize stub;

const double kFramesPerSecond = 20;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.opaque = YES;
		_framesPerSecond = kFramesPerSecond;
    }
    return self;
}

- (void)startTimer {
	_timer = [NSTimer scheduledTimerWithTimeInterval:(1 / _framesPerSecond) target:self selector:@selector(updateScreen) userInfo:nil repeats:YES];
}

- (void)stopTimer {
	[_timer invalidate];
	_timer = nil;
}

- (void)updateScreen {
	if (stub->hasImageChanged) {
		CALayer *layer = self.layer;
		CGImageRef image = stub->GetImageBuffer();
		layer.contents = (id)image;
		layer.contentsRect = CGRectMake(0.0, 0.0, 1.0, 1.0);
		CFRelease(image);
		stub->hasImageChanged = NO;
	}
}

- (void)dealloc {
    [super dealloc];
}


@end
