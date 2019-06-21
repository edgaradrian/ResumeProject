//
//  DetailJobViewController.swift
//  MyResumeApp
//
//  Created by Edgar Adrián on 6/21/19.
//  Copyright © 2019 Edgar Adrián. All rights reserved.
//

import UIKit

class DetailJobViewController: UIViewController {
    
    @IBOutlet var labelActivities: UILabel!
    
    var job: Job! {
        didSet {
            navigationItem.title = job.company
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelActivities.text = job.activities
    }//viewDidLoad
    
}//DetailJobViewController
