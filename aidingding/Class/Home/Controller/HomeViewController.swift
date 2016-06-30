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
    
    let cellHeight = ScreenHeight - 64 - 49 as CGFloat
    
    var cellTopModelList = [HomeCategoryCellModel](){
        didSet{
            
            NSNotificationCenter.defaultCenter().postNotificationName("TopLoadDataNotification",
                                                                      object: self, userInfo: ["cellTopModelList":cellTopModelList])
            do{
                try getListData(NSInteger(cellTopModelList[0].id))
            }catch{
                print("getListData:error")
            }
        }
    }
    
    var cellModelList = [HomeListCellModel](){
        didSet{
            tableView.reloadData()
        }
    }
    
    var cellCount = 0;
    
    func getData(){
        
        getDataFromUrl(API.HomeCategory, method: .GET, parameter: nil) { data in

            if let jsonData = data, jsonModel = jsonData => HomeCategoryJSONModel.self {
                
                self.cellTopModelList = jsonModel.tngou.flatMap {
                    $0 => HomeCategoryCellModel.self
                }
            }
        }

    }
    
    func getListData(categoryid:NSInteger){
        
        let listAPI = API.HomeList + String(cellTopModelList[categoryid].id)
        
        getDataFromUrl(listAPI, method: .GET, parameter: nil) { data in
            
            if let jsonData = data, jsonModel = jsonData => HomeCategoryJSONModel.self {
                
                self.cellModelList = jsonModel.tngou.flatMap {
                    $0 => HomeListCellModel.self
                }
            }
        }
        
    }
    
    private func topCategoryTableView(){
        let topView = TopView(frame: CGRectMake(0, 10, ScreenWidth, 44))
        topView.delegate = self;
        honeItem.titleView = topView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
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
        return cellModelList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    

        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier.Home, forIndexPath: indexPath) as! HomeCell

        cell.delegate = self
        
//        cell.labetext.text = jsonData[indexPath.row]
        
        cell.bindModel((cellModelList[indexPath.row],indexPath.row))
        
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

extension HomeViewController : HomeCellDelegate, TopViewDelegate {

//MARK: - HomeCellDelegate
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
    
//MARK: - TopViewDelegate
    func topView(topView: TopView, withItemIndex itemIndex: Int) {
        getListData(itemIndex)
    }
}





