//
//  CutomCell.swift
//  CoreDataDemo
//
//  Created by Felix ITs 04 on 17/11/18.
//  Copyright © 2018 AkashG. All rights reserved.
//

import UIKit

class CutomCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var dobLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
