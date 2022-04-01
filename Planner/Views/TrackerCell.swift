//
//  TrackerCell.swift
//  Planner
//
//  Created by ADMS on 30/12/21.
//

import UIKit

class TrackerCell: UITableViewCell {

    @IBOutlet weak var lblhabitType:UILabel!
    @IBOutlet weak var btnMon:UIButton!
    @IBOutlet weak var btnTues:UIButton!
    @IBOutlet weak var btnWed:UIButton!
    @IBOutlet weak var btnThir:UIButton!
    @IBOutlet weak var btnFri:UIButton!
    @IBOutlet weak var btnSat:UIButton!
    @IBOutlet weak var btnSun:UIButton!

    @IBOutlet weak var vwtrack:UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
