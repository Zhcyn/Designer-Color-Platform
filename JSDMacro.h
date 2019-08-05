#ifndef JSDMacro_h
#define JSDMacro_h
#pragma mark -- NSLog
#ifndef __OPTIMIZE__
#else
#define NSLog(...) {}
#endif
#pragma mark -- IPHONE Device
#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define  IsIphoneX_XS     (ScreenWidth == 375.f && ScreenHeight == 812.f ? YES : NO)
#define  IsIphoneXR_XSMax    (ScreenWidth == 414.f && ScreenHeight == 896.f ? YES : NO)
#define  IsFullScreen    (isIphoneX_XS || isIphoneXR_XSMax)
#define StatusBarHeight     (isFullScreen ? 44.f : 20.f)
#define NavigationBarHeight  (StatusBarAndNavigationBarHeight - StatusBarHeight)
#define TabbarHeight         (isFullScreen ? (49.f+34.f) : 49.f)
#define TabbarSafeBottomMargin         (isFullScreen ? 34.f : 0.f)
#define StatusBarAndNavigationBarHeight  (isFullScreen ? 88.f : 64.f)
#pragma mark -- UI
#define IOS11        ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 11.0)
#define Screen_Width ([UIScreen mainScreen].bounds.size.width)
#define Screen_Height ([UIScreen mainScreen].bounds.size.height)
#define Screen_Bounds ([UIScreen mainScreen].bounds)
#define View_Width (self.view.bounds.size.width)
#define View_Height (self.view.bounds.size.height)
#define ColorWithFROMRGB(rgbValue, al)                        \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0    \
blue:((float)(rgbValue & 0xFF)) / 255.0             \
alpha:al]
#define ColorWithRGB(r,g,b) ([UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.f])
#define ColorRGBAWithRGBA(r, g, b, a) ([UIColor colorWithRed:(r) / 255.0  \
green:(g) / 255.0  \
blue :(b) / 255.0  \
alpha:(a)])
#pragma mark weakify && strongify
#ifndef    weakify
#if __has_feature(objc_arc)
#define weakify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
autoreleasepool{} __weak __typeof__(x) __weak_##x##__ = x; \
_Pragma("clang diagnostic pop")
#else
#define weakify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
autoreleasepool{} __block __typeof__(x) __block_##x##__ = x; \
_Pragma("clang diagnostic pop")
#endif
#endif
#ifndef    strongify
#if __has_feature(objc_arc)
#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __weak_##x##__; \
_Pragma("clang diagnostic pop")
#else
#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __block_##x##__; \
_Pragma("clang diagnostic pop")
#endif
#endif
#endif 
