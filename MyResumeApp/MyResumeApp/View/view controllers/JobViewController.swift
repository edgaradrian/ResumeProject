//
//  JobViewController.swift
//  MyResumeApp
//
//  Created by Edgar Adrián on 6/20/19.
//  Copyright © 2019 Edgar Adrián. All rights reserved.
//

import UIKit

class JobViewController: UIViewController {
    
    var jobStore: JobStore!
    
    @IBOutlet var tableView: UITableView!
    let dataSource = JobDataStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        uploadDataSource()
        
        jobStore.fetchJobs { (_) in
            self.uploadDataSource()
        }
    }//viewDidLoad
    
    fileprivate func configTableView() {
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.tableFooterView = UIView()
    }//configTableView
    
    private func uploadDataSource() {
        
        jobStore.fetchAllJobs { (result) in
            
            do {
                self.dataSource.jobStore = try result.get()
            } catch {
                self.dataSource.jobStore.removeAll()
            }
            
            self.tableView.reloadData()
            
        }//jobStore
        
    }//uploadDataSource
    
}//JobViewController


