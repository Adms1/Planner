//
//  WeeklyReviewVC.swift
//  Planner
//
//  Created by ADMS on 30/12/21.
//

import UIKit

class WeeklyReviewVC: UIViewController {

    @IBOutlet weak var txtWeeklyMoments:UITextView!
    @IBOutlet weak var txtWeeklyWell:UITextView!
    @IBOutlet weak var txtWeeklyImprovement:UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        txtWeeklyMoments.layer.borderWidth = 0.5
        txtWeeklyMoments.layer.borderColor  = UIColor.lightGray.cgColor

        txtWeeklyMoments.layer.cornerRadius = 5.0
        txtWeeklyMoments.layer.masksToBounds  = true

        txtWeeklyWell.layer.borderWidth = 0.5
        txtWeeklyWell.layer.borderColor  = UIColor.lightGray.cgColor

        txtWeeklyWell.layer.cornerRadius = 5.0
        txtWeeklyWell.layer.masksToBounds  = true

        txtWeeklyImprovement.layer.borderWidth = 0.5
        txtWeeklyImprovement.layer.borderColor  = UIColor.lightGray.cgColor

        txtWeeklyImprovement.layer.cornerRadius = 5.0
        txtWeeklyImprovement.layer.masksToBounds  = true


    }
    @IBAction func btnClickBack(_ sender:UIButton){
        self.navigationController?.popViewController(animated: false)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
