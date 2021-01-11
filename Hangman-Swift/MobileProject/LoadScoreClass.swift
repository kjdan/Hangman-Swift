//
//  LoadScoreClass.swift
//  MobileProject
//
//  Created by Krzysztof Danielski on 05/12/2018.
//  Copyright © 2018 Krzysztof Danielski. All rights reserved.
//

import UIKit
//klasa opdopiadajaca za wczytanie z pliku najlepszego wyniku oraz jego aktualizacji
class LoadScoreClass {
    
    var score: String
    var actualScore : String
    init() {
        self.score=""
        self.actualScore=""
        let path = "/Users/krzysztofdanielski/Desktop/MobileProject/MobileProject/score.txt"
        let path2="/Users/krzysztofdanielski/Desktop/MobileProject/MobileProject/actualscore.txt"
        do {
            // Get the contents
            let contents = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
           self.score=contents as String
            
            let contents2 = try NSString(contentsOfFile: path2, encoding: String.Encoding.utf8.rawValue)
            self.actualScore=contents2 as String
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
        
    }

    func showScore()-> String{
        return self.score
    }
    func showActualScore()->String{
        return self.actualScore
    }
    
    
    
    func saveScore(newScore:String){
        let path = "/Users/krzysztofdanielski/Desktop/MobileProject/MobileProject/score.txt"
        
        // Set the contents
        let contents = newScore
        
        do {
            // Write contents to file
            try contents.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
    }
    
    func zeroScore(){
        var myScore : Int = Int(actualScore) ?? 0
        if(myScore>0)
        {
            saveActualScore(newScore: "0")
        }
    }
    
    
    func saveActualScore(newScore:String){
    let path = "/Users/krzysztofdanielski/Desktop/MobileProject/MobileProject/actualscore.txt"
    
    // Set the contents
    let contents = newScore
    
    do {
    // Write contents to file
    try contents.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
    }
    catch let error as NSError {
    print("Ooops! Something went wrong: \(error)")
    }
    }
}
