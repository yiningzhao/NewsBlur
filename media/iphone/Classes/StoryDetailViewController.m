//
//  StoryDetailViewController.m
//  NewsBlur
//
//  Created by Samuel Clay on 6/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StoryDetailViewController.h"
#import "NewsBlurAppDelegate.h"


@implementation StoryDetailViewController

@synthesize appDelegate;
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"Loaded Story view: %@", appDelegate.activeStory);
    NSString *imgCssString = [NSString stringWithFormat:@"<style>"
                              "body {"
                              "  line-height: 18px;"
                              "  font-size: 13px;"
                              "  font-family: 'Lucida Grande',Helvetica, Arial;"
                              "  text-rendering: optimizeLegibility;"
                              "}"
                              "img {"
                              "  max-width: 300px;"
                              "  width: auto;"
                              "  height: auto;"
                              "}"
                              "blockquote {"
                              "  background-color: #F0F0F0;"
                              "  border-left: 1px solid #9B9B9B;"
                              "  padding: .5em 2em;"
                              "  margin: 0px;"
                              "}"
                              "</style>"];
    NSString *htmlString = [NSString stringWithFormat:@"%@ %@", imgCssString, [appDelegate.activeStory 
                               objectForKey:@"story_content"]];
    [webView loadHTMLString:htmlString
                    baseURL:[NSURL URLWithString:[appDelegate.activeFeed 
                                                  objectForKey:@"feed_link"]]];
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    self.webView = nil;
    self.appDelegate = nil;
}


- (void)dealloc {
    [appDelegate release];
    [webView release];
    [super dealloc];
}


@end
