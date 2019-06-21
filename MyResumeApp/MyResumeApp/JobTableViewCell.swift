//
//  JobTableViewCell.swift
//  MyResumeApp
//
//  Created by Edgar Adrián on 6/20/19.
//  Copyright © 2019 Edgar Adrián. All rights reserved.
//

import UIKit

class JobTableViewCell: UITableViewCell {
    
    @IBOutlet var labelCompanyName: UILabel!
    @IBOutlet var labelRoleName: UILabel!
    
    func update(with companyName: String?, and roleName: String?) {
        
        labelCompanyName.text = companyName
        labelRoleName.text = roleName
        
    }//update
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        update(with: nil, and: nil)
    }//awakeFromNib
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        update(with: nil, and: nil)
    }//prepareForReuse
    
}//class JobTableViewCell
