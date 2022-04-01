//
//  WeeklyTaskVC.swift
//  Planner
//
//  Created by ADMS on 24/12/21.
//

import UIKit
import CVCalendar

class WeeklyTaskVC: UIViewController {

//    @IBOutlet weak var btnPrevious:UIButton!
//    @IBOutlet weak var btnCurrent:UIButton!
//    @IBOutlet weak var btnNext:UIButton!
//
//    @IBOutlet weak var lblStartDate:UILabel!
//    @IBOutlet weak var lblEndDate:UILabel!

    @IBOutlet weak var lblMon:UILabel!
    @IBOutlet weak var lblTues:UILabel!
    @IBOutlet weak var lblWed:UILabel!
    @IBOutlet weak var lblThir:UILabel!
    @IBOutlet weak var lblFri:UILabel!
    @IBOutlet weak var lblSat:UILabel!
    @IBOutlet weak var lblSun:UILabel!


    @IBOutlet weak var txtMon:UITextView!
    @IBOutlet weak var txtTues:UITextView!
    @IBOutlet weak var txtWed:UITextView!
    @IBOutlet weak var txtThir:UITextView!
    @IBOutlet weak var txtFri:UITextView!
    @IBOutlet weak var txtSat:UITextView!
    @IBOutlet weak var txtSun:UITextView!
//    @IBOutlet weak var scrollview:UIScrollView!
    @IBOutlet weak var vwContant:UIView!

    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var menuView: CVCalendarMenuView!

    private var randomNumberOfDotMarkersForDay = [Int]()
    private var shouldShowDaysOut = true
    private var animationFinished = true
    private var selectedDay: DayView!
    private var currentCalendar: Calendar?


    var arrDateList = [Any]()



    override func viewDidLoad() {
        super.viewDidLoad()

        calendarView.changeMode(.weekView)


        txtMon.layer.borderWidth = 0.5
        txtMon.layer.borderColor  = UIColor.lightGray.cgColor

        txtMon.layer.cornerRadius = 5.0
        txtMon.layer.masksToBounds = true

        txtTues.layer.borderWidth = 0.5
        txtTues.layer.borderColor  = UIColor.lightGray.cgColor

        txtTues.layer.cornerRadius = 5.0
        txtTues.layer.masksToBounds = true


        txtWed.layer.borderWidth = 0.5
        txtWed.layer.borderColor  = UIColor.lightGray.cgColor

        txtWed.layer.cornerRadius = 5.0
        txtWed.layer.masksToBounds = true


        txtThir.layer.borderWidth = 0.5
        txtThir.layer.borderColor  = UIColor.lightGray.cgColor

        txtThir.layer.cornerRadius = 5.0
        txtThir.layer.masksToBounds = true


        txtFri.layer.borderWidth = 0.5
        txtFri.layer.borderColor  = UIColor.lightGray.cgColor

        txtFri.layer.cornerRadius = 5.0
        txtFri.layer.masksToBounds = true


        txtSat.layer.borderWidth = 0.5
        txtSat.layer.borderColor  = UIColor.lightGray.cgColor

        txtSat.layer.cornerRadius = 5.0
        txtSat.layer.masksToBounds = true


        txtSun.layer.borderWidth = 0.5
        txtSun.layer.borderColor  = UIColor.lightGray.cgColor

        txtSun.layer.cornerRadius = 5.0
        txtSun.layer.masksToBounds = true
    }
    @IBAction func btnClickBack(_ sender:UIButton){
        self.navigationController?.popViewController(animated: false)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // Commit frames' updates
        self.menuView.commitMenuViewUpdate()
        self.calendarView.commitCalendarViewUpdate()
    }


}
// MARK: - CVCalendarViewAppearanceDelegate

extension WeeklyTaskVC: CVCalendarViewAppearanceDelegate {

    func dayLabelWeekdayDisabledColor() -> UIColor { return .lightGray }

    func dayLabelPresentWeekdayInitallyBold() -> Bool { return false }

    func spaceBetweenDayViews() -> CGFloat { return 0 }

    func dayLabelFont(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIFont { return UIFont.systemFont(ofSize: 14)

    }

//    func dayLabelColor(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIColor? {
//        switch (weekDay, status, present) {
//        case (_, .selected, _), (_, .highlighted, _): return ColorsConfig.selectedText
//        case (.sunday, .in, _): return ColorsConfig.sundayText
//        case (.sunday, _, _): return ColorsConfig.sundayTextDisabled
//        case (_, .in, _): return ColorsConfig.text
//        default: return ColorsConfig.textDisabled
//        }
//    }

//    func dayLabelBackgroundColor(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIColor? {
//        switch (weekDay, status, present) {
//        case (.sunday, .selected, _), (.sunday, .highlighted, _): return ColorsConfig.sundaySelectionBackground
//        case (_, .selected, _), (_, .highlighted, _): return ColorsConfig.selectionBackground
//        default: return nil
//        }
//    }
}
// MARK: - CVCalendarViewDelegate & CVCalendarMenuViewDelegate

extension WeeklyTaskVC: CVCalendarViewDelegate, CVCalendarMenuViewDelegate {

    // MARK: Required methods

    func presentationMode() -> CalendarMode { return .weekView }

    func firstWeekday() -> Weekday { return .sunday }

    // MARK: Optional methods

    func calendar() -> Calendar? { return currentCalendar }

    func dayOfWeekTextColor(by weekday: Weekday) -> UIColor {
//        return weekday == .sunday ? UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0) : UIColor.white
        return weekday == .sunday ? UIColor.white : UIColor.white

    }

    func shouldShowWeekdaysOut() -> Bool { return shouldShowDaysOut }

    // Defaults to true
    func shouldAnimateResizing() -> Bool { return true }

    private func shouldSelectDayView(dayView: DayView) -> Bool {
        return arc4random_uniform(0) == 0 ? true : false
    }

    func shouldAutoSelectDayOnMonthChange() -> Bool { return true }

    func didSelectDayView(_ dayView: CVCalendarDayView, animationDidFinish: Bool) {
        print("dayView",dayView.date.day)
        selectedDay = dayView
    }

    func shouldSelectRange() -> Bool { return false }


    func didSelectRange(from startDayView: DayView, to endDayView: DayView) {
        print("RANGE SELECTED: \(startDayView.date.commonDescription) to \(endDayView.date.commonDescription)")
    }

//    func presentedDateUpdated(_ date: CVDate) {
//        if monthLabel.text != date.globalDescription && self.animationFinished {
//            let updatedMonthLabel = UILabel()
//            updatedMonthLabel.textColor = monthLabel.textColor
//            updatedMonthLabel.font = monthLabel.font
//            updatedMonthLabel.textAlignment = .center
//            updatedMonthLabel.text = date.globalDescription
//            updatedMonthLabel.sizeToFit()
//            updatedMonthLabel.alpha = 0
//            updatedMonthLabel.center = self.monthLabel.center
//
//            let offset = CGFloat(48)
//            updatedMonthLabel.transform = CGAffineTransform(translationX: 0, y: offset)
//            updatedMonthLabel.transform = CGAffineTransform(scaleX: 1, y: 0.1)
//
//            UIView.animate(withDuration: 0.35, delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
//                self.animationFinished = false
//                self.monthLabel.transform = CGAffineTransform(translationX: 0, y: -offset)
//                self.monthLabel.transform = CGAffineTransform(scaleX: 1, y: 0.1)
//                self.monthLabel.alpha = 0
//
//                updatedMonthLabel.alpha = 1
//                updatedMonthLabel.transform = CGAffineTransform.identity
//
//            }) { _ in
//
//                self.animationFinished = true
//                self.monthLabel.frame = updatedMonthLabel.frame
//                self.monthLabel.text = updatedMonthLabel.text
//                self.monthLabel.transform = CGAffineTransform.identity
//                self.monthLabel.alpha = 1
//                updatedMonthLabel.removeFromSuperview()
//            }
//
//            self.view.insertSubview(updatedMonthLabel, aboveSubview: self.monthLabel)
//        }
//    }

    func topMarker(shouldDisplayOnDayView dayView: CVCalendarDayView) -> Bool { return false }

    func shouldHideTopMarkerOnPresentedView() -> Bool {
        return false
    }

    func weekdaySymbolType() -> WeekdaySymbolType { return .short }

    func selectionViewPath() -> ((CGRect) -> (UIBezierPath)) {
        return { UIBezierPath(rect: CGRect(x: 0, y: 0, width: $0.width, height: $0.height)) }
    }

    func shouldShowCustomSingleSelection() -> Bool { return true }

    func preliminaryView(viewOnDayView dayView: DayView) -> UIView {
        let circleView = CVAuxiliaryView(dayView: dayView, rect: dayView.frame, shape: CVShape.circle)
        circleView.fillColor = .colorFromCode(0xCCCCCC)
        return circleView
    }

    func preliminaryView(shouldDisplayOnDayView dayView: DayView) -> Bool {
        if (dayView.isCurrentDay) {
            return true
        }
        return false
    }

    func supplementaryView(viewOnDayView dayView: DayView) -> UIView {

        dayView.setNeedsLayout()
        dayView.layoutIfNeeded()

        let π = Double.pi

        let ringLayer = CAShapeLayer()
        let ringLineWidth: CGFloat = 4.0
        let ringLineColour = UIColor.blue

        let newView = UIView(frame: dayView.frame)

        let diameter = (min(newView.bounds.width, newView.bounds.height))
        let radius = diameter / 2.0 - ringLineWidth

        newView.layer.addSublayer(ringLayer)

        ringLayer.fillColor = nil
        ringLayer.lineWidth = ringLineWidth
        ringLayer.strokeColor = ringLineColour.cgColor

        let centrePoint = CGPoint(x: newView.bounds.width/2.0, y: newView.bounds.height/2.0)
        let startAngle = CGFloat(-π/2.0)
        let endAngle = CGFloat(π * 2.0) + startAngle
        let ringPath = UIBezierPath(arcCenter: centrePoint,
                                    radius: radius,
                                    startAngle: startAngle,
                                    endAngle: endAngle,
                                    clockwise: true)

        ringLayer.path = ringPath.cgPath
        ringLayer.frame = newView.layer.bounds

        return newView
    }

    func supplementaryView(shouldDisplayOnDayView dayView: DayView) -> Bool
    {
//        guard let currentCalendar = currentCalendar else {
//            return false
//
//        }
//
//
//
//        let components = Manager.componentsForDate(Foundation.Date(), calendar: currentCalendar)

        /* For consistency, always show supplementaryView on the 3rd, 13th and 23rd of the current month/year.  This is to check that these expected calendar days are "circled". There was a bug that was circling the wrong dates. A fix was put in for #408 #411.

         Other month and years show random days being circled as was done previously in the Demo code.
         */
       // var shouldDisplay = false
        sendData(arrList: dayView.weekView.dayViews!)
//        if dayView.date.year == components.year &&
//            dayView.date.month == components.month
//        {
//
//            if (dayView.date.day == 3 || dayView.date.day == 13 || dayView.date.day == 23)  {
//                print("Circle should appear on " + dayView.date.commonDescription)
//                shouldDisplay = true
//            }
//        } else if (Int(arc4random_uniform(3)) == 1)
//        {
//            shouldDisplay = true
//        }

        return false
    }

    func dayOfWeekTextColor() -> UIColor { return .white }

    func dayOfWeekBackGroundColor() -> UIColor { return .orange }

    func disableScrollingBeforeDate() -> Date { return Date() }

    func maxSelectableRange() -> Int { return 14 }

    func earliestSelectableDate() -> Date { return Date() }

    func latestSelectableDate() -> Date {
        var dayComponents = DateComponents()
        dayComponents.day = 70
        let calendar = Calendar(identifier: .gregorian)
        if let lastDate = calendar.date(byAdding: dayComponents, to: Date()) {
            return lastDate
        }

        return Date()
    }

    func sendData(arrList: [CVCalendarDayView])
    {
       // arrList.removeAll()
        for(index,_) in arrList.enumerated()
        {
            if index == 0
            {
                lblSun.text = "Sunday \(arrList[index].date.day)-\(arrList[index].date.month)-\(arrList[index].date.year)"
            }
            if index == 1
            {
                lblMon.text = "Monday \(arrList[index].date.day)-\(arrList[index].date.month)-\(arrList[index].date.year)"
            }
            if index == 2
            {
                lblTues.text = "Tuesday \(arrList[index].date.day)-\(arrList[index].date.month)-\(arrList[index].date.year)"
            }
            if index == 3
            {
                lblWed.text = "Wednesday \(arrList[index].date.day)-\(arrList[index].date.month)-\(arrList[index].date.year)"
            }
            if index == 4
            {
                lblThir.text = "Thirsday \(arrList[index].date.day)-\(arrList[index].date.month)-\(arrList[index].date.year)"
            }
            if index == 5
            {
                lblFri.text = "Friday \(arrList[index].date.day)-\(arrList[index].date.month)-\(arrList[index].date.year)"
            }
            if index == 6
            {
                lblSat.text = "Saterday \(arrList[index].date.day)-\(arrList[index].date.month)-\(arrList[index].date.year)"
            }
        }
    }

    func sendWeekDataPAss(arrList: [CVCalendarDayView])
    {
        for(index,_) in arrList.enumerated()
        {
            if index == 0
            {
                lblSun.text = "Sunday \(arrList[index].date.day)-\(arrList[index].date.month)-\(arrList[index].date.year)"
            }
            if index == 1
            {
                lblMon.text = "Monday \(arrList[index].date.day)-\(arrList[index].date.month)-\(arrList[index].date.year)"
            }
            if index == 2
            {
                lblTues.text = "Tuesday \(arrList[index].date.day)-\(arrList[index].date.month)-\(arrList[index].date.year)"
            }
            if index == 3
            {
                lblWed.text = "Wednesday \(arrList[index].date.day)-\(arrList[index].date.month)-\(arrList[index].date.year)"
            }
            if index == 4
            {
                lblThir.text = "Thirsday \(arrList[index].date.day)-\(arrList[index].date.month)-\(arrList[index].date.year)"
            }
            if index == 5
            {
                lblFri.text = "Friday \(arrList[index].date.day)-\(arrList[index].date.month)-\(arrList[index].date.year)"
            }
            if index == 6
            {
                lblSat.text = "Saterday \(arrList[index].date.day)-\(arrList[index].date.month)-\(arrList[index].date.year)"
            }
        }

    }
}
