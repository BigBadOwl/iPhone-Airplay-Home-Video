//
//  VideoAppViewController.m
//  VideoApp
//

#import "VideoAppViewController.h"
#import "CustomMoviePlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation VideoAppViewController
@synthesize moviePath, chooseVideoBtn;

-(IBAction) getVideo:(id) sender {
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	picker.mediaTypes =  [[[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil] autorelease];
	picker.allowsEditing = NO;
    picker.wantsFullScreenLayout = YES;
	picker.videoQuality = UIImagePickerControllerQualityTypeHigh;
	[self presentModalViewController:picker animated:YES];
	[picker release];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissModalViewControllerAnimated:NO];
	NSLog(@"Picked a movie at URL %@",  [info objectForKey:UIImagePickerControllerMediaURL]);
	moviePath = [[info objectForKey:UIImagePickerControllerMediaURL] path];
	[self playMovie];
	//[[picker self] dismissModalViewControllerAnimated:NO];
	
}

- (void)playMovie {
	NSLog(@"Attempting to play movie > %@", moviePath);
	if (![[NSFileManager defaultManager] fileExistsAtPath:moviePath isDirectory:NULL]) {
		NSLog(@"File does not exist");
	}
	else{
		moviePlayer = [[[CustomMoviePlayerViewController alloc] initWithPath:moviePath] autorelease];
		[self presentModalViewController:moviePlayer animated:YES];
		[moviePlayer readyPlayer];
	}
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[moviePath dealloc];
}

@end
