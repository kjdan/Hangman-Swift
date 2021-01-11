//
//  ScoreClass.swift
//  MobileProject
//
//  Created by Krzysztof Danielski on 05/12/2018.
//  Copyright © 2018 Krzysztof Danielski. All rights reserved.
//

import UIKit
import ClassKit
//klasa polaczona z ekranem wyswietlajacym najlepszy wynik
class ScoreClass: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let lcs=LoadScoreClass()
        scoreLabel.text=lcs.showScore()
        
        // Do any additional setup after loading the view.
    }
    

 

}
