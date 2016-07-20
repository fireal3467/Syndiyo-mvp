//
//  UserController.swift
//  Syndiyo
//
//  Created by Ilham Nurjadin on 7/18/16.
//  Copyright © 2016 Alan-Yu. All rights reserved.
//

import Foundation
import UIKit

class UserController {
    
    let manager = NSFileManager.defaultManager()
    
    static let sharedInstance = UserController()
    var currentUser: User?
    var users: [User] = {
        let manager = NSFileManager.defaultManager()
        let documents = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let fileURL = documents.URLByAppendingPathComponent("users.txt")
        
        if let storedUsers = NSKeyedUnarchiver.unarchiveObjectWithFile("users.txt") as? [User] {
            return storedUsers
        }
        else { return [] }
    }()
    
    var fakeMedicalRecords:[MedicalRecord] = [MedicalRecord(name: "MR1", description: "", date: NSDate(), image: UIImage(named: "CameraIcon")!),MedicalRecord(name: "Apple", description: "", date: NSDate(), image: UIImage(named:"apple")!),MedicalRecord(name: "Bird", description: "", date: NSDate(), image: UIImage(named: "angryBird")!)
    ]
    
    func registerUser(onCompletion: (String?) -> Void) {
        if currentUser != nil {
            users.append(currentUser!)
            onCompletion(nil)
        }
        // if CurrentUser is nil
        else { onCompletion("Could not register user") }
    }
    
    // function - check if username has been used
    
    func checkUsernameAvailability(email: String) -> Bool {
        for person in users {
            if person.email == email { return false }
        }
        return true
    }
    
    func loginUser(email: String, password: String, onCompletion: (User?, String?) -> Void) {
        for person in users {
            if person.email == email && person.password == password {
                onCompletion(person, nil)
            }
            else {
                onCompletion(nil, "Email or password is incorrect")
            }
        }
    }
   
    func addMedicalRecord(record:MedicalRecord){
        //currentUser?.medicalRecords?.append(record)
        fakeMedicalRecords.append(record)
    }
    
    
    func userMedicalRecords() -> [MedicalRecord]{
        
        return fakeMedicalRecords
    }
    
    func updateUserInfo() {
        
    }
    
    func updateMedicalInformation(medicalInfo: MedicalInformation) {
        
    }
    
    func addDoctors(doctors: [Doctor]) {
        currentUser?.doctorsArray!.appendContentsOf(doctors)
    }
    
    func deleteDoctor() {
        
    }
    
}
