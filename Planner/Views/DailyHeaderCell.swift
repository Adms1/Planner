//
//  DailyHeaderCell.swift
//  Planner
//
//  Created by ADMS on 14/12/21.
//

import UIKit

class DailyHeaderCell: UITableViewCell {

    @IBOutlet weak var planName:UILabel!
    @IBOutlet weak var btnCreate:UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
