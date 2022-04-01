//
//  DailyPlanVC.swift
//  Planner
//
//  Created by ADMS on 14/12/21.
//

import UIKit
import Cosmos

class arrDataList {
    var arrData:arrSubDataList

    init(arrData:arrSubDataList) {
        self.arrData = arrData
    }
}

class arrSubDataList {

    var dailyList:String
    var arrData:[arrSubPlanList]

    init(dailyList:String,arrData:[arrSubPlanList]) {
        self.dailyList = dailyList
        self.arrData = arrData
    }

}

class arrSubPlanList{
    var nameOfImage:String
    var taskName:String
    var scheduleTime:String

    init(nameOfImage:String,taskName:String,scheduleTime:String) {
        self.nameOfImage = nameOfImage
        self.taskName = taskName
        self.scheduleTime = scheduleTime

    }
}


class DailyPlanVC: UIViewController,popupDelegate {

    
    func showPopUpView() {
        lblPopUpText.text = "To Do"
        vwAddTask.isHidden = false
    }


    @IBOutlet weak var btnStar:UIButton!

    @IBOutlet weak var vwStarRate:CosmosView!

    @IBOutlet weak var txttask:UITextView!
    @IBOutlet weak var txtDesc:UITextView!


    var arrMainPlan = [arrSubDataList]()

    @IBOutlet weak var tblDailyPlan:UITableView!
    @IBOutlet weak var vwStarTating:UIView!
    @IBOutlet weak var vwStarSubRating:UIView!

    @IBOutlet weak var vwAddTask:UIView!
    @IBOutlet weak var vwSubAddTask:UIView!
    @IBOutlet weak var lblPopUpText:UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        vwStarRate.rating = 0
        vwStarRate.settings.fillMode = .half
        vwStarRate.settings.filledColor = UIColor.orange
        vwStarRate.settings.emptyBorderColor = UIColor.orange
        vwStarRate.settings.updateOnTouch = true
        vwStarRate.settings.starSize = 50
        vwStarRate.settings.starMargin = 5
        vwStarRate.settings.disablePanGestures = false

        //        vwStarRate.didTouchCosmos = didTouchCosmos


        txttask.layer.borderColor = UIColor.lightGray.cgColor
        txttask.layer.borderWidth = 0.5

        txttask.layer.cornerRadius = 4.0
        txttask.layer.masksToBounds = true


        txtDesc.layer.borderColor = UIColor.lightGray.cgColor
        txtDesc.layer.borderWidth = 0.5

        txtDesc.layer.cornerRadius = 4.0
        txtDesc.layer.masksToBounds = true



        tblDailyPlan.showsVerticalScrollIndicator = false
        tblDailyPlan.showsHorizontalScrollIndicator = false

        vwStarSubRating.layer.cornerRadius = 8
        vwStarSubRating.layer.shadowOffset = CGSize(width: 0, height: 3)
        vwStarSubRating.layer.shadowRadius = 3
        vwStarSubRating.layer.shadowOpacity = 0.3
        vwStarSubRating.layer.shadowColor = UIColor.black.cgColor


        vwSubAddTask.layer.cornerRadius = 8
        vwSubAddTask.layer.shadowOffset = CGSize(width: 0, height: 3)
        vwSubAddTask.layer.shadowRadius = 3
        vwSubAddTask.layer.shadowOpacity = 0.3
        vwSubAddTask.layer.shadowColor = UIColor.black.cgColor


        //

        arrMainPlan = [arrSubDataList(dailyList: "Priority Task", arrData: []),arrSubDataList(dailyList: "Other", arrData: [arrSubPlanList(nameOfImage: "planner-glass.png", taskName: "Water", scheduleTime: ""),arrSubPlanList(nameOfImage: "planner-meal.png", taskName: "Meal", scheduleTime: ""),arrSubPlanList(nameOfImage: "planner-excersise.png", taskName: "Excersise", scheduleTime: ""),arrSubPlanList(nameOfImage: "planner-todo.png", taskName: "To-Do", scheduleTime: ""),arrSubPlanList(nameOfImage: "planner-note.png", taskName: "Notes", scheduleTime: ""),arrSubPlanList(nameOfImage: "planner-thumb.png", taskName: "Thumb", scheduleTime: "")]),arrSubDataList(dailyList: "All Schedule", arrData: [arrSubPlanList(nameOfImage: "", taskName: "Open Bank A/C", scheduleTime: "5:00 am-6:00 am"),arrSubPlanList(nameOfImage: "", taskName: "Attend Ptm at 11 amAttend Ptm at 11 amAttend Ptm at 11 amAttend Ptm at 11 amAttend Ptm at 11 am", scheduleTime: "5:00 am-6:00 am"),arrSubPlanList(nameOfImage: "", taskName: "Deposit Utility Bills", scheduleTime: "5:00 am-6:00 am")])]

        tblDailyPlan.register(UINib(nibName: "DailyHeaderCell", bundle: nil), forCellReuseIdentifier: "DailyHeaderCell")

        tblDailyPlan.register(UINib(nibName: "DailyPlanCell", bundle: nil), forCellReuseIdentifier: "DailyPlanCell")

        tblDailyPlan.register(UINib(nibName: "ScheduleCell", bundle: nil), forCellReuseIdentifier: "ScheduleCell")
        tblDailyPlan.register(UINib(nibName: "ToDoCell", bundle: nil), forCellReuseIdentifier: "ToDoCell")



        tblDailyPlan.estimatedRowHeight = 61.0
        tblDailyPlan.rowHeight = UITableView.automaticDimension
    }
    @IBAction func btnClickStar(_ sender:Any){
        //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //        let obj = storyboard.instantiateViewController(withIdentifier: "RatingVC") as! RatingVC
        //        self.navigationController?.pushViewController(obj, animated: false)
        vwStarTating.isHidden = false

    }
    @IBAction func btnCloseClick(_ sender:Any)
    {
        vwStarTating.isHidden = true
        vwAddTask.isHidden = true
        print("total star:\(vwStarRate.rating)")
    }

    @objc func btnAddTask(_ sender:Any){

        for (index,_) in arrMainPlan.enumerated()
        {
            if "Priority Task" == arrMainPlan[index].dailyList
            {
                if arrMainPlan[index].arrData.count < 3
                {
                    lblPopUpText.text = "Add Task"
                    vwAddTask.isHidden = false
                    
                }else{
                }
            }
        }
    }

    @IBAction func btnAddTaskSub(_ sender:Any)
    {
        if lblPopUpText.text == "Add Task"
        {
            for (index,_) in arrMainPlan.enumerated()
            {
                if "Priority Task" == arrMainPlan[index].dailyList
                {
                    if txttask.text.count != 0{
                        let arrData1 = [arrSubPlanList(nameOfImage: "", taskName: txttask.text, scheduleTime: "")]
                        //                    let arr = [arrSubDataList(dailyList: "Priority Task", arrData: arrData)]
                        //                    arrMainPlan.append(contentsOf: arr)
                        arrMainPlan[index].arrData.append(contentsOf: arrData1)
                        txttask.text = ""
                        vwAddTask.isHidden = true

                        DispatchQueue.main.async {
                            self.tblDailyPlan.reloadData()
                        }
                        break
                    }
                }
            }
        }else{
            if txttask.text.count != 0
            {

                let obj = arrMainPlan.filter({$0.dailyList.contains("To-Do Lists")})


                if obj.count == 0
                {
                    let arrData1 = [arrSubPlanList(nameOfImage: "", taskName: txttask.text, scheduleTime: "")]
                    let arr = [arrSubDataList(dailyList: "To-Do Lists", arrData: arrData1)]
                    arrMainPlan.append(contentsOf: arr)
                    txttask.text = ""
                    vwAddTask.isHidden = true

                    DispatchQueue.main.async {
                        self.tblDailyPlan.reloadData()
                    }
                }else{
                    for(index,_) in arrMainPlan.enumerated()
                    {
                        if "To-Do Lists" == arrMainPlan[index].dailyList
                        {
                            if txttask.text.count != 0{
                                let arrData1 = [arrSubPlanList(nameOfImage: "", taskName: txttask.text, scheduleTime: "")]
                                //                    let arr = [arrSubDataList(dailyList: "Priority Task", arrData: arrData)]
                                //                    arrMainPlan.append(contentsOf: arr)
                                arrMainPlan[index].arrData.append(contentsOf: arrData1)
                                txttask.text = ""
                                vwAddTask.isHidden = true

                                DispatchQueue.main.async {
                                    self.tblDailyPlan.reloadData()
                                }
                                break
                            }
                        }
                    }
                }
            }
        }
    }
}
extension DailyPlanVC:UITableViewDelegate,UITableViewDataSource
{

    func numberOfSections(in tableView: UITableView) -> Int
    {
        return arrMainPlan.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {

        if arrMainPlan[section].dailyList == "All Schedule"
        {
            return arrMainPlan[section].arrData.count
        }
        else if arrMainPlan[section].dailyList == "To-Do Lists"
        {
            return arrMainPlan[section].arrData.count
        }
        else if arrMainPlan[section].dailyList == "Priority Task"
        {
            if arrMainPlan[section].arrData.count == 0
            {
                return 0
            }else{
                return 1
            }
        }
        else
        {
            return 1
        }

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if arrMainPlan[indexPath.section].dailyList == "All Schedule"
        {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath) as! ScheduleCell

            cell.selectionStyle = .none

            cell.scheduleTime.text = arrMainPlan[indexPath.section].arrData[indexPath.row].scheduleTime
            cell.scheduleText.text = arrMainPlan[indexPath.section].arrData[indexPath.row].taskName

            cell.schedulevw.layer.cornerRadius = 8
            cell.schedulevw.layer.shadowOffset = CGSize(width: 0, height: 3)
            cell.schedulevw.layer.shadowRadius = 3
            cell.schedulevw.layer.shadowOpacity = 0.3
            cell.schedulevw.layer.shadowColor = UIColor.black.cgColor
            //            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds,
            //    byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height:
            //    8)).cgPath

            //            cell.cellData(arrData: arrMainPlan[indexPath.section].arrData, dailyTask: arrMainPlan[indexPath.section].dailyList)

            return cell

        }else if "To-Do Lists" == arrMainPlan[indexPath.section].dailyList{
            let cell  = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell

            cell.selectionStyle = .none

            cell.todoView.layer.borderColor = UIColor.lightGray.cgColor
            cell.todoView.layer.borderWidth = 0.5


            cell.todotext.text = arrMainPlan[indexPath.section].arrData[indexPath.row].taskName
            return cell
        }
        else{
            let cell  = tableView.dequeueReusableCell(withIdentifier: "DailyPlanCell", for: indexPath) as! DailyPlanCell

            cell.selectionStyle = .none

            cell.delegatePopUp = self
            //            cell.arrData = arrMainPlan[indexPath.section].arrData
            //            cell.selectedSection1 = indexPath.section
            //            cell.strdailyTask1 = arrMainPlan[indexPath.section].dailyList
            cell.cellData(arrData: arrMainPlan, dailyTask: arrMainPlan[indexPath.section].dailyList,section:indexPath.section)

            return cell

        }

    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "DailyHeaderCell") as! DailyHeaderCell
        headerCell.planName.text = arrMainPlan[section].dailyList

        if "Other" == arrMainPlan[section].dailyList || "To-Do Lists" == arrMainPlan[section].dailyList
        //|| "To-Do Lists" == arrMainPlan[section].dailyList
        {
            headerCell.btnCreate.isHidden = true
        }else{
            headerCell.btnCreate.isHidden = false
        }

        headerCell.btnCreate.addTarget(self, action: #selector(btnAddTask(_ :)), for: .touchUpInside)

        return headerCell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension

    }
}
