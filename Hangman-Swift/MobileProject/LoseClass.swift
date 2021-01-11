//
//  LoseClass.swift
//  MobileProject
//
//  Created by Krzysztof Danielski on 05/12/2018.
//  Copyright © 2018 Krzysztof Danielski. All rights reserved.
//

import UIKit
//klasa polaczona z wyswietlaniem ekranu przy przegranej
class LoseClass: UIViewController {

    @IBOutlet weak var LoseScoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let lcs=LoadScoreClass()
        LoseScoreLabel.text=lcs.showActualScore()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
