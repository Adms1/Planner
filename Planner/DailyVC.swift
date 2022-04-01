//
//  DailyVC.swift
//  Planner
//
//  Created by ADMS on 21/12/21.
//

import UIKit

class addTaskModel {
    var selectedTaskDate:String
    var startTime:String
    var endTime:String
    var title:String
    var desc:String
    var place:String
    var monthYear:String
    var color:UIColor

    init(selectedTaskDate:String,startTime:String,endTime:String,title:String,desc:String,place:String,color:UIColor,monthYear:String) {
        self.selectedTaskDate = selectedTaskDate
        self.startTime = startTime
        self.endTime = endTime
        self.title = title
        self.desc = desc
        self.place = place
        self.color = color
        self.monthYear = monthYear
    }

}

class DailyVC: UIViewController,passAddEventDelegate {
    func addTaskToList(obj: [addTaskModel], color: [EventDCModel]) {
        self.arrTaskList.append(contentsOf: obj)

        DispatchQueue.main.async {
            self.tblDailyPlan.reloadData()
        }
    }

//    func addTaskToList(obj: [addTaskModel], color: [UIColor], strDate: [String]) {
//        self.arrTaskList.append(contentsOf: obj)
//
//        DispatchQueue.main.async {
//            self.tblDailyPlan.reloadData()
//        }
//
//    }
    var arrTaskList = [addTaskModel]()
    @IBOutlet weak var tblDailyPlan:UITableView!
    @IBOutlet weak var lbldate:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        tblDailyPlan.register(UINib(nibName: "DailyCell", bundle: nil), forCellReuseIdentifier: "DailyCell")

        tblDailyPlan.estimatedRowHeight = 61.0
        tblDailyPlan.rowHeight = UITableView.automaticDimension

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY"
        let date = dateFormatter.string(from: NSDate() as Date)


        self.lbldate.text = date


    }
    @IBAction func btnClickBack(_ sender:UIButton){
        self.navigationController?.popViewController(animated: false)
    }
    @IBAction func addNewEventAdd(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
   //     let obj = storyboard.instantiateViewController(withIdentifier: "DailyPlanVC") as! DailyPlanVC
        let obj = storyboard.instantiateViewController(withIdentifier: "AddEventVC") as! AddEventVC
        obj.delegatePassData = self
        self.navigationController?.pushViewController(obj, animated: true)
    }
}
extension DailyVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTaskList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "DailyCell", for: indexPath) as! DailyCell
        cell.selectionStyle = .none

//        cell.dailyUpLine.isHidden = true
//        cell.dailyDownLine.isHidden = true

//        cell.layer.cornerRadius = 8
//        cell.layer.shadowOffset = CGSize(width: 0, height: 3)
//        cell.layer.shadowRadius = 3
//        cell.layer.shadowOpacity = 0.3
//        cell.layer.shadowColor = UIColor.black.cgColor


        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5

//        if indexPath.row == 0
//        {
//            cell.dailyUpLine.isHidden = false
//            cell.dailyDownLine.isHidden = false
//        }else{
//            cell.dailyDownLine.isHidden = false
//            cell.dailyUpLine.isHidden = true
//        }

//        let dformatter = DateFormatter()
//        dformatter.dateFormat = "hh:mm"
//        let startDt = dformatter.date(from: arrTaskList[indexPath.row].startTime)
        
        cell.dailtTaskTime.text = "\(arrTaskList[indexPath.row].startTime) to \(arrTaskList[indexPath.row].endTime)"
        cell.dailtTaskText.text = arrTaskList[indexPath.row].title
        cell.dailyTaskColor.backgroundColor = arrTaskList[indexPath.row].color

        return cell

    }

    

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension

    }

}
