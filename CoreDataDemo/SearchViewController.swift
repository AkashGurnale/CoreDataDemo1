//
//  SearchViewController.swift
//  CoreDataDemo
//
//  Created by Felix ITs 04 on 25/11/18.
//  Copyright © 2018 AkashG. All rights reserved.
//

import UIKit
import CoreData

class SearchViewController: UIViewController {

    var arrSearch:Array<Person>? = []
    
    @IBOutlet weak var tacleViewSearch: UITableView!
    
    @IBOutlet weak var SearchBarOutlet: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchBarOutlet.delegate = self

        // Do any additional setup after loading the view.
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

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _ = arrSearch {
                return (arrSearch?.count)!
            }
         return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchCell = tableView.dequeueReusableCell(withIdentifier: "search cell") as! SearchTableViewCell
        
        let list = arrSearch?[indexPath.row]
        searchCell.nameLabelOutlet.text = list?.name
        searchCell.addressLabelOutlet.text = list?.address
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-dd-MM"
        let strDate = dateFormatter.string(from: list!.dob as! Date)
        searchCell.dobLabelOutlet.text = strDate
        
        return searchCell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let appdelegate = UIApplication.shared
        .delegate as? AppDelegate
        
        if let _ = appdelegate {
            let context = appdelegate?.persistentContainer.viewContext
            let fetchReq = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Person")
            
            //using predicate to filter data we need to fetch
            
            //fetchReq.predicate = NSPredicate(format: "name == %@", SearchBarOutlet.text!)
            fetchReq.predicate = NSPredicate(format: "name contains[c] %@", SearchBarOutlet.text!)
            do {
                arrSearch = try context?.fetch(fetchReq) as! Array<Person>?
                print(arrSearch?.count)
                tacleViewSearch.dataSource = self
                tacleViewSearch.reloadData()
            }catch {
                
            }
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
}
