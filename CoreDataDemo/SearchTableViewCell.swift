//
//  SearchTableViewCell.swift
//  CoreDataDemo
//
//  Created by Felix ITs 04 on 25/11/18.
//  Copyright © 2018 AkashG. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabelOutlet: UILabel!
    
    @IBOutlet weak var addressLabelOutlet: UILabel!
    
    @IBOutlet weak var dobLabelOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
