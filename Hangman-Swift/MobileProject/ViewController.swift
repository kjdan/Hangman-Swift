//
//  ViewController.swift
//  MobileProject
//
//  Created by Krzysztof Danielski on 17/11/2018.
//  Copyright © 2018 Krzysztof Danielski. All rights reserved.
//

import UIKit
import ClassKit
// glowna klasa odpowiedzialna za cala logike programu czyli operowaniu na hasle, sprawdzaniu poprawnosci liter oraz modyfikowaniem X-hasla w przypadku poprawnej odpowiedzi
class ViewController: UIViewController {

    
    
    static var Password = ""
    var xPassword = ""
    static var Fails=0
    
    
    
    var lcs=LoadScoreClass()
    
    @IBOutlet weak var Abutton: UIButton!
    @IBOutlet weak var Cbutton: UIButton!
    @IBOutlet weak var Bbutton: UIButton!
    @IBOutlet weak var Dbutton: UIButton!
    @IBOutlet weak var Ebutton: UIButton!
    @IBOutlet weak var Fbutton: UIButton!
    @IBOutlet weak var Gbutton: UIButton!
    @IBOutlet weak var Hbutton: UIButton!
    @IBOutlet weak var Ibutton: UIButton!
    @IBOutlet weak var Sbutton: UIButton!
    @IBOutlet weak var Tbutton: UIButton!
    @IBOutlet weak var Ubutton: UIButton!
    @IBOutlet weak var Vbutton: UIButton!
    @IBOutlet weak var Wbutton: UIButton!
    @IBOutlet weak var Xbutton: UIButton!
    @IBOutlet weak var Ybutton: UIButton!
    @IBOutlet weak var Zbutton: UIButton!
    @IBOutlet weak var Jbutton: UIButton!
    @IBOutlet weak var Kbutton: UIButton!
    @IBOutlet weak var Lbutton: UIButton!
    @IBOutlet weak var Mbutton: UIButton!
    @IBOutlet weak var Nbutton: UIButton!
    @IBOutlet weak var Obutton: UIButton!
    @IBOutlet weak var Qbutton: UIButton!
    @IBOutlet weak var Pbutton: UIButton!
    @IBOutlet weak var Rbutton: UIButton!
    
    
    
    @IBOutlet weak var PasswordLabel: UILabel!
    @IBOutlet weak var HangmanImage: UIImageView!
    @IBOutlet weak var CategoryLabel: UILabel!
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startProgram()
        startLabel()
    }
    
    
    func startProgram(){
        var LoadObject : LoadNamesClass
        var LoadPassword : PasswordClass
        LoadObject=LoadNamesClass()
        LoadPassword = LoadObject.getName()
        ViewController.Password=LoadPassword.Password
        CategoryLabel.text=LoadPassword.Category
        ViewController.Fails=0;
    }
    
    
    func startLabel(){
        
        for _ in 0..<ViewController.Password.count{
            xPassword=xPassword+"X"
        }
        PasswordLabel.text=xPassword
    }
    
    
    
    func swapLetter(buttonLetter: String){
        
        
        let letter=Character(buttonLetter)
        var passwordArray = Array (ViewController.Password.characters)
        var xPasswordString = String(PasswordLabel.text!)
        var xPassword = Array (xPasswordString.characters)
        
        for i in 0..<ViewController.Password.count{
            if (passwordArray[i] == letter) {
                xPassword[i] = letter
            }
            
        }
        xPasswordString = String(xPassword)
        PasswordLabel.text = xPasswordString
    }
    
    
    
    func checkPassword(letter:String, button: UIButton){
        let charset = CharacterSet(charactersIn: letter)
        if ViewController.Password.rangeOfCharacter(from: charset) != nil {
     
            button.setImage(UIImage(named: "yesresize.png"), for: .normal)
            swapLetter(buttonLetter: letter)

                if (ViewController.Password == PasswordLabel.text)
                {
                    var myScore : Int = Int(lcs.actualScore) ?? 0
                    myScore=myScore+10
                    var record : Int = Int(lcs.showScore()) ?? 0
                    if(myScore>record)
                    {
                        lcs.saveScore(newScore: String(myScore))
                    }
                    lcs.saveActualScore(newScore: String(myScore))
                    
                    
                let wc = self.storyboard?.instantiateViewController(withIdentifier: "WinClass") as! WinClass
                
                self.present(wc,animated: true,completion: nil)
              
                }
            }
            
        else{
            ViewController.Fails=ViewController.Fails+1
            
             button.setImage(UIImage(named: "noresize.png"), for: .normal)
            switch ViewController.Fails{
            case 1:
                HangmanImage.image=UIImage (named:"hangman1.png")
            case 2:
                HangmanImage.image=UIImage (named:"hangman2.png")
            case 3:
                HangmanImage.image=UIImage (named:"hangman3.png")
            case 4:
                HangmanImage.image=UIImage (named:"hangman4.png")
            case 5:
                
                var myScore : Int = Int(lcs.actualScore) ?? 0
                var record : Int = Int(lcs.showScore()) ?? 0
                if(myScore>record)
                {
                    lcs.saveScore(newScore: String(myScore))
                }
                
                let wc = self.storyboard?.instantiateViewController(withIdentifier: "LoseClass") as! LoseClass
                self.present(wc,animated: true,completion: nil)
                
            default:
                
                var myScore : Int = Int(lcs.actualScore) ?? 0
                var record : Int = Int(lcs.showScore()) ?? 0
                if(myScore>record)
                {
                    lcs.saveScore(newScore: String(myScore))
                }
                
                let wc = self.storyboard?.instantiateViewController(withIdentifier: "LoseClass") as! LoseClass
                self.present(wc,animated: true,completion: nil)
                
                
            }
          
           
            
            
            }
    }
    
    
    
    
    
    
    
    @IBAction func AbuttonAction(_ sender: Any) {
        let letter="a"
        checkPassword(letter: letter, button: Abutton)
    }
    
    @IBAction func BbuttonAction(_ sender: Any) {
        let letter="b"
        checkPassword(letter: letter, button: Bbutton)
    }
    
    @IBAction func CbuttonAction(_ sender: Any) {
        let letter = "c"
        checkPassword(letter: letter, button: Cbutton)
    }
    
    @IBAction func DbuttonAction(_ sender: Any) {
        let letter = "d"
        checkPassword(letter: letter, button: Dbutton)
    }
    
    @IBAction func EbuttonAction(_ sender: Any) {
        let letter = "e"
        checkPassword(letter: letter, button: Ebutton)
    }
    
    @IBAction func FbuttonAction(_ sender: Any) {
        let letter = "f"
        checkPassword(letter: letter, button: Fbutton)
    }
    @IBAction func GbuttonAction(_ sender: Any) {
        let letter = "g"
        checkPassword(letter: letter, button: Gbutton)
    }
    @IBAction func HbuttonAction(_ sender: Any) {
        let letter = "h"
        checkPassword(letter: letter, button: Hbutton)
    }
    @IBAction func IbuttonAction(_ sender: Any) {
        let letter = "i"
        checkPassword(letter: letter, button: Ibutton)
    }
    
    @IBAction func SbuttonAction(_ sender: Any) {
        let letter = "s"
        checkPassword(letter: letter, button: Sbutton)
    }
    @IBAction func TbuttonAction(_ sender: Any) {
        let letter = "t"
        checkPassword(letter: letter, button: Tbutton)
    }
    
    @IBAction func UbuttonAction(_ sender: Any) {
        let letter = "u"
        checkPassword(letter: letter, button: Ubutton)
    }
    
    @IBAction func VbuttonAction(_ sender: Any) {
        let letter = "v"
        checkPassword(letter: letter, button: Vbutton)
    }
    
    @IBAction func WbuttonAction(_ sender: Any) {
        let letter = "w"
        checkPassword(letter: letter, button: Wbutton)
    }
    
    @IBAction func XbuttonAction(_ sender: Any) {
        let letter = "x"
        checkPassword(letter: letter, button: Xbutton)
    }
    
    @IBAction func YbuttonAction(_ sender: Any) {
        let letter = "y"
        checkPassword(letter: letter, button: Ybutton)
    }
    @IBAction func ZbuttonAction(_ sender: Any) {
        let letter = "z"
        checkPassword(letter: letter, button: Zbutton)
    }
    
    @IBAction func JbuttonAction(_ sender: Any) {
        let letter = "j"
        checkPassword(letter: letter, button: Jbutton)
    }
    
    @IBAction func KbuttonAction(_ sender: Any) {
        let letter = "k"
        checkPassword(letter: letter, button: Kbutton)
    }
    
    @IBAction func LbuttonAction(_ sender: Any) {
        let letter = "l"
        checkPassword(letter: letter, button: Lbutton)
    }
    
    @IBAction func MbuttonAction(_ sender: Any) {
        let letter = "m"
        checkPassword(letter: letter, button: Mbutton)
    }
    @IBAction func NbuttonAction(_ sender: Any) {
        let letter = "n"
        checkPassword(letter: letter, button: Nbutton)
    }
    
    @IBAction func ObuttonAction(_ sender: Any) {
        let letter = "o"
        checkPassword(letter: letter, button: Obutton)
    }
    
    @IBAction func PbuttonAction(_ sender: Any) {
        let letter = "p"
        checkPassword(letter: letter, button: Pbutton)
    }
    
    @IBAction func QbuttonAction(_ sender: Any) {
        let letter = "q"
        checkPassword(letter: letter, button: Qbutton)
    }
    
    @IBAction func RbuttonAction(_ sender: Any) {
        let letter = "r"
        checkPassword(letter: letter, button: Rbutton)
    }
}

