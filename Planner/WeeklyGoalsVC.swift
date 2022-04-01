//
//  WeeklyGoalsVC.swift
//  Planner
//
//  Created by ADMS on 30/12/21.
//

import UIKit

class WeeklyGoalsVC: UIViewController {

    @IBOutlet weak var txtWeeklyGoals:UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        txtWeeklyGoals.layer.borderWidth = 0.5
        txtWeeklyGoals.layer.borderColor  = UIColor.lightGray.cgColor

        txtWeeklyGoals.layer.cornerRadius = 5.0
        txtWeeklyGoals.layer.masksToBounds  = true


    }
    @IBAction func btnClickBack(_ sender:UIButton){
        self.navigationController?.popViewController(animated: false)
    }

}
