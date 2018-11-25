//
//  SecondViewController.swift
//  CoreDataDemo
//
//  Created by Felix ITs 04 on 17/11/18.
//  Copyright © 2018 AkashG. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    var listArray:Array<Person>? = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchResult()
    }
    func fetchResult() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let context = appDelegate?.persistentContainer.viewContext
        //create object of fetch request
        
        let fetchReq = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Person")
        
        //getting list data now
        
        do {
            
        listArray = try context?.fetch(fetchReq) as? Array<Person>
            
            print(listArray?.count ?? [])
            if let list = listArray {
                if list.count > 0 {
                    tblView.dataSource = self
                    tblView.delegate = self
                    tblView.reloadData()
                }
            }
            
        } catch let error {
            print(error)
        }
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

extension SecondViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _ = listArray {
            
        return (listArray?.count)!
        }
        else
        {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CutomCell
        
            let list = listArray?[indexPath.row]
            cell.nameLabel.text = list?.name
            cell.addressLabel.text = list?.address
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-dd-MM"
            let strDate = dateFormatter.string(from: list!.dob as! Date)
            cell.dobLabel.text = strDate
            
            return cell
           }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //listArray?.remove(at: indexPath.row)
        
        let appdelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appdelegate?.persistentContainer.viewContext
        
        let person = listArray![indexPath.row]
        
        context?.delete(person)
        do {
            try context?.save()
            listArray?.remove(at: indexPath.row)
            tblView.reloadData()
        } catch let error {
            print(error)
        }
    }
}


extension SecondViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let tvc = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        
        tvc.person = listArray?[indexPath.row]
        
        self.navigationController?.pushViewController(tvc, animated: true)
        
    }
}
