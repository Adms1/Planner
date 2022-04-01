//
//  ScheduleCell.swift
//  Planner
//
//  Created by ADMS on 14/12/21.
//

import UIKit

class ScheduleCell: UITableViewCell {

    @IBOutlet weak var scheduleText:UILabel!
    @IBOutlet weak var scheduleTime:UILabel!
    @IBOutlet weak var schedulevw:UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
