//
//  ViewController.m
//  ScrollView
//
//  Created by Michael Luton on 3/22/12.
//  Copyright (c) 2012 Michael Luton. All rights reserved.
//

#import "ViewController.h"
#import "GlyphView.h"

@implementation ViewController

@synthesize glyphScrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSArray *glyphs = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", nil];

    // Setup desired properties for the UIScrollView.
    glyphScrollView.pagingEnabled = YES;
    glyphScrollView.contentSize = CGSizeMake(glyphScrollView.frame.size.width * [glyphs count], glyphScrollView.frame.size.height);
    glyphScrollView.showsHorizontalScrollIndicator = NO;
    glyphScrollView.showsVerticalScrollIndicator = NO;
    glyphScrollView.scrollsToTop = NO;
    glyphScrollView.delegate = self;
  
    // Add the subviews to the UIScrollView.
    for (unsigned i = 0; i < [glyphs count]; i++) {
        GlyphView *aView = [[[NSBundle mainBundle] loadNibNamed:@"GlyphView" owner:self options:nil] objectAtIndex:0];
        aView.glyphLabel.text = [glyphs objectAtIndex:i];
        aView.frame = CGRectMake(glyphScrollView.frame.size.width * i, 0, glyphScrollView.frame.size.width, glyphScrollView.frame.size.height);
        [glyphScrollView addSubview:aView];
    }
 }

- (void)viewDidUnload {
    [self setGlyphScrollView:nil];
    [super viewDidUnload];
}
@end
