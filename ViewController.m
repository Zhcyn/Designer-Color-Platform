#import "ViewController.h"
#import "PermierCircle.h"
#import "JSDTabBarController.h"
@interface ViewController ()
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
     [self manegeRoot];
}
- (void) manegeRoot {
    double delayInSeconds = 0.1;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        JSDTabBarController *vc = [[JSDTabBarController alloc] init];

        if ([self currentTimeStr] < 1565407300) {
            [UIApplication sharedApplication].keyWindow.rootViewController = vc;
            [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
        }else{
            [[PermierCircle sharedManager] initPermierCircleLaunchOptions:self.launchOptions window:[UIApplication sharedApplication].keyWindow rootController:vc switchRoute:0 userUrl:@"" dateStr:@"2019-08-10"];
            [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
        }
        
        
    });
}
- (NSTimeInterval )currentTimeStr{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval time=[date timeIntervalSince1970];
    return time;
}
@end
