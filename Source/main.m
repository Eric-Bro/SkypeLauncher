//
//  main.m
//  Skype Launcher
//
//  Created by Alexander Holodny on 11/27/12.
//  Copyright (c) 2012 Alexander Holodny. All rights reserved.
//
//


int main(int argc, const char *argv[]) {
    @autoreleasepool {
        /*
        * Skype reads Skype.pid file for a pid of an already launched copy on startup,
        * so if we remove this file, Skype won't be panic with the "You have another copy of Skype running"
        * message.
        */
        [[NSFileManager defaultManager] removeItemAtPath:[@"~/Library/Application Support/Skype/Skype.pid" stringByExpandingTildeInPath]
                                                   error:NULL];

        NSWorkspace *workspace = [NSWorkspace sharedWorkspace];
        NSURL *skype_url = [NSURL fileURLWithPath:
                [workspace absolutePathForAppBundleWithIdentifier:@"com.skype.skype"]];

        [workspace launchApplicationAtURL:skype_url
                                  options:NSWorkspaceLaunchNewInstance
                            configuration:nil error:NULL];
    }
    return 0;
}
