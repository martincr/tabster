/*
     File: TwoViewController.m 
 Abstract: The view controller for page two. 
  Version: 1.3 
  
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple 
 Inc. ("Apple") in consideration of your agreement to the following 
 terms, and your use, installation, modification or redistribution of 
 this Apple software constitutes acceptance of these terms.  If you do 
 not agree with these terms, please do not use, install, modify or 
 redistribute this Apple software. 
  
 In consideration of your agreement to abide by the following terms, and 
 subject to these terms, Apple grants you a personal, non-exclusive 
 license, under Apple's copyrights in this original Apple software (the 
 "Apple Software"), to use, reproduce, modify and redistribute the Apple 
 Software, with or without modifications, in source and/or binary forms; 
 provided that if you redistribute the Apple Software in its entirety and 
 without modifications, you must retain this notice and the following 
 text and disclaimers in all such redistributions of the Apple Software. 
 Neither the name, trademarks, service marks or logos of Apple Inc. may 
 be used to endorse or promote products derived from the Apple Software 
 without specific prior written permission from Apple.  Except as 
 expressly stated in this notice, no other rights or licenses, express or 
 implied, are granted by Apple herein, including but not limited to any 
 patent rights that may be infringed by your derivative works or by other 
 works in which the Apple Software may be incorporated. 
  
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE 
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION 
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS 
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND 
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS. 
  
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL 
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, 
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED 
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE), 
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE 
 POSSIBILITY OF SUCH DAMAGE. 
  
 Copyright (C) 2013 Apple Inc. All Rights Reserved. 
  
 */

#import "TwoViewController.h"
#import "LandscapeViewController.h"

// table row constants for assigning cell titles
enum {
	kiPod = 0,
	kiPodtouch,
	kiPodnano,
	kiPodshuffle
};

@interface TwoViewController ()

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) IBOutlet LandscapeViewController *landscapeViewController;

@end


#pragma mark -

@implementation TwoViewController

// this is called when its tab is first tapped by the user
- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.dataArray = @[@"iPod", @"iPod touch", @"iPod nano", @"iPod shuffle"];
}


#pragma mark - UITableView delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *kCellID = @"cellID";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
	if (cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID];
		cell.selectionStyle = UITableViewCellSelectionStyleBlue;
	}
	
	cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self presentViewController:self.landscapeViewController animated:YES completion:^ {
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }];
	
    UIImage *image = nil;
    switch (indexPath.row)
	{
		case kiPod:
			image = [UIImage imageNamed:@"iPod.png"];
			break;
			
		case kiPodtouch:
			image = [UIImage imageNamed:@"iPod_touch.png"];
			break;
			
		case kiPodnano:
			image = [UIImage imageNamed:@"iPod_nano.png"];
			break;
			
		case kiPodshuffle:
			image = [UIImage imageNamed:@"iPod_shuffle.png"];
			break;
	}
    self.landscapeViewController.imageView.image = image;
}


#pragma mark - UIViewControllerRotation

// rotation support for iOS 5.x and earlier
//
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
#endif

@end
