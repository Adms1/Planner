//
//  CreatePlanVC.swift
//  Planner
//
//  Created by ADMS on 14/12/21.
//

import UIKit

class CreatePlanVC: UIViewController {

    let arrPlan = ["Daily","Weekly","Monthly"]

    @IBOutlet weak var tblPlan:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CreatePlanVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPlan.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "CreatePlanCell", for: indexPath) as! CreatePlanCell
        
        cell.selectionStyle = .none
        cell.planName.text = "\(arrPlan[indexPath.row]) Task"
        cell.planName.textColor = UIColor.white
        cell.vwPlan.layer.cornerRadius = 5
        cell.vwPlan.layer.masksToBounds = true

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 61
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row == 2
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
       //     let obj = storyboard.instantiateViewController(withIdentifier: "DailyPlanVC") as! DailyPlanVC
            let obj = storyboard.instantiateViewController(withIdentifier: "MonthVC") as! MonthVC

            self.navigationController?.pushViewController(obj, animated: false)

        }else if indexPath.row == 1
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
       //     let obj = storyboard.instantiateViewController(withIdentifier: "DailyPlanVC") as! DailyPlanVC
            let obj = storyboard.instantiateViewController(withIdentifier: "WeeklyVC") as! WeeklyVC
            self.navigationController?.pushViewController(obj, animated: false)

        }



        else if indexPath.row == 0
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
       //     let obj = storyboard.instantiateViewController(withIdentifier: "DailyPlanVC") as! DailyPlanVC
            let obj = storyboard.instantiateViewController(withIdentifier: "DailyVC") as! DailyVC
            self.navigationController?.pushViewController(obj, animated: false)

        }


    }

}
