//
//  ExtensionJobViewController.swift
//  MyResumeApp
//
//  Created by Edgar Adrián on 6/21/19.
//  Copyright © 2019 Edgar Adrián. All rights reserved.
//

import UIKit

extension JobViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailJobVC") as? DetailJobViewController {
            
            vc.job = dataSource.jobStore[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
                
        }//if let vc
        
    }//didSelectRowAt
    
}//extension JobViewController
