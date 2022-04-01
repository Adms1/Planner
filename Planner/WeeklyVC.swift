//
//  WeeklyVC.swift
//  Planner
//
//  Created by ADMS on 24/12/21.
//

import UIKit

class WeeklyVC: UIViewController
{
    @IBOutlet weak var collDailyPlan:UICollectionView!
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!

    let arrList = ["Top Tasks","Weekly Goals","Weekly Review","Weekly Habit"]

    override func viewDidLoad() {
        super.viewDidLoad()

        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height


        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3-20, height: 100)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
        collDailyPlan!.collectionViewLayout = layout

        collDailyPlan.showsVerticalScrollIndicator = false
        collDailyPlan.showsHorizontalScrollIndicator = false

        collDailyPlan.register(UINib(nibName: "PriorityCell", bundle: nil), forCellWithReuseIdentifier: "PriorityCell")

    }

//    override func viewDidLayoutSubviews() {
//           super.viewDidLayoutSubviews()
//
//           if let flowLayout = self.collDailyPlan.collectionViewLayout as? UICollectionViewFlowLayout {
//               flowLayout.itemSize = CGSize(width: self.collDailyPlan.bounds.width/3, height: 100)
//           }
//       }
}
extension WeeklyVC:UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PriorityCell", for: indexPath) as! PriorityCell
//            cell.img.image = UIImage(named: "\(arrData[indexPath.row].nameOfImage)")
//            cell.img.contentMode = .scaleAspectFit
        cell.priorityText.text = arrList[indexPath.row]

//            cell.priorityVw.layer.borderColor = UIColor.lightGray.cgColor
//            cell.priorityVw.layer.borderWidth = 0.5


            cell.priorityVw.layer.cornerRadius = 8
            cell.priorityVw.layer.shadowOffset = CGSize(width: 0, height: 3)
            cell.priorityVw.layer.shadowRadius = 3
            cell.priorityVw.layer.shadowOpacity = 0.3
            cell.priorityVw.layer.shadowColor = UIColor.black.cgColor


            return cell
    }
    
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize
//    {
//            self.contentView.frame = self.bounds
//            self.contentView.layoutIfNeeded()
//            self.collDailyPlan.contentSize = CGSize(width: Int(self.collDailyPlan.frame.width)/3-10, height: 100)
//            return self.collDailyPlan.contentSize
//
//        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {

        let collectionViewWidth = collectionView.frame.size.width

        print("collectionViewWidth/3-10",collectionViewWidth/3-10)
            return CGSize(width: collectionViewWidth/3-20, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if indexPath.row == 0
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
       //     let obj = storyboard.instantiateViewController(withIdentifier: "DailyPlanVC") as! DailyPlanVC
            let obj = storyboard.instantiateViewController(withIdentifier: "WeeklyTaskVC") as! WeeklyTaskVC
            self.navigationController?.pushViewController(obj, animated: false)


        }else if indexPath.row == 1
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
       //     let obj = storyboard.instantiateViewController(withIdentifier: "DailyPlanVC") as! DailyPlanVC
            let obj = storyboard.instantiateViewController(withIdentifier: "WeeklyGoalsVC") as! WeeklyGoalsVC
            self.navigationController?.pushViewController(obj, animated: false)
        }
        else if indexPath.row == 2
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
       //     let obj = storyboard.instantiateViewController(withIdentifier: "DailyPlanVC") as! DailyPlanVC
            let obj = storyboard.instantiateViewController(withIdentifier: "WeeklyReviewVC") as! WeeklyReviewVC
            self.navigationController?.pushViewController(obj, animated: false)
        }

        else if indexPath.row == 3
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let obj = storyboard.instantiateViewController(withIdentifier: "WeeklyHabitVC") as! WeeklyHabitVC
            self.navigationController?.pushViewController(obj, animated: false)
        }
    }

    @IBAction func btnClickBack(_ sender:UIButton){
        self.navigationController?.popViewController(animated: false)
    }

}
