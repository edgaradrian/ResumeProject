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
    @IBOutlet var labelPeriod: UILabel!
    
    var job: Job! {
        didSet {
            navigationItem.title = job.company
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
    }//viewDidLoad
    
    fileprivate func setupLabels(){
        labelActivities.text = job.activities
        labelPeriod.text = job.period
    }
    
}//DetailJobViewController
