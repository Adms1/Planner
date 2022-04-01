//
//  WeeklyHabitVC.swift
//  Planner
//
//  Created by ADMS on 03/01/22.
//

import UIKit

class habitModel{
    var habitTitle:String
    var habitImage:String
    var habitMonday:Bool
    var habitTuesday:Bool
    var habitWed:Bool
    var habitThiresDAy:Bool
    var habitFriday:Bool
    var habiSaterday:Bool
    var habitSunday:Bool

    init(habitTitle:String,habitImage:String,habitMonday:Bool,habitTuesday:Bool,habitWed:Bool,habitThiresDAy:Bool,habitFriday:Bool,habiSaterday:Bool,habitSunday:Bool) {
        self.habitTitle = habitTitle
        self.habitImage = habitImage
        self.habitMonday = habitMonday
        self.habitTuesday = habitTuesday
        self.habitWed = habitWed
        self.habitThiresDAy = habitThiresDAy
        self.habitFriday = habitFriday
        self.habiSaterday = habiSaterday
        self.habitSunday = habitSunday

    }
}

class WeeklyHabitVC: UIViewController
{

    @IBOutlet weak var tblhabit:UITableView!

    var arrhabitList = [habitModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tblhabit.register(UINib(nibName: "TrackerCell", bundle: nil), forCellReuseIdentifier: "TrackerCell")
        tblhabit.register(UINib(nibName: "TrackerHeaderCell", bundle: nil), forCellReuseIdentifier: "TrackerHeaderCell")

        arrhabitList = [habitModel(habitTitle: "Gym", habitImage: "", habitMonday: false, habitTuesday: false, habitWed: false, habitThiresDAy: false, habitFriday: false, habiSaterday: false, habitSunday: false),habitModel(habitTitle: "Reading", habitImage: "", habitMonday: false, habitTuesday: false, habitWed: false, habitThiresDAy: false, habitFriday: false, habiSaterday: false, habitSunday: false),habitModel(habitTitle: "Walking", habitImage: "", habitMonday: false, habitTuesday: false, habitWed: false, habitThiresDAy: false, habitFriday: false, habiSaterday: false, habitSunday: false),habitModel(habitTitle: "Yoga", habitImage: "", habitMonday: false, habitTuesday: false, habitWed: false, habitThiresDAy: false, habitFriday: false, habiSaterday: false, habitSunday: false),habitModel(habitTitle: "Bank", habitImage: "", habitMonday: false, habitTuesday: false, habitWed: false, habitThiresDAy: false, habitFriday: false, habiSaterday: false, habitSunday: false)]
    }
    
}
extension WeeklyHabitVC:UITableViewDelegate,UITableViewDataSource
{

    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrhabitList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell  = tableView.dequeueReusableCell(withIdentifier: "TrackerCell", for: indexPath) as! TrackerCell

        cell.lblhabitType.text = arrhabitList[indexPath.row].habitTitle

        cell.selectionStyle = .none

        print("indexPath.row",indexPath.row)

        if indexPath.row % 2 == 0
        {
            cell.vwtrack.backgroundColor = UIColor.white
        }else{
            cell.vwtrack.backgroundColor = UIColor.lightGray
        }

        cell.vwtrack.layer.borderWidth = 0.5
        cell.vwtrack.layer.borderColor = UIColor.black.cgColor



        cell.btnMon.layer.borderWidth = 0.5
        cell.btnMon.layer.borderColor = UIColor.black.cgColor
        cell.btnTues.layer.borderWidth = 0.5
        cell.btnTues.layer.borderColor = UIColor.black.cgColor
        cell.btnWed.layer.borderWidth = 0.5
        cell.btnWed.layer.borderColor = UIColor.black.cgColor
        cell.btnThir.layer.borderWidth = 0.5
        cell.btnThir.layer.borderColor = UIColor.black.cgColor
        cell.btnFri.layer.borderWidth = 0.5
        cell.btnFri.layer.borderColor = UIColor.black.cgColor
        cell.btnSat.layer.borderWidth = 0.5
        cell.btnSat.layer.borderColor = UIColor.black.cgColor
        cell.btnSun.layer.borderWidth = 0.5
        cell.btnSun.layer.borderColor = UIColor.black.cgColor

//        cell.btnMon

        cell.btnMon.tag = indexPath.row
        cell.btnTues.tag = indexPath.row
        cell.btnWed.tag = indexPath.row
        cell.btnThir.tag = indexPath.row
        cell.btnFri.tag = indexPath.row
        cell.btnSat.tag = indexPath.row
        cell.btnSun.tag = indexPath.row

        cell.btnMon.addTarget(self, action: #selector(btnClickMonday), for: .touchUpInside)
        cell.btnTues.addTarget(self, action: #selector(btnClickTuesday), for: .touchUpInside)
        cell.btnWed.addTarget(self, action: #selector(btnClickWed), for: .touchUpInside)
        cell.btnThir.addTarget(self, action: #selector(btnClickThirsday), for: .touchUpInside)
        cell.btnFri.addTarget(self, action: #selector(btnClickFriday), for: .touchUpInside)
        cell.btnSat.addTarget(self, action: #selector(btnClickSaturday), for: .touchUpInside)
        cell.btnSun.addTarget(self, action: #selector(btnClickSunday), for: .touchUpInside)

        if arrhabitList[indexPath.row].habitImage == ""
        {
            if arrhabitList[indexPath.row].habitMonday == false && arrhabitList[indexPath.row].habitImage == ""
            {
                    cell.btnMon.setImage(UIImage(named: ""), for: .normal)

            }else if arrhabitList[indexPath.row].habitTuesday == true && arrhabitList[indexPath.row].habitImage == ""
            {
                    cell.btnTues.setImage(UIImage(named: ""), for: .normal)

            }else if arrhabitList[indexPath.row].habitWed == true && arrhabitList[indexPath.row].habitImage == ""
            {
                    cell.btnWed.setImage(UIImage(named: ""), for: .normal)

            }
            else if arrhabitList[indexPath.row].habitThiresDAy == true && arrhabitList[indexPath.row].habitImage == ""
            {
                    cell.btnThir.setImage(UIImage(named: ""), for: .normal)
            }
            else if arrhabitList[indexPath.row].habitFriday == true && arrhabitList[indexPath.row].habitImage == ""
            {
                    cell.btnFri.setImage(UIImage(named: ""), for: .normal)
            }
            else if arrhabitList[indexPath.row].habiSaterday == true && arrhabitList[indexPath.row].habitImage == ""
            {
                    cell.btnSat.setImage(UIImage(named: ""), for: .normal)
            }
            else if arrhabitList[indexPath.row].habiSaterday == true && arrhabitList[indexPath.row].habitImage == ""
            {
                    cell.btnSun.setImage(UIImage(named: ""), for: .normal)
            }
        }else
        {
            if arrhabitList[indexPath.row].habitMonday == true
            {

                if arrhabitList[indexPath.row].habitImage == ""
                {
                    cell.btnMon.setImage(UIImage(named: ""), for: .normal)

                }else{
                    cell.btnMon.setImage(UIImage(named: arrhabitList[indexPath.row].habitImage), for: .normal)

                }


            }
            if arrhabitList[indexPath.row].habitTuesday == true
            {
                if arrhabitList[indexPath.row].habitImage == ""
                {
                    cell.btnTues.setImage(UIImage(named: ""), for: .normal)

                }else{
                    cell.btnTues.setImage(UIImage(named: arrhabitList[indexPath.row].habitImage), for: .normal)
                }


            }
            if arrhabitList[indexPath.row].habitWed == true
            {
                if arrhabitList[indexPath.row].habitImage == ""
                {
                    cell.btnWed.setImage(UIImage(named: ""), for: .normal)

                }else{
                    cell.btnWed.setImage(UIImage(named: arrhabitList[indexPath.row].habitImage), for: .normal)
                }

            }
            if arrhabitList[indexPath.row].habitThiresDAy == true
            {
                if arrhabitList[indexPath.row].habitImage == ""
                {
                    cell.btnThir.setImage(UIImage(named: ""), for: .normal)

                }else{
                    cell.btnThir.setImage(UIImage(named: arrhabitList[indexPath.row].habitImage), for: .normal)
                }
            }
            if arrhabitList[indexPath.row].habitFriday == true
            {
                if arrhabitList[indexPath.row].habitImage == ""
                {
                    cell.btnFri.setImage(UIImage(named: ""), for: .normal)

                }else{
                    cell.btnFri.setImage(UIImage(named: arrhabitList[indexPath.row].habitImage), for: .normal)
                }
            }
            if arrhabitList[indexPath.row].habiSaterday == true
            {
                if arrhabitList[indexPath.row].habitImage == ""
                {
                    cell.btnSat.setImage(UIImage(named: ""), for: .normal)

                }else{
                    cell.btnSat.setImage(UIImage(named: arrhabitList[indexPath.row].habitImage), for: .normal)
                }
            }
            if arrhabitList[indexPath.row].habitSunday == true
            {
                if arrhabitList[indexPath.row].habitImage == ""
                {
                    cell.btnSun.setImage(UIImage(named: ""), for: .normal)

                }else{
                    cell.btnSun.setImage(UIImage(named: arrhabitList[indexPath.row].habitImage), for: .normal)
                }
            }
        }
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "TrackerHeaderCell") as! TrackerHeaderCell

        headerCell.layer.borderWidth = 0.5
        headerCell.layer.borderColor = UIColor.black.cgColor


        headerCell.lblMon.layer.borderWidth = 0.5
        headerCell.lblMon.layer.borderColor = UIColor.black.cgColor
        headerCell.lblTues.layer.borderWidth = 0.5
        headerCell.lblTues.layer.borderColor = UIColor.black.cgColor
        headerCell.lblWed.layer.borderWidth = 0.5
        headerCell.lblWed.layer.borderColor = UIColor.black.cgColor
        headerCell.lblThir.layer.borderWidth = 0.5
        headerCell.lblThir.layer.borderColor = UIColor.black.cgColor
        headerCell.lblFri.layer.borderWidth = 0.5
        headerCell.lblFri.layer.borderColor = UIColor.black.cgColor
        headerCell.lblSat.layer.borderWidth = 0.5
        headerCell.lblSat.layer.borderColor = UIColor.black.cgColor
        headerCell.lblSun.layer.borderWidth = 0.5
        headerCell.lblSun.layer.borderColor = UIColor.black.cgColor

        return headerCell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44

    }

    @objc func btnClickMonday(sender:UIButton)
    {
//        let buttonPosition = sender.convert(CGPoint.zero, to: self.tblhabit)
//        let indexPath = self.tblhabit.indexPathForRow(at:buttonPosition)
//        let cell = self.tblhabit.cellForRow(at: indexPath!) as! TrackerCell

        arrhabitList[sender.tag].habitImage = "correct.png"
        arrhabitList[sender.tag].habitMonday = true


        DispatchQueue.main.async {
            self.tblhabit.reloadData()
        }
    }
    @objc func btnClickTuesday(sender:UIButton)
    {
        arrhabitList[sender.tag].habitImage = "correct.png"
        arrhabitList[sender.tag].habitTuesday = true

        DispatchQueue.main.async {
            self.tblhabit.reloadData()
        }

    }
    @objc func btnClickWed(sender:UIButton)
    {
        arrhabitList[sender.tag].habitImage = "correct.png"
        arrhabitList[sender.tag].habitWed = true

        DispatchQueue.main.async {
            self.tblhabit.reloadData()
        }

    }
    @objc func btnClickThirsday(sender:UIButton)
    {
        arrhabitList[sender.tag].habitImage = "correct.png"
        arrhabitList[sender.tag].habitThiresDAy = true

        DispatchQueue.main.async {
            self.tblhabit.reloadData()
        }

    }
    @objc func btnClickFriday(sender:UIButton)
    {
        arrhabitList[sender.tag].habitImage = "correct.png"
        arrhabitList[sender.tag].habitFriday = true

        DispatchQueue.main.async {
            self.tblhabit.reloadData()
        }

    }
    @objc func btnClickSaturday(sender:UIButton)
    {
        arrhabitList[sender.tag].habitImage = "correct.png"
        arrhabitList[sender.tag].habiSaterday = true

        DispatchQueue.main.async {
            self.tblhabit.reloadData()
        }

    }
    @objc func btnClickSunday(sender:UIButton)
    {
        arrhabitList[sender.tag].habitImage = "correct.png"
        arrhabitList[sender.tag].habitSunday = true

        DispatchQueue.main.async {
            self.tblhabit.reloadData()
        }

    }


}
