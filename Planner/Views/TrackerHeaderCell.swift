//
//  TrackerHeaderCell.swift
//  Planner
//
//  Created by ADMS on 30/12/21.
//

import UIKit

class TrackerHeaderCell: UITableViewCell
{

    @IBOutlet weak var lblMon:UILabel!
    @IBOutlet weak var lblTues:UILabel!
    @IBOutlet weak var lblWed:UILabel!
    @IBOutlet weak var lblThir:UILabel!
    @IBOutlet weak var lblFri:UILabel!
    @IBOutlet weak var lblSat:UILabel!
    @IBOutlet weak var lblSun:UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
