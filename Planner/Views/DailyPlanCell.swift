//
//  DailyPlanCell.swift
//  Planner
//
//  Created by ADMS on 14/12/21.
//

import UIKit

protocol popupDelegate:class {
    func showPopUpView()
}

class DailyPlanCell: UITableViewCell
{

    @IBOutlet weak var collDailyPlan:UICollectionView!
//    @IBOutlet weak var collectionViewHeightConstraint:NSLayoutConstraint!

    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!

//    var arrData = [arrSubPlanList]()
    var strdailyTask:String!
    var selectedSection:Int = -1
    weak var delegatePopUp: popupDelegate?

    var arrData = [arrSubDataList]()


    override func awakeFromNib() {
        super.awakeFromNib()
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height

        // Do any additional setup after loading the view, typically from a nib
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
//        layout.itemSize = CGSize(width: 100 , height: 100)
//        collDailyPlan = UICollectionView(frame: self.collDailyPlan.frame, collectionViewLayout: layout)
//        collDailyPlan!.dataSource = self
//        collDailyPlan!.delegate = self
//        collDailyPlan!.register(DailyOtherCell.self, forCellWithReuseIdentifier: "DailyOtherCell")
        collDailyPlan.register(UINib(nibName: "DailyOtherCell", bundle: nil), forCellWithReuseIdentifier: "DailyOtherCell")
        collDailyPlan.register(UINib(nibName: "PriorityCell", bundle: nil), forCellWithReuseIdentifier: "PriorityCell")
        collDailyPlan.register(UINib(nibName: "ScheduleCell", bundle: nil), forCellWithReuseIdentifier: "ScheduleCell")
//        self.layoutIfNeeded()
//        self.invalidateIntrinsicContentSize()


//        collDailyPlan.hori

//        collDailyPlan.delegate  = self
//        collDailyPlan.dataSource  = self

    }

//    override func layoutSubviews() {
//                    self.contentView.frame = self.bounds
//                    self.contentView.layoutIfNeeded()
//                    // Returns `collectionView.contentSize` in order to set the UITableVieweCell height a value greater than 0.
////                    return self.collDailyPlan.contentSize
//
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

//    override func layoutSubviews() {
//           super.layoutSubviews()
//        collectionViewHeightConstraint.constant = collDailyPlan.contentSize.height
//       }

    func cellData(arrData:[arrSubDataList],dailyTask:String,section:Int)
    {
       // self.arrData.removeAll()
        selectedSection = section
        self.arrData = arrData
        strdailyTask = dailyTask

//        collDailyPlan.delegate  = self
//        collDailyPlan.dataSource  = self

        DispatchQueue.main.async {
//            self.layoutIfNeeded()
//            self.invalidateIntrinsicContentSize()

            self.collDailyPlan.reloadData()
        }
    }
    
}
extension DailyPlanCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrData[selectedSection].arrData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if strdailyTask == "Priority Task"
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PriorityCell", for: indexPath) as! PriorityCell
//            cell.img.image = UIImage(named: "\(arrData[indexPath.row].nameOfImage)")
//            cell.img.contentMode = .scaleAspectFit
            cell.priorityText.text = arrData[selectedSection].arrData[indexPath.row].taskName

//            cell.priorityVw.layer.borderColor = UIColor.lightGray.cgColor
//            cell.priorityVw.layer.borderWidth = 0.5


            cell.priorityVw.layer.cornerRadius = 8
            cell.priorityVw.layer.shadowOffset = CGSize(width: 0, height: 3)
            cell.priorityVw.layer.shadowRadius = 3
            cell.priorityVw.layer.shadowOpacity = 0.3
            cell.priorityVw.layer.shadowColor = UIColor.black.cgColor


            return cell

        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyOtherCell", for: indexPath) as! DailyOtherCell
            cell.img.image = UIImage(named: "\(arrData[selectedSection].arrData[indexPath.row].nameOfImage)")
            cell.img.contentMode = .scaleAspectFit
            cell.planName.text = arrData[selectedSection].arrData[indexPath.row].taskName

            return cell

        }



    }
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        if strdailyTask == "Priority Task"
        {
            self.contentView.frame = self.bounds
            self.contentView.layoutIfNeeded()
            self.collDailyPlan.contentSize = CGSize(width: Int(self.collDailyPlan.frame.width)/3-10, height: 100)
            return self.collDailyPlan.contentSize
        }else{
            self.contentView.frame = self.bounds
            self.contentView.layoutIfNeeded()
            return self.collDailyPlan.contentSize
        }

        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {

//        if strdailyTask == "Priority Task"
//        {
//            let collectionViewWidth = collectionView.bounds.width
//            let label = UILabel(frame:.zero)
//            label.numberOfLines = 0
//            label.text = arrData[indexPath.row].taskName
////            label.sizeToFit()
//
////            let cell = collectionView.cellForItem(at: indexPath) as! PriorityCell
//            let size = CGSize(width: collectionViewWidth/3, height: label.intrinsicContentSize.height)
//            return size

//        }else
//        {
//            let collectionViewWidth = collectionView.bounds.width
//            return CGSize(width: collectionViewWidth/3-10, height: 100)

      //  }


//        if "Schedule" == strdailyTask
//        {
//            let collectionViewWidth = collectionView.bounds.width
//            return CGSize(width: collectionViewWidth, height: 50)
//
//        }else{
        let collectionViewWidth = collectionView.frame.size.width
            return CGSize(width: collectionViewWidth/3-10, height: 100)
       // }

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("section\(selectedSection) row\(indexPath.row)")

        if selectedSection == 1
        {
            if indexPath.row == 0
            {
              //  delegatePopUp?.showPopUpView()
            }else if indexPath.row == 1{

            }else if indexPath.row == 2{

            }else if indexPath.row == 3{
                delegatePopUp?.showPopUpView()
            }else if indexPath.row == 4{

            }else if indexPath.row == 5{

            }
        }
    }


}
