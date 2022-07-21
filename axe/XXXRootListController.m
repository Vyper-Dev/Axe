#include <objc/runtime.h>
#import "XXXRootListController.h"

@interface _CDBatterySaver
- (id)batterySaver;
- (BOOL)setPowerMode:(long long)arg1 error:(id *)arg2; 
@end

@implementation XXXRootListController

- (NSArray *)specifiers {
    if (!_specifiers) {
        _specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
    }

    return _specifiers;
}

-(void)applyChanges {
    bool current = [[NSProcessInfo processInfo] isLowPowerModeEnabled];
    [[objc_getClass("_CDBatterySaver") batterySaver] 
    setPowerMode:!current error:nil];
    [[objc_getClass("_CDBatterySaver") batterySaver] 
    setPowerMode:current error:nil];
}

@end
