/*
* Copyright (c) 2013-2014 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import Foundation
import GameKit

enum GameStateMult: Int {
    case WaitingForMatch, WaitingForRandomNumber, WaitingForStart,
    Playing, Done }

enum MessageType: Int {
        case RandomNumber, GameBegin, Move, Make, Open, LapComplete, GameOver, Rematch
}
struct Message {
        let messageType: MessageType
}
struct MessageRandomNumber { let message: Message
        let randomNumber: UInt32
}
struct MessageGameBegin { let message: Message
}
struct MessageMove { let message: Message 
    let dx: Float
        let dy: Float
        let rotate: Float }

struct MessageMake { let message: Message 
    let gen: Int
    let xpos: Float
    let charge: Float 
    let cyclepos: Int
}

struct MessageOpen { let message: Message
    let time: NSTimeInterval
    let pos: Int
}

//struct MessageLapComplete { let message: Message
//}

struct MessageGameOver { let message: Message
    let score: Int
}

struct MessageRematch { let message: Message
    let ans: Int
}

protocol MultiplayerProtocol {
    
  func matchEnded()
func setCurrentPlayerIndex(index :Int)
    func setPositionOfCar(dx: Float, dy: Float, rotation: Float) //index: Int,
    func receiveMake(gen: Int, xpos: Float, charge: Float, cyclepos: Int)
    func receiveOpen(time: NSTimeInterval, pos: Int)
    func gameOver(didLocalPlayerWin: Bool)
    func isGameOver()
    func transitionToGame()
}

class MultiplayerNetworking: NSObject, GameKitHelperDelegate {
    
  var delegate: MultiplayerProtocol?
  var noOfLaps: Int?
    var ourRandomNumber: UInt32
    var gameStateMult: GameStateMult
    
    var receivedAllRandomNumbers: Bool
    var orderOfPlayers: [RandomNumberDetails]
    var lapCompleteInformation: Dictionary<String, Int>
    
    class RandomNumberDetails: NSObject { let playerId: String
    let randomNumber: UInt32
    init(playerId: String, randomNumber: UInt32) { self.playerId = playerId
    self.randomNumber = randomNumber 
        super.init()
    }
    override func isEqual(object: AnyObject?) -> Bool {
    let randomNumberDetails = object as? RandomNumberDetails 
        return randomNumberDetails?.playerId == self.playerId
        } }
    
    
    
    override init() {
    ourRandomNumber = arc4random() 
        gameStateMult = GameStateMult.WaitingForMatch 
        isPlayer1 = false 
        receivedAllRandomNumbers = false
    orderOfPlayers = [RandomNumberDetails]()
        
        orderOfPlayers.append(RandomNumberDetails(playerId: GKLocalPlayer.localPlayer().playerID!, randomNumber: ourRandomNumber))
        
        lapCompleteInformation = Dictionary<String, Int>()
    super.init() }
  
  // MARK: GameKitHelperDelegate methods
    func matchStarted() {
        
            print("Match has started successfully") 
        
        if receivedAllRandomNumbers {
            gameStateMult = GameStateMult.WaitingForStart } else {
            gameStateMult = GameStateMult.WaitingForRandomNumber 
        }
        
            sendRandomNumber()
            tryStartGame() 
       //     setupLapCompleteInformation()
    }
    
    
    func sendRandomNumber() { 
    
            var message = MessageRandomNumber(message: Message(messageType: MessageType.RandomNumber), randomNumber: ourRandomNumber)
            let data = NSData(bytes: &message, length: sizeof(MessageRandomNumber))
            sendData(data)
    
    }
    func tryStartGame() {
    
    if isPlayer1 && gameStateMult == GameStateMult.WaitingForStart { 
        gameStateMult = GameStateMult.Playing
    sendBeginGame()
        //first player delegate?.setCurrentPlayerIndex(0) //SHOULD THIS BE COMMENTED OUT? IT WAS COMMENTED OUT IN THE CHAPTER
        print("isplayer1: \(isPlayer1)")
    }
    }
    
    func indexForLocalPlayer() -> Int? {
        return indexForPlayer(GKLocalPlayer.localPlayer().playerID!)
    }
    
    func indexForPlayer(playerId: String) -> Int? { var idx: Int?
            for (index, playerDetail) in orderOfPlayers.enumerate() { let pId = playerDetail.playerId
        if pId == playerId {
        idx = index
        break
        } }
            return idx }
    
    func sendData(data: NSData) {
        
  //  var sendDataError: NSError? REMOVED FOR SWIFT 2.0 ERROR HANDLING INSTEAD
    let gameKitHelper = GameKitHelper.sharedInstance
    if let multiplayerMatch = gameKitHelper.multiplayerMatch { 
        
        
        do { 
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! NSDictionary //[NSObject: AnyObject] //NSJSONReadingOptions.MutableContainers   as! NSDictionary // was: NSJSONReadingOptions.MutableContainers CHANGED THIS TO SOLVE ERROR. NOT SURE IF THIS IS CORRECT
        //    print("jsonresult: \(jsonResult)")
        } catch { // let error as NSError
         //   print(error)
         //   print("jsonresult: \(jsonResult)")
        //    print("the error is at the jsonResult area") //Yes, this is the source of the sendMove problem
        }
        
        
        
        
        
        
        //IF MULTIPLAYER IS NOT WORKING FOR SOME REASON: HAD TO CHANGE THE BELOW TO UPDATE FOR NEW SWIFT 2.0 HANDLING SYSTEM. NOT SURE IF CATCH LET ERROR AS NSERROR OR SENDDATAERRO
        
        do {
    let success = try multiplayerMatch.sendDataToAllPlayers(data, withDataMode: .Reliable)
        
        } catch let error as NSError? { //NSError or sendDataError   ???
   
    print("Error:\(error!.localizedDescription)")
            print("the error is at the do/try method")
            
    matchEnded() }
        
        }
    }
    
    func sendBeginGame() {
    var message = MessageGameBegin(message: Message(messageType:
    MessageType.GameBegin))
    let data = NSData(bytes: &message, length:
    sizeof(MessageGameBegin)) 
        sendData(data)
    }
  
    
    func processReceivedRandomNumber(randomNumberDetails: RandomNumberDetails) {
        
        //1
        let mutableArray = NSMutableArray(array:orderOfPlayers) 
        mutableArray.addObject(randomNumberDetails)
        //2
        let sortByRandomNumber = NSSortDescriptor(key: "randomNumber", ascending: false)
        let sortDescriptors = [sortByRandomNumber] 
        mutableArray.sortUsingDescriptors(sortDescriptors)
        //3
        orderOfPlayers = NSArray(array: mutableArray) as! [RandomNumberDetails]
        //4
        if allRandomNumbersAreReceived() { receivedAllRandomNumbers = true
        }
        
      
    }
    
    func allRandomNumbersAreReceived() -> Bool { var receivedRandomNumbers = Set<UInt32>()
            for playerDetail in orderOfPlayers { receivedRandomNumbers.insert(playerDetail.randomNumber)
            }
            if let multiplayerMatch = GameKitHelper.sharedInstance.multiplayerMatch {
            if receivedRandomNumbers.count == multiplayerMatch.playerIDs.count + 1 { return true
            } }
            return false } 
    
    
    func isLocalPlayerPlayer1() -> Bool { 
            let playerDetail = orderOfPlayers[0] 
            
            if playerDetail.playerId == GKLocalPlayer.localPlayer().playerID {
            
            
            print("I'm player 1.. w00t :]") 
            return true 
            }
            
            return false 
    }
    
    
    
    
    
  func matchEnded() {
  //  GameKitHelper.sharedInstance.multiplayerMatch?.disconnect()
    delegate?.matchEnded()
  }
  
  func matchReceivedData(match: GKMatch, data: NSData, fromPlayer player: String) {
    
        var message = UnsafePointer<Message>(data.bytes).memory
    
    
        if message.messageType == MessageType.RandomNumber { let messageRandomNumber =
            
            
    UnsafePointer<MessageRandomNumber>(data.bytes).memory
                print("Received random number:\(messageRandomNumber.randomNumber)")
    var tie = false
    if messageRandomNumber.randomNumber == ourRandomNumber {
    //2
    print("Tie")
    
    tie = true
    var idx: Int?
    for (index, randomNumberDetails) in
        orderOfPlayers.enumerate() {  //UPDATED THIS FOR SWIFT 2.0
        if randomNumberDetails.randomNumber == ourRandomNumber { idx = index
        break
        } }
    if let validIndex = idx {
        ourRandomNumber = arc4random() 
        orderOfPlayers.removeAtIndex(validIndex) 
        orderOfPlayers.append(RandomNumberDetails(playerId:
        GKLocalPlayer.localPlayer().playerID!, randomNumber:ourRandomNumber))
    }
    sendRandomNumber() } else {
    //3
    processReceivedRandomNumber(RandomNumberDetails(playerId: player, randomNumber: messageRandomNumber.randomNumber))
    }
    //4
    if receivedAllRandomNumbers { isPlayer1 = isLocalPlayerPlayer1()
    }
    if !tie && receivedAllRandomNumbers { //5
                
        if gameStateMult == GameStateMult.WaitingForRandomNumber { 
            
            gameStateMult = GameStateMult.WaitingForStart
        }
                
        tryStartGame() }
            
            
            
                
            } else if message.messageType == MessageType.GameBegin { 
                
                gameStateMult = GameStateMult.Playing
                if let localPlayerIndex = indexForLocalPlayer() { delegate?.setCurrentPlayerIndex(localPlayerIndex)
                }
                
        }  else if message.messageType == MessageType.Move {
                
                
                let messageMove = UnsafePointer<MessageMove>(data.bytes).memory
                print("Dx: \(messageMove.dx) Dy: \(messageMove.dy) Rotation: \(messageMove.rotate)")
                delegate?.setPositionOfCar(messageMove.dx, dy: messageMove.dy, rotation: messageMove.rotate) //indexForPlayer(player)!, dx:
                
        } else if message.messageType == MessageType.Open { 
                
            let messageOpen = UnsafePointer<MessageOpen>(data.bytes).memory
            print("time: \(messageOpen.time) pos: \(messageOpen.pos)")
            delegate?.receiveOpen(messageOpen.time, pos: messageOpen.pos)
       /*     
            if isGameOver() && isPlayer1 { 
                
                sendGameOverMessage() 
                delegate?.gameOver(hasLocalPlayerWon())*/
                
    
      
                
        } else if message.messageType == MessageType.Make { 
    
            let messageMake = UnsafePointer<MessageMake>(data.bytes).memory
            print("receiving make in MultiplayerNetworking: gen: \(messageMake.gen) xpos: \(messageMake.xpos) charge: \(messageMake.charge) cyclepos: \(messageMake.cyclepos)")
            
            
            delegate?.receiveMake(messageMake.gen, xpos: messageMake.xpos, charge: messageMake.charge, cyclepos: messageMake.cyclepos)
            
            
            
    
    } else if message.messageType == MessageType.GameOver {
                
            
            let messageGameOver = UnsafePointer<MessageGameOver>(data.bytes).memory
            print("gameover msg received")
            
            otherPlayerGameOver = true
            otherPlayerScore = messageGameOver.score
                delegate?.isGameOver()
            
            
            
                
        } else if message.messageType == MessageType.Rematch {
            
            
            let messageRematch = UnsafePointer<MessageRematch>(data.bytes).memory
            print("rematch msg received")
            
            opponentReplay = messageRematch.ans
            
            delegate?.transitionToGame()

            
            
            
            
    }
                
                
                
               
        
        
        
        
    }
    
   /* func setupLapCompleteInformation() { 
        
        if let multiplayerMatch =
    GameKitHelper.sharedInstance.multiplayerMatch {
    let playerIds = multiplayerMatch.playerIDs as [String]
    for playerId in playerIds { lapCompleteInformation[playerId] = noOfLaps
    } 
        lapCompleteInformation[GKLocalPlayer.localPlayer().playerID!] = noOfLaps
    } }
    
    func reduceNumberOfLapsForPlayer(playerId: String) {
            if let laps = lapCompleteInformation[playerId] { 
        lapCompleteInformation[playerId] = laps - 1 
        print("Reduced laps:\(laps - 1)")
            } 
    
    }*/
    
    
    func sendOpen(time: NSTimeInterval, pos: Int) {
        
        var messageOpen = MessageOpen(message: Message(messageType:
            MessageType.Open), time: time, pos: pos) 
        let data = NSData(bytes: &messageOpen, length:
            sizeof(MessageOpen)) 
        sendData(data)
        
        
        
        /*
        var lapCompleteMessage = MessageLapComplete(message:
        Message(messageType: MessageType.LapComplete))
        let data = NSData(bytes: &lapCompleteMessage, length:
        sizeof(MessageLapComplete))
        sendData(data)
        reduceNumberOfLapsForPlayer(GKLocalPlayer.localPlayer() .playerID!)
        
        if isGameOver() && isPlayer1 { 
            sendGameOverMessage() 
            delegate?.gameOver(hasLocalPlayerWon())
        }*/
    }
    
    
    func sendMove(dx: Float, dy: Float, rotation: Float) {
        
       
        
        
        
        var messageMove = MessageMove(message: Message(messageType:
            MessageType.Move), dx: dx, dy: dy, rotate: rotation) 
        let data = NSData(bytes: &messageMove, length:
        sizeof(MessageMove)) 
        sendData(data)
    }
    
    func sendMake(gen: Int, xpos: Float, charge: Float, cyclepos: Int) {
        
        var messageMake = MessageMake(message: Message(messageType:
            MessageType.Make), gen: gen, xpos: xpos, charge: charge, cyclepos: cyclepos) 
        
        let data = NSData(bytes: &messageMake, length:
            sizeof(MessageMake)) 
        
        sendData(data)
        print("sending make in mult networking: gen: \(gen) xpos: \(xpos) charge: \(charge) cyclepos: \(cyclepos)")
    }
    
        

    func sendGameOver(score: Int) {
            var gameOverMessage = MessageGameOver(message:
                Message(messageType: MessageType.GameOver), score: score)
            let data = NSData(bytes: &gameOverMessage, length:
            sizeof(MessageGameOver)) 
            sendData(data)
        print("sent game over msg")
}

    
    func sendRematch(ans: Int) {
        
        var messageRematch = MessageRematch(message: Message(messageType:
            MessageType.Rematch), ans: ans) 
        
        let data = NSData(bytes: &messageRematch, length:
            sizeof(MessageRematch)) 
        
        sendData(data)
        print("send rematch ans: \(ans)")
    }

    
    
    
func hasLocalPlayerWon() {
    
    /*
        let winningIndex = indexForWinningPlayer()
        if let index = winningIndex {
        let playerDetails = orderOfPlayers[index]
        if playerDetails.playerId == GKLocalPlayer.localPlayer().playerID { return true
        } }
        return false 
    
    */
    
    }
    
func indexForWinningPlayer() -> Int? {
        var winningPlayerId: String?
        for (playerId, numberOfLaps) in lapCompleteInformation { if numberOfLaps == 0 {
        winningPlayerId = playerId
        break
        } }
        if let playerId = winningPlayerId { return indexForPlayer(playerId)
        }
        return nil
}

}
