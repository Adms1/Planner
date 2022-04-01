//
//  MonthVC.swift
//  Planner
//
//  Created by ADMS on 20/12/21.
//

import UIKit
import FSCalendar
import EventKit
import EventKitUI

class EventDCModel{
    var eventDate:String
    var eventColor:UIColor

    init(eventDate:String,eventColor:UIColor) {
        self.eventDate = eventDate
        self.eventColor = eventColor
    }
}

class MonthVC: UIViewController,UITableViewDelegate,UITableViewDataSource,passAddEventDelegate {
//    func addTaskToList(obj: [addTaskModel], color: [UIColor], strDate: [String]) {
//        self.titles.append(contentsOf: obj)
//        self.arrEventColor.append(contentsOf: color)
//        self.arrEventDates.append(contentsOf: strDate)
//
//        DispatchQueue.main.async {
//            self.taskShow.reloadData()
//            self.calendar.reloadData()
//        }
//    }

    func addTaskToList(obj: [addTaskModel], color: [EventDCModel]) {
        self.titles.append(contentsOf: obj)
        self.arrEventDC.append(contentsOf: color)

        print("currentDate",currentDate)


        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"

        let date1 = formatter.date(from: self.currentDate)

        // let date12 = formatter.date(from: date1)

        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: date1!)
        formatter.dateFormat = "MM"
        let month = formatter.string(from: date1!)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: date1!)
        print(year, month, day) // 2018 12 24


        for (index,_) in self.titles.enumerated()
        {
            if self.titles[index].monthYear.contains("\(year)-\(month)") {
                filtered = self.titles.filter { $0.monthYear.contains("\(year)-\(month)") }
            }
        }

        DispatchQueue.main.async {
            self.taskShow.reloadData()
            self.calendar.reloadData()
        }


    }




//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }

//    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
//        controller.dismiss(animated: false, completion: nil)
//        readEvents()
//    }


    @IBOutlet weak var calendar: FSCalendar!

    @IBOutlet weak var taskShow: UITableView!

    var filtered  = [addTaskModel]()
    var titlesfiltered  = [addTaskModel]()

    var currentDate  = ""

    var titles  = [addTaskModel]()
    var arrEventDC  = [EventDCModel]()

    var arrEventColor = [UIColor]()
    var arrEventDates = [String]()

        fileprivate lazy var dateFormatter2: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter
        }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Monthly Calendar"
        taskShow.register(UINib(nibName: "ToDoCell", bundle: nil), forCellReuseIdentifier: "ToDoCell")

        calendar.calendarHeaderView.backgroundColor = UIColor.red
        calendar.calendarWeekdayView.backgroundColor = UIColor.red
       // calendar.backgroundColor = UIColor.red
        calendar.appearance.titleDefaultColor = UIColor.red
        calendar.appearance.borderDefaultColor = UIColor.white
        calendar.appearance.headerTitleColor = UIColor.white
        calendar.appearance.weekdayTextColor = UIColor.white
        calendar.appearance.borderSelectionColor = UIColor.lightGray


        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        currentDate = dateFormatter.string(from: NSDate() as Date)


//        calendar.appearance.eventDefaultColor = UIColor.red
//        calendar.appearance.headerSeparatorColor = UIColor.red
    }

    @IBAction func addNewEventAdd(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let obj = storyboard.instantiateViewController(withIdentifier: "AddEventVC") as! AddEventVC
        obj.delegatePassData = self
        self.navigationController?.pushViewController(obj, animated: true)
    }



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        cell.todotext.text = filtered[indexPath.row].title
        cell.todoSTime.text = filtered[indexPath.row].startTime

//        cell.eventColor.backgroundColor = filtered[indexPath.row].color
//
//        cell.eventColor.layer.cornerRadius = cell.eventColor.frame.height/2
//        cell.eventColor.layer.masksToBounds = true



        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        let date1 = formatter.date(from: filtered[indexPath.row].selectedTaskDate)

        // let date12 = formatter.date(from: date1)

//        formatter.dateFormat = "yyyy"
//        let year = formatter.string(from: date1!)
//        formatter.dateFormat = "MM"
//        let month = formatter.string(from: date1!)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: date1!)
//        print(year, month, day) // 2018 12 24

        cell.todoDate.text = "\(day)"
        cell.todoDate.backgroundColor = filtered[indexPath.row].color

        cell.todoDate.layer.cornerRadius = cell.todoDate.frame.height/2
        cell.todoDate.layer.masksToBounds = true


        return cell

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let obj = storyboard.instantiateViewController(withIdentifier: "EditTaskVC") as! EditTaskVC
//        obj.delegatePassData = self
        obj.objtaskModel = filtered[indexPath.row]
        self.navigationController?.pushViewController(obj, animated: true)

    }

}
extension MonthVC:FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance{
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)

    }

    // This delegate call when date is DeSelected
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
    }
    func calendarCurrentPageDidChange(_ calendar: FSCalendar){

      //  print(calendar.currentPage)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        let date1 = formatter.string(from: calendar.currentPage)

         let date12 = formatter.date(from: date1)

        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: date12!)
        formatter.dateFormat = "MM"
        let month = formatter.string(from: date12!)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: date12!)
        print(year, month, day) // 2018 12 24


        let dateComponents = DateComponents(year: Int(year), month: Int(month))
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!

        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        print(numDays)








       // print(calendar.minimumDate)

        filtered.removeAll()

        for (index,_) in self.titles.enumerated()
        {
            if self.titles[index].monthYear.contains("\(year)-\(month)") {
                filtered = self.titles.filter { $0.monthYear.contains("\(year)-\(month)") }
            }
        }

        DispatchQueue.main.async {
            self.taskShow.reloadData()
        }
    }
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {

        let dateString = self.dateFormatter2.string(from: date)

       // filtered.removeAll()

        for (index,_) in self.titles.enumerated()
        {
            if self.titles[index].selectedTaskDate.contains(dateString) {

               // var filtered  = [EventDCModel]()

                filtered = self.titles.filter { $0.selectedTaskDate.contains(dateString) }

//                DispatchQueue.main.async {
//                    self.taskShow.reloadData()
//                }

                return filtered.count

            }
        }


//        DispatchQueue.main.async {
//          //  self.filtered.removeAll()
//            self.taskShow.reloadData()
//        }
//        if self.datesWithMultipleEvents.contains(dateString) {
//            return 3
//        }

        return 0
    }
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
        let dateString = self.dateFormatter2.string(from: date)

//        if self.arrEventDates.contains(dateString) {
//            var filtered  = [UIColor]()
//            filtered = self.arrEventDates.filter { $0.contains(dateString) }
//           // return filtered.count
//            return filtered
//        }

        for (index,_) in arrEventDC.enumerated()
        {
            if self.titles[index].selectedTaskDate.contains(dateString) {

                filtered = self.titles.filter { $0.selectedTaskDate.contains(dateString) }
                var arrColor  = [UIColor]()
                for (index,_) in filtered.enumerated()
                {

                    arrColor.append(filtered[index].color)
                }

                return arrColor

            }
        }


//        if self.datesWithMultipleEvents.contains(dateString) {
//            return 3
//        }

        return []
    }


}
