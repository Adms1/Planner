//
//  DailyCalVC.swift
//  Planner
//
//  Created by ADMS on 20/12/21.
//

import UIKit
//import CalendarKit
//import EventKit
//import EventKitUI
import FSCalendar

class DailyCalVC: UIViewController{

    @IBOutlet weak var calendar: FSCalendar!

//    let eventStore = EKEventStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.scope = .week

        print("daasdsadsa",getAllDaysOfTheCurrentWeek())
    }

    func getAllDaysOfTheCurrentWeek() -> [Date] {
        var dates: [Date] = []
        guard let dateInterval = Calendar.current.dateInterval(of: .weekOfYear,
                                                               for: Date()) else {
            return dates
        }

        Calendar.current.enumerateDates(startingAfter: dateInterval.start+6,
                                        matching: DateComponents(hour:0),
                                        matchingPolicy: .nextTime) { date, _, stop in
                guard let date = date else {
                    return
                }
                if date <= dateInterval.end {
                    dates.append(date)
                } else {
                    stop = true
                }
        }

        return dates
    }

}
extension DailyCalVC:FSCalendarDelegate,FSCalendarDataSource{
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)

    }

    // This delegate call when date is DeSelected
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
    }

//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int
//    {
//
//        return titles.count
//
//    }
}
