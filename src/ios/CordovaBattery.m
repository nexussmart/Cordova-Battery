#import "CordovaBattery.h"

@implementation CordovaBattery

@synthesize callbackId;

- (void)getLevel:(CDVInvokedUrlCommand*)command
{
    self.callbackId = command.callbackId;

    UIDevice* currentDevice = [UIDevice currentDevice];
    UIDeviceBatteryState currentState = [currentDevice batteryState];
    float currentLevel = [currentDevice batteryLevel];
    float percent = currentLevel * 100;

    [self.commandDelegate sendPluginResult:percent callbackId:command.callbackId];
}

@end