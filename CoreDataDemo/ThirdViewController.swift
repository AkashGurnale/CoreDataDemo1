//
//  ThirdViewController.swift
//  CoreDataDemo
//
//  Created by Felix ITs 04 on 18/11/18.
//  Copyright © 2018 AkashG. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var person:Person? = nil
    
    @IBOutlet weak var nameUpdateTxt: UITextField!
    
    @IBOutlet weak var addressUpdateTxt: UITextField!
    
    @IBOutlet weak var dobUpdateTxt: UIButton!

    @IBOutlet weak var pickerViewBackground2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStuff()

        // Do any additional setup after loading the view.
    }
    @IBAction func dobUpdateBtnActn(_ sender: UIButton) {
        nameUpdateTxt.resignFirstResponder()
        addressUpdateTxt.resignFirstResponder()
        pickerViewBackground2.isHidden = false
        
    }
    
    @IBAction func doneBtnAction(_ sender: UIButton) {
        pickerViewBackground2.isHidden = true
    }
    @IBAction func updateBtnAction(_ sender: UIButton) {
        
        if (nameUpdateTxt.text?.isEmpty)! {
            
        } else if (addressUpdateTxt.text?.isEmpty)! {
            
        } else if dobUpdateTxt.currentTitle == "DOB" {
            
        } else {
            //core data execution
            //create NSManagedObjectContext
            
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let context = appDelegate?.persistentContainer.viewContext
            //create an object for entity
            
            //let personEntity = NSEntityDescription.entity(forEntityName: "Person", in: context!)
            
            person?.name = nameUpdateTxt.text
            person?.address = addressUpdateTxt.text
            let strDate = dobUpdateTxt.currentTitle
            let df = DateFormatter()
            df.dateFormat = "yyyy-dd-MM"
            let convertedDate = df.date(from:strDate!)
            person?.dob = convertedDate! as NSDate
            
            do {
                try context?.save()
            } catch let error {
                print(error)
            }
            nameUpdateTxt.text = ""
            addressUpdateTxt.text = ""
        }
    }
    
    func displayStuff () {
        
        nameUpdateTxt.text = person?.name
        addressUpdateTxt.text = person?.address
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-dd-MM"
        let strDate = dateFormatter.string(from: person!.dob as! Date)
        print(strDate)
        dobUpdateTxt.setTitle(strDate, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
