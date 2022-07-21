#import <UIKit/UIKit.h>


@interface _UIBatteryView : UIView
  @property (assign,nonatomic) double chargePercent;
  - (void) _updateBatteryFillColor;
@end


%hook _UIBatteryView 

-(id)_batteryFillColor {
    NSDictionary *settings = [[NSUserDefaults standardUserDefaults]
    persistentDomainForName:@"com.vyper.axe"];
    id enabled = [settings valueForKey:@"enabled"];
    id dark = [settings valueForKey:@"dark"];
    static BOOL override = NO;
    //override = 0;
    float battery = self.chargePercent;
    float Sat;
    
    if(([enabled isEqual:@0]) && ([dark isEqual:@0])) return %orig;
    if([enabled isEqual:@0]) return %orig;
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


%end
