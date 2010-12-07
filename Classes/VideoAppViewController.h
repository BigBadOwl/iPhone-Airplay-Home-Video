//
//  VideoAppViewController.h
//  VideoApp
//
//

#import <UIKit/UIKit.h>
#import "MediaPlayer/MediaPlayer.h"
#import <MobileCoreServices/UTCoreTypes.h>

@class CustomMoviePlayerViewController;

@interface VideoAppViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
	CustomMoviePlayerViewController *moviePlayer;
	UIButton * chooseVideoBtn;
	NSString * moviePath;
}

@property (nonatomic, retain) IBOutlet UIButton * chooseVideoBtn;
@property (nonatomic, retain) NSString * moviePath;

-(IBAction) getVideo:(id) sender;

- (void)playMovie;

@end

