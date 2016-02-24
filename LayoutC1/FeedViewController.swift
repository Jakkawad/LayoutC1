//
//  FeedViewController.swift
//  LayoutC1
//
//  Created by admin on 2/24/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import Alamofire
import MapleBacon
class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mTableView: UITableView!
    
    var mDataArray = NSArray()
    
    func feedData() {
        let params = ["api":"productall","productall":"37"]
        //let params = ["type":"json"]
        //Alamofire.request(.POST, "http://codemobiles.com/adhoc/feed/youtube_feed.php", parameters: params, encoding: .URL, headers: nil).responseJSON { (request, response, result) -> Void in
        Alamofire.request(.POST, "https://www.all2sale.com/sendmail/testfunction/json/apitest.php", parameters: params, encoding: .URL, headers: nil).responseJSON { (request, response, result) -> Void in
            print(result.value)
            self.mDataArray = result.value as! NSArray
            //print(self.mDataArray.description)
            self.mTableView.reloadData()
            
        }   //print(result.value!)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mDataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as? CustomTableViewCell
        let item = self.mDataArray[indexPath.row] as! NSDictionary
        
        cell?.mTitleLabel.text = item.objectForKey("ProductBrand") as? String
        let thumbnalUrlString = item.objectForKey("ProductShowImage") as? String
        
        var A2SUrl = "https://www.all2sale.com/store/"
        A2SUrl += thumbnalUrlString!
        
        let ImageUrl = NSURL(string: A2SUrl)!
        
        cell?.mThumbnailImage.setImageWithURL(ImageUrl)
        
        return cell!
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
