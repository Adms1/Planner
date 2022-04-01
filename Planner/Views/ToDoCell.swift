//
//  ToDoCell.swift
//  Planner
//
//  Created by ADMS on 16/12/21.
//

import UIKit

class ToDoCell: UITableViewCell {
    @IBOutlet weak var todotext:UILabel!
    @IBOutlet weak var todoDate:UILabel!
    @IBOutlet weak var todoSTime:UILabel!

    @IBOutlet weak var todoView:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
