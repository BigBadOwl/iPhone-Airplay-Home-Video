//
//  VideoAppAppDelegate.h
//  VideoApp
//

#import <UIKit/UIKit.h>

@class VideoAppViewController;

@interface VideoAppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow * window;
	
    VideoAppViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet VideoAppViewController *viewController;

@end

