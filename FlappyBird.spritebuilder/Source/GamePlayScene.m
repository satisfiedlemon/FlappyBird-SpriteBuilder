#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    
    //load a new Character from the CCB file named Character.
    //CCB files are created by SpriteBuilder and describe the properties and
    //appearance of in-game objects like our Flappy Bird.
    character = (Character*)[CCBReader load:@"Character"];
    
    //add your character as a child of physicsNode so that physics will be applied to it.
    [physicsNode addChild:character];
}

-(void)update:(CCTime)delta
{
    // put update code here
    //[character flap];
}

// put new methods here
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    //this will get called every time the player touchers the screen
}

@end
