#line 1 "Tweak.x"
#import <UIKit/UIKit.h>


@interface _UIBatteryView : UIView
  @property (assign,nonatomic) double chargePercent;
  - (void) _updateBatteryFillColor;
@end



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class _UIBatteryView; 
static id (*_logos_orig$_ungrouped$_UIBatteryView$_batteryFillColor)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$_UIBatteryView$_batteryFillColor(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); 

#line 10 "Tweak.x"
 

static id _logos_method$_ungrouped$_UIBatteryView$_batteryFillColor(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSDictionary *settings = [[NSUserDefaults standardUserDefaults]
    persistentDomainForName:@"com.vyper.axe"];
    id enabled = [settings valueForKey:@"enabled"];
    id dark = [settings valueForKey:@"dark"];
    static BOOL override = NO;
    
    float battery = self.chargePercent;
    float Sat;
    
    if(([enabled isEqual:@0]) && ([dark isEqual:@0])) return _logos_orig$_ungrouped$_UIBatteryView$_batteryFillColor(self, _cmd);
    if([enabled isEqual:@0]) return _logos_orig$_ungrouped$_UIBatteryView$_batteryFillColor(self, _cmd);
    if([dark isEqual:@0]) override = NO;
    
    if([enabled isEqual:@1]){
      Sat = 1;
    };

    if([dark isEqual:@1]) {
      Sat = 0.75;
      override = YES;
      return [UIColor colorWithHue: (battery * .333) saturation: Sat brightness: 0.75 alpha: 1.00];
    };

    if (override == NO) {
      return [UIColor colorWithHue: (battery * .333) saturation: Sat brightness: 1 alpha: 1.00];
    };
    
    return 0;
};



static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$_UIBatteryView = objc_getClass("_UIBatteryView"); { MSHookMessageEx(_logos_class$_ungrouped$_UIBatteryView, @selector(_batteryFillColor), (IMP)&_logos_method$_ungrouped$_UIBatteryView$_batteryFillColor, (IMP*)&_logos_orig$_ungrouped$_UIBatteryView$_batteryFillColor);}} }
#line 45 "Tweak.x"
