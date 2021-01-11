//
//  LoadNamesClass.swift
//  MobileProject
//
//  Created by Krzysztof Danielski on 05/12/2018.
//  Copyright © 2018 Krzysztof Danielski. All rights reserved.
//

import UIKit
//klasa odpowiadajaca za wczytanie z pliku hasla oraz kategorii ,zapisania ich do klasy PasswordClass, dodanie do listy oraz operacji na niej
class LoadNamesClass {

    var array = [PasswordClass]()
    var listFromFile = [String]()

    init()
    {
       
      
        var contents=""
        let path = "/Users/krzysztofdanielski/Desktop/MobileProject/MobileProject/names.txt"
       
            contents=""

        do {
            // Get the contents
             contents = try String(contentsOfFile: path, encoding: .utf8)
            listFromFile = contents.components(separatedBy: "\n")
            
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
        
         for i in 0...listFromFile.count-2
         {
            
            if(i%2==0)
            {
                array.append(PasswordClass(Password_: listFromFile[i],Category_: listFromFile[i+1]))

            }
        }
    }
    
    
    func getName()->PasswordClass
    {

        let randomInt = Int.random(in: 0..<5)
        
        let Value = PasswordClass (Password_: array[randomInt].Password,Category_: array[randomInt].Category)
        
        return Value
    }
    
}
