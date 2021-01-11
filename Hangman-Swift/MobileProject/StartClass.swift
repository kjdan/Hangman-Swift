//
//  StartClass.swift
//  MobileProject
//
//  Created by Krzysztof Danielski on 05/12/2018.
//  Copyright © 2018 Krzysztof Danielski. All rights reserved.
//

import UIKit
//klasa polaczona z wyswietlaniem ekranu startowego 
class StartClass: UIViewController {
var lcs=LoadScoreClass()
    override func viewDidLoad() {
        super.viewDidLoad()
        lcs.zeroScore()
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func ExitGame(_ sender: Any) {
        exit(0)
    }
    
}
