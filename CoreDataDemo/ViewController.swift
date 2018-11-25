//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Felix ITs 04 on 17/11/18.
//  Copyright © 2018 AkashG. All rights reserved.
//

import UIKit
//import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var addressTxt: UITextField!
    
    @IBOutlet weak var dobOutlet: UIButton!
    @IBOutlet weak var pickerBackgroundView: UIView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func dobActn(_ sender: Any) {
        nameTxt.resignFirstResponder()
        addressTxt.resignFirstResponder()
        pickerBackgroundView.isHidden = false
        
    }
    
    @IBAction func saveActn(_ sender: Any) {
        
        if (nameTxt.text?.isEmpty)! {
            
        } else if (addressTxt.text?.isEmpty)! {
        
        } else if dobOutlet.currentTitle == "DOB" {
            
        } else {
            //core data execution
            //create NSManagedObjectContext
            
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let context = appDelegate?.persistentContainer.viewContext
            //create an object for entity
            
            //let personEntity = NSEntityDescription.entity(forEntityName: "Person", in: context!)
            
            let person = Person(context: context!)
            person.name = nameTxt.text
            person.address = addressTxt.text
            let strDate = dobOutlet.currentTitle
            let df = DateFormatter()
            df.dateFormat = "yyyy-dd-MM"
            let convertedDate = df.date(from:strDate!)
            person.dob = convertedDate! as NSDate
            
            //now creating context object
            
            do {
                try context?.save()
            } catch let error {
                print(error)
            }
            nameTxt.text = ""
            addressTxt.text = ""
        }
            
    }
    
    @IBAction func DatePicker(_ sender: UIDatePicker) {
        //selected date by datepicker
        let date = sender.date
        //for converting date into string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-dd-MM"
        let strDate = dateFormatter.string(from: date)
        dobOutlet.setTitle(strDate, for: .normal)
    }
    
    @IBAction func doneActn(_ sender: UIButton) {
        pickerBackgroundView.isHidden = true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

