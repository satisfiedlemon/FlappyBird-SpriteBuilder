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
    
    //spawns a random obstacle
    [self addObstacle];
    
    //we want to add new obstacles at regular intervals.
    //lets use "update loop" or "run loop" to perform regularly scheduled activities
    //by default, Cocos2D runs "update loop" 60 times per second
    //we can check things like player health, whether enemies have died, or whether our
    //character is jumping too high
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    //this will be run every frame.
    //delta is the time that has elapsed since the last time it was run
    //this is usually 1/60, but can be bigger if the game slows down
    
    
    //increment the time since the last obstacle was added
    timeSinceObstacle += delta; //delta is approximately 1/60th of a second
    
    //check to see if two seconds have passed
    if(timeSinceObstacle > 2.0f) {
        //add a new obstacle
        [self addObstacle];
        
        //reset the timer
        timeSinceObstacle = 0.0f;
    }
}

// put new methods here
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    //this will get called every time the player touchers the screen
    [character flap];
}

@end
