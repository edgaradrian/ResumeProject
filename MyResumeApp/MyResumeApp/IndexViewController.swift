//
//  IndexViewController.swift
//  MyResumeApp
//
//  Created by Edgar Adrián on 6/19/19.
//  Copyright © 2019 Edgar Adrián. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController {
    
    var jobStore: JobStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobStore.fetchJobs {
            print("Hola")
        }
    }//viewDidLoad
    
}//IndexViewController
