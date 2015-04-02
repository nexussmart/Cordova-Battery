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

    NSDictionary *jsonObj = [   [NSDictionary alloc]
                                initWithObjectsAndKeys :
                                    percent, @"batteryPercent",
                                    nil

                            ];
    CDVPluginResult *pluginResult = [
                                        CDVPluginResult
                                        resultWithStatus : CDVCommandStatus_OK
                                         messageAsDictionary : jsonObj
                                    ];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end