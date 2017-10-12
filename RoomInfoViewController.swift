//
//  RoomInfoViewController.swift
//  MettingRooms
//
//  Created by 김현석 on 2017. 8. 23..
//  Copyright © 2017년 Kimhyeonseok. All rights reserved.
//

import UIKit
let roomInfoFileName = "ReserveInfomationPlist"

class RoomInfoViewController: UITableViewController {
    
    var infomations:Array<AnyObject> = []
    var infomationTableCell = reserveCell()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        guard let infomationURL = Bundle.main.url(forResource: roomInfoFileName, withExtension: "plist") else {
            print("has no file")
            return
        }

        if let infomationArray = NSArray(contentsOf: infomationURL) {
            print(infomationArray)

            infomations = infomations + (infomationArray as Array<AnyObject>)
            print(infomations.count)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func modalDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "locationCell")
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "capacityCell")
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "basicFacilitiesCell")
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "applicableCell")
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "basicEquipmentsCell")
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "characteristicCell")
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "precautionsCell")
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "noticeCell")
        
        let locationCell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
//        let capacityCell = tableView.dequeueReusableCell(withIdentifier: "capacityCell", for: indexPath)
//        let basicFacilitiesCell = tableView.dequeueReusableCell(withIdentifier: "basicFacilitiesCell", for: indexPath)
//        let applicableCell = tableView.dequeueReusableCell(withIdentifier: "applicableCell", for: indexPath)
//        let basicEquipmentsCell = tableView.dequeueReusableCell(withIdentifier: "basicEquipmentsCell", for: indexPath)
//        let characteristicCell = tableView.dequeueReusableCell(withIdentifier: "characteristicCell", for: indexPath)
//        let precautionsCell = tableView.dequeueReusableCell(withIdentifier: "precautionsCell", for: indexPath)
//        let noticeCell = tableView.dequeueReusableCell(withIdentifier: "noticeCell", for: indexPath)
        
        guard let infomation = infomations[indexPath.row] as? [String:AnyObject] else {
//            return cell
            return infomationTableCell
        }

        let locationRoom = infomation["Location"] as? String ?? ""
        locationCell.textLabel?.text = locationRoom
        
//        capacityCell.textLabel?.text = infomation["Capacity"] as? String
//        basicFacilitiesCell.textLabel?.text = infomation["BasicFacilities"] as? String
//        applicableCell.textLabel?.text = infomation["ApplicableEquipments"] as? String
//        characteristicCell.textLabel?.text = infomation["Characteristic"] as? String
//        basicEquipmentsCell.textLabel?.text = infomation["Equipment"] as? String
//        precautionsCell.textLabel?.text = infomation["precautions"] as? String
//        noticeCell.textLabel?.text = infomation["Notice"] as? String
        
        
//        return cell
        return infomationTableCell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
