#import "MenuKurukkupattiyalPlugin.h"
#if __has_include(<menu_kurukkupattiyal/menu_kurukkupattiyal-Swift.h>)
#import <menu_kurukkupattiyal/menu_kurukkupattiyal-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "menu_kurukkupattiyal-Swift.h"
#endif

@implementation MenuKurukkupattiyalPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMenuKurukkupattiyalPlugin registerWithRegistrar:registrar];
}
@end
