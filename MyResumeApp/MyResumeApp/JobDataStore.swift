//
//  JobDataStore.swift
//  MyResumeApp
//
//  Created by Edgar Adrián on 6/20/19.
//  Copyright © 2019 Edgar Adrián. All rights reserved.
//

import UIKit

class JobDataStore: NSObject, UITableViewDataSource {
    
    var jobStore = [Job]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobStore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "JobTableViewCellID"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! JobTableViewCell
        let job = jobStore[indexPath.row]
        cell.update(with: job.company, and: job.job_title)
        
        return cell
    }//cellForRowAt
    
    
}//
