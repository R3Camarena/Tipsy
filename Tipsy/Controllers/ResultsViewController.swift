//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Ricardo Camarena on 05/09/22.
//  Copyright © 2022 Ricardo Camarena. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitInfo: UILabel!
    
    var result = "0.0"
    var tip = 10
    var split = 2

    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = result
        splitInfo.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
