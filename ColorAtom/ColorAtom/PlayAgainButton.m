//
//  PlayAgainButton.m
//  ColorAtom
//
//  Created by 杨萧玉 on 14-4-27.
//  Copyright (c) 2014年 杨萧玉. All rights reserved.
//

#import "PlayAgainButton.h"
#import "Define.h"
#import "PlayFieldScene.h"
#import "NightPlayScene.h"
#import "SecretPlayScene.h"
@implementation PlayAgainButton
@synthesize modeString;
-(id)initWithMode:(NSString *)newmode{
    if (self = [super init]) {
        self.fontName = @"Chalkduster";
        self.text = @"PLAY AGAIN";
        self.fontSize = 20;
        self.fontColor = [SKColor whiteColor];
        self.userInteractionEnabled = YES;
        modeString = newmode;
    }
    return self;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *mode = [standardDefaults objectForKey:@"mode"];
    for (NSString* key in mode.keyEnumerator) {
        if ([[mode objectForKey:key] isEqualToString:modeString]) {
            Class class = NSClassFromString(key);
            SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
            SKScene * myScene = [[class alloc] initWithSize:self.scene.size];
            [self.scene.view presentScene:myScene transition: reveal];
        }
    }
}
@end