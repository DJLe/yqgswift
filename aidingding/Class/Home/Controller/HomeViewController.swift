//
//  TableViewController.swift
//  aidingding
//
//  Created by mydaogj on 16/4/19.
//  Copyright © 2016年 ding. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    @IBOutlet weak var honeItem: UINavigationItem!
    
//    private var categoryTableView : UICollectionView!
//    
//    private var flowLayout : UICollectionViewFlowLayout!
    
    let cellHeight = ScreenHeight - 64 - 49 as CGFloat
    
    var cellModelList = [HomeCellModel](){
        didSet{
            tableView.reloadData()
        }
    }
    
    var cellCount = 0;
    
    var jsonData = ["人生若只如初见，何事秋风悲画扇。","曾经沧海难为水，除却巫山不是云。","山重水复疑无路，柳暗花明又一村。","千岩万壑不辞劳，远看方知出处高。","白日何短短，百年苦易满。苍穹浩茫茫，万劫太极长。","行到水穷处，坐看云起时。","采菊东篱下，悠然见南山。","枯藤老树昏鸦，小桥流水人家，古道西风瘦马。","大漠孤烟直，长河落日圆。","劝君更尽一杯酒，西出阳关无故人。"]
    
    var topData = ["人生","曾经","山重","千岩","白日","行到","采菊","枯藤","大漠","劝君"]
    
    func getData(){
        

    }
    
    private func topCategoryTableView(){
    
//        flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .Horizontal
//        categoryTableView = UICollectionView(frame: CGRectMake(0, 0, ScreenWidth, 44), collectionViewLayout: flowLayout)
//        categoryTableView.backgroundColor = UIColor.redColor()
////        categoryTableView.delegate = self
////        categoryTableView.dataSource = self
//        categoryTableView.showsHorizontalScrollIndicator = false
//        categoryTableView.showsVerticalScrollIndicator = false
        
        honeItem.titleView = TopView(frame: CGRectMake(0, 0, ScreenWidth, 44))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = cellHeight
        
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.1))
        
        topCategoryTableView()

        
//        tableView?.registerClass(HomeCell.self, forCellReuseIdentifier: CellReuseIdentifier.Home)
        
//        tableView!.registerNib(UINib(nibName:"HomeCell", bundle:nil), forCellReuseIdentifier: CellReuseIdentifier.Home)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 10
//    }

// 
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
////        let identifier :String = String(indexPath.row) + CellReuseIdentifier.Home
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier.Home, forIndexPath: indexPath) as! HomeCell
//        
//        cell.labetext.text = jsonData[indexPath.row]
//
//
//        return cell
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - TableView Data Source
extension HomeViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    

        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier.Home, forIndexPath: indexPath) as! HomeCell

        cell.delegate = self
        
        cell.labetext.text = jsonData[indexPath.row]
        
        return cell
    }
    
//    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 44
//    }
}

//extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
//
//
//
//}

extension HomeViewController : HomeCellDelegate {
    
    func tableHomeCell(homeCell: HomeCell, withButtonIndex buttonIndex: Int) {
        
        let inadexPath : NSIndexPath = self.tableView.indexPathForCell(homeCell)!
        
        switch buttonIndex {
        
            case 0 :
                print(inadexPath.row)
//                print("0")
            case 1 :
                print(inadexPath.row)
//                print("1")
            case 2 :
                print(inadexPath.row)
//                print("2")
            default :
                return
        
        }
    }
    


}





