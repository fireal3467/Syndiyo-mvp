//
//  MedicalInformationViewController.swift
//  Syndiyo2
//
//  Created by Ilham Nurjadin on 7/20/16.
//  Copyright © 2016 Alan-Yu. All rights reserved.
//

import UIKit

class MedicalInformationViewController: UIViewController,UIGestureRecognizerDelegate {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var dateOfBirthTextField: UIDateField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var allergiesTextField: UITextField!
    @IBOutlet weak var previousMedicalConditionsTextfield: UITextField!
    @IBOutlet weak var medicationsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configuration of SkipButton
        skipButton.layer.cornerRadius = 15
        
        // Configuration of nextButton
        nextButton.layer.cornerRadius = 15
        
        // Tap to dismiss keyboard
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
//        self.view.addGestureRecognizer(tap)
//        containerView.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    //fix later!!!
//    @IBAction func nextButtonPressed(sender: AnyObject) {
//        UserController.sharedInstance.currentUser?.medicalInfo = MedicalInformation(dob: dateOfBirthTextField.date, height: String(heightTextField.text!) ?? "", weight: String(weightTextField.text!) ?? "", allergies: allergiesTextField.text!, previousMedicalConditions: previousMedicalConditionsTextfield.text!, medications: medicationsTextField.text!)
//    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func nextButtonPressed(sender: AnyObject) {
        UserController.sharedInstance.currentUser?.medicalInfo = MedicalInformation(dob: dateOfBirthTextField.date, height: String(heightTextField.text!) ?? "", weight: String(weightTextField.text!) ?? "", allergies: allergiesTextField.text!, previousMedicalConditions: previousMedicalConditionsTextfield.text!, medications: medicationsTextField.text!)
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        let application = UIApplication.sharedApplication()
        let window = application.keyWindow
        window?.rootViewController = viewController
        
        
    }
    
    @IBAction func skipButtonPressed(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        let application = UIApplication.sharedApplication()
        let window = application.keyWindow
        window?.rootViewController = viewController
    }
    
    func viewWillDisappear(animated: Bool) {
        <#code#>
    }
    
    

}
