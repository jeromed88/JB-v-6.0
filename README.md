# JB-v-6.0

SpriteKit Game in Swift, currently working on EXC_BAD_ACCESS error after completing first 3 achievements and hitting replay.

To see error:
Tap on screen to begin game (avoid touching multiplayer button). Complete first 3 achievements by hitting stopwatch at the beginning so the timer starts to run, jumping through the window, then clearing 12 barriers. End the round by waiting for the next wall to close after a few seconds (time up). Player sees an incomplete cutscene after that, waits a few seconds, then labels fall in place. A score screen comes up, and when you hit replay, the EXC_BAD_ACCESS usually happens in the AppDelegate or on one of the following lines in Gamescene:

closeTree1.size.height = closeTree1.size.height = 1091.94*0.6
-or-
iceMountain1.size = CGSize(width: iceMountain1.size.width, height: iceMountain1.size.height)
-or-
hills1.name = "hills11"

The debug print lines right before these lines show that these sprites have not been deallocated because the debugger can spit out the below info:

closeTree1: name:'(null)' texture:[ 'tree1' (721 x 1112)] position:{2902.64990234375, 577.58203125} scale:{1.00, 1.00} size:{420, 655.16400146484375} anchor:{0.5, 0.5} rotation:0.00

Why is there an EXC_BAD_ACCESS error when the sprite has not been deallocated?
