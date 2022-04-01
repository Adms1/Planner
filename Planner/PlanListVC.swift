//
//  PlanListVC.swift
//  Planner
//
//  Created by ADMS on 14/12/21.
//

import UIKit

class PlanListVC: UIViewController {

    @IBOutlet weak var btnPlus:UIButton!
    @IBOutlet weak var lblNoplanAvail:UILabel!
    @IBOutlet weak var tblPlanList:UITableView!

    let arrPlanList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if arrPlanList.count == 0
        {
            tblPlanList.isHidden = true
            lblNoplanAvail.isHidden = false
        }else{
            tblPlanList.isHidden = false
            lblNoplanAvail.isHidden = true
        }




        
    }

    @IBAction func btnClickOnPlus(_ sender:Any){

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let obj = storyboard.instantiateViewController(withIdentifier: "CreatePlanVC") as! CreatePlanVC
        self.navigationController?.pushViewController(obj, animated: false)

    }
}
extension PlanListVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPlanList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "CreatePlanCell", for: indexPath) as! CreatePlanCell
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 61
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}
