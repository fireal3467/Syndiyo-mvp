//
//  RecordsToAddVC.swift
//  Syndiyo2
//
//  Created by Alan Yu on 7/19/16.
//  Copyright © 2016 Alan-Yu. All rights reserved.
//

import UIKit
import MessageUI

class RecordsToAddVC: UITableViewController, MFMailComposeViewControllerDelegate{

    
    //fake info for shit
    var medicalRecords:[MedicalRecord] = []
    var recordsToSend:[MedicalRecord] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        
        let nibCell = UINib(nibName: "RecordTabCustomCell", bundle: nil)
        self.tableView.registerNib(nibCell, forCellReuseIdentifier: "cell1")
        self.tableView.dataSource = self
        
        
        
        
        //disregard because there is currently no user data
        medicalRecords = UserController.sharedInstance.userMedicalRecords()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func actionButtonPressed(sender: UIBarButtonItem) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        
        
        
    }
    
    
    
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["alan3467@gmail.com"])
        mailComposerVC.setSubject("hello")
        mailComposerVC.setMessageBody("some random message with attachments", isHTML: false)
        
        
        
        for record in recordsToSend{
            let imageData: NSData = UIImagePNGRepresentation(record.image)!
        mailComposerVC.addAttachmentData(imageData, mimeType: "image/png" , fileName: record.name)
        }
        
        
        return mailComposerVC
    }
    
    
    func showSendMailErrorAlert() {
        // update code here later
        let sendMailErrorAlert = UIAlertView(title: "Error", message: "Could not send email, please check email configuration", delegate: self, cancelButtonTitle: "Ok")
        sendMailErrorAlert.show()
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicalRecords.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //check more about this code
        let cell = tableView.dequeueReusableCellWithIdentifier("cell1") as? RecordTabCustomCell
        
        // Configure the cell...
        cell?.titleLabel.text = medicalRecords[indexPath.row].name
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM d, YYYY"
        
        
        cell?.dateLabel.text = formatter.stringFromDate(medicalRecords[indexPath.row].date)
        
        
        return cell!
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        recordsToSend.append(medicalRecords[indexPath.row])
        medicalRecords.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
        
    }
    
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
