//
//  DailyCell.swift
//  Planner
//
//  Created by ADMS on 21/12/21.
//

import UIKit

class DailyCell: UITableViewCell {

    @IBOutlet weak var dailyTaskColor:UIView!
    @IBOutlet weak var dailtTaskTime:UILabel!
    @IBOutlet weak var dailtTaskText:UILabel!

    @IBOutlet weak var dailyUpLine:UILabel!
    @IBOutlet weak var dailyDownLine:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
