//
//  EditTaskVC.swift
//  Planner
//
//  Created by ADMS on 23/12/21.
//

import UIKit
import ActionSheetPicker_3_0
import DropDown
import AMColorPicker

class EditTaskVC: UIViewController , AMColorPickerDelegate,UITextViewDelegate{
    func colorPicker(_ colorPicker: AMColorPicker, didSelect color: UIColor) {
        DispatchQueue.main.async {
            self.selectdColorView.backgroundColor = color
            self.changeColor = color
        }
    }


    @IBOutlet weak var txtstartDate:UITextField!
    @IBOutlet weak var txtendDate:UITextField!
    @IBOutlet weak var lblselectedDate:UILabel!
    @IBOutlet weak var txtTitle:UITextField!
    @IBOutlet weak var txtDesc:UITextView!
    @IBOutlet weak var txtPlace:UITextField!

    @IBOutlet weak var btnStart:UIButton!
    @IBOutlet weak var btnEnd:UIButton!
    @IBOutlet weak var btnselectdDate:UIButton!
    @IBOutlet weak var btnDalete:UIButton!
    @IBOutlet weak var selectdColorView:UIView!

    @IBOutlet weak var txtDescConstantHeight:NSLayoutConstraint!
    @IBOutlet weak var scrollview:UIScrollView!


    var objtaskModel:addTaskModel?

    weak var delegatePassData:passAddEventDelegate?

    var startHours:String = ""
    var startMinite:String = ""
    var endHours:String = ""
    var endMinite:String = ""
    var addEventDate:String = ""


    var changeColor:UIColor = UIColor.black
    let amountDropDown = DropDown()

    lazy var dropDowns: [DropDown] = {
        return [
            self.amountDropDown
        ]
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        txtTitle.text = objtaskModel?.title
        txtDesc.text = objtaskModel?.desc
        txtstartDate.text = objtaskModel?.startTime
        txtendDate.text = objtaskModel?.endTime
        txtPlace.text = objtaskModel?.place

        dropDowns.forEach { $0.dismissMode = .onTap }
        dropDowns.forEach { $0.direction = .any }

        print("objtaskModel?.selectedTaskDate",objtaskModel?.selectedTaskDate)

//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = ""
        //let date = dateFormatter.date(from: objtaskModel?.selectedTaskDate ?? "")




        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "YYYY-MM-dd"

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MMMM dd YYYY"

        let showDate = inputFormatter.date(from: objtaskModel?.selectedTaskDate ?? "")
        let resultString = outputFormatter.string(from: showDate!)

        print(resultString)



//        let dateFormatter1 = DateFormatter()
//        dateFormatter1.dateFormat = "YYYY-MM-dd"
//        let date1 = dateFormatter1.string(from: objtaskModel?.selectedTaskDate ?? "")

        addEventDate = objtaskModel?.selectedTaskDate ?? ""


        self.lblselectedDate.text = resultString

        setupAmountDropDown()

        selectdColorView.backgroundColor = UIColor.black

        selectdColorView.layer.cornerRadius = selectdColorView.frame.size.height/2
        selectdColorView.layer.masksToBounds = true


//        txtDesc.translatesAutoresizingMaskIntoConstraints = true
        txtDescConstantHeight.constant = self.txtDesc.contentSize.height
        scrollview.frame.size.height = txtDescConstantHeight.constant + 300

        txtDesc.sizeToFit()
        txtDesc.isScrollEnabled = false

    }
    func setupAmountDropDown() {
        amountDropDown.anchorView = btnDalete

        // By default, the dropdown will have its origin on the top left corner of its anchor view
        // So it will come over the anchor view and hide it completely
        // If you want to have the dropdown underneath your anchor view, you can do this:
        amountDropDown.bottomOffset = CGPoint(x: 0, y: btnDalete.bounds.height)

        // You can also use localizationKeysDataSource instead. Check the docs.
        amountDropDown.dataSource = ["Delete"]

        // Action triggered on selection
        amountDropDown.selectionAction = { [weak self] (index, item) in
            //self?.btnDalete.setTitle(item, for: .normal)
            print("index\(index)")
            print("index\(item)")
            self?.amountDropDown.hide()
        }
    }
    @IBAction func btnClickStart(_ sender:UIButton){
        let datePicker = ActionSheetDatePicker(title: "Date", datePickerMode: .time, selectedDate: Date(), doneBlock: {
            picker, value, index in
            print(value)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm"
            let date = dateFormatter.string(from: value as! Date)

            self.txtstartDate.text = date

            return
        }, cancel: { ActionStringCancelBlock in return }, origin: btnStart)
        datePicker?.show()


    }
    @IBAction func btnClickEnd(_ sender:UIButton){
        let datePicker = ActionSheetDatePicker(title: "Date", datePickerMode: UIDatePicker.Mode.time, selectedDate: NSDate() as Date?, doneBlock: {
            picker, value, index in
            print(value)
            print(index)

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm"
            let date = dateFormatter.string(from: value as! Date)

            self.txtendDate.text = date
            return
        }, cancel: { ActionStringCancelBlock in return }, origin: btnEnd)
        datePicker?.show()


    }
    @IBAction func btnClickCalendar(_ sender:UIButton){
        let datePicker = ActionSheetDatePicker(title: "Date", datePickerMode: UIDatePicker.Mode.date, selectedDate: NSDate() as Date?, doneBlock: {
            picker, value, index in
            print(value)
            print(index)

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM,dd,YYYY"
            let date = dateFormatter.string(from: value as! Date)


            let dateFormatter1 = DateFormatter()
            dateFormatter1.dateFormat = "YYYY-MM-dd"
            self.addEventDate = dateFormatter1.string(from: value as! Date)
            self.lblselectedDate.text = date
            return
        }, cancel: { ActionStringCancelBlock in return }, origin: btnselectdDate)
        datePicker?.show()

    }
    @IBAction func btnClickDalete(_ sender:UIButton){
        amountDropDown.show()
    }
    @IBAction func btnClickBack(_ sender:UIButton){
        self.navigationController?.popViewController(animated: false)
    }

    @IBAction func btnClickSubmit(){
        //        if txtstartDate.text ?? "" != ""
        //        {

//                let formatter = DateFormatter()
//                formatter.dateFormat = "yyyy-MM-dd"
//
//                let date1 = formatter.date(from: self.addEventDate)
//
//                // let date12 = formatter.date(from: date1)
//
//                formatter.dateFormat = "yyyy"
//                let year = formatter.string(from: date1!)
//                formatter.dateFormat = "MM"
//                let month = formatter.string(from: date1!)
//                formatter.dateFormat = "dd"
//                let day = formatter.string(from: date1!)
//                print(year, month, day) // 2018 12 24
//
//
//                let addtask = addTaskModel(selectedTaskDate: self.addEventDate , startTime: txtstartDate.text ?? "", endTime: txtendDate.text ?? "", title: txtTitle.text ?? "", desc: txtDesc.text ?? "", place: txtPlace.text ?? "",color: self.changeColor, monthYear: "\(year)-\(month)")
//                    arrList.append(addtask)
//                let objEvent = EventDCModel(eventDate: self.addEventDate, eventColor: self.changeColor)
//
//
//
//                delegatePassData?.addTaskToList(obj: arrList, color: [objEvent])
//                self.navigationController?.popViewController(animated: false)

    }

    @IBAction func btnClickColorPicker(_ sender:UIButton){
        let colorPickerViewController = AMColorPickerViewController()
        colorPickerViewController.selectedColor = .red
        colorPickerViewController.delegate = self
        present(colorPickerViewController, animated: true, completion: nil)
    }

}
extension EditTaskVC{
    func textViewDidEndEditing(_ textView: UITextView) {
    }
    func textViewDidChange(_ textView: UITextView) {
        txtDescConstantHeight.constant = self.txtDesc.contentSize.height
        scrollview.frame.size.height = txtDescConstantHeight.constant + 300

    }
}
