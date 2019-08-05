#import "JSDTabBarController.h"
#import "JSDHomeViewController.h"
#import "JSDBaseNavigationController.h"
#import "JSDColorPaletteVC.h"
#import "JSDPublic.h"
@interface JSDTabBarController ()
@end
@implementation JSDTabBarController
- (instancetype)init {
    if (!(self = [super init])) {
        return nil;
    }
    UIEdgeInsets imageInsets = UIEdgeInsetsZero;
    UIOffset titlePositionAdjustment = UIOffsetMake(0, -3.5);
    CYLTabBarController* tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers  tabBarItemsAttributes:[self tabBarItemsAttributesForController] imageInsets:imageInsets titlePositionAdjustment:titlePositionAdjustment];
    [self customizeTabBarAppearance:tabBarController];
    self.navigationController.navigationBar.hidden = YES;
    return (self = (JSDTabBarController *)tabBarController);
}
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    [tabBarController setTintColor:[UIColor jsd_colorWithHexString:@"#1288db"]];
}
- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
        CYLTabBarItemTitle : @"Palette",
        CYLTabBarItemImage : @"home_default",
        CYLTabBarItemSelectedImage : @"home_selected",  
    };
    NSDictionary *secondTabBarItemsAttributes = @{
        CYLTabBarItemTitle : @"Rainbow",
        CYLTabBarItemImage : @"mood_defalut",
        CYLTabBarItemSelectedImage : @"mood_selected",
    };
    NSArray *tabBarItemsAttributes = @[
        firstTabBarItemsAttributes,
        secondTabBarItemsAttributes,
    ];
    return tabBarItemsAttributes;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark -- set  && get
- (NSArray *)viewControllers {
    UIViewController *firstViewController = [[JSDColorPaletteVC alloc] init];
    UIViewController *firstNavigationController = [[JSDBaseNavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    [firstViewController cyl_setHideNavigationBarSeparator:NO];
    UIViewController *secondViewController = [[JSDHomeViewController alloc] init];
    UIViewController *secondNavigationController = [[JSDBaseNavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    [secondViewController cyl_setHideNavigationBarSeparator:NO];
    NSArray *viewControllers = @[
        firstNavigationController,
        secondNavigationController,
    ];
    return viewControllers;
}
@end
