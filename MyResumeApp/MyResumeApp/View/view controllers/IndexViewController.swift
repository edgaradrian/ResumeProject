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
    }//viewDidLoad
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }//viewWillAppear
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }//viewWillDisappear
    
    @IBAction func onEmploymentHistoryButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "segueEmploymentHistoryID", sender: self)
    }//onEmploymentHistoryButtonTapped
    
    //MARK: Segue prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "segueEmploymentHistoryID"?:
            let jobViewController = segue.destination as! JobViewController
            jobViewController.jobStore = jobStore
            
        default:
            preconditionFailure("Unexpected segue identifier")
        }//switch
        
    }//prepare(for segue:)
    
}//IndexViewController
