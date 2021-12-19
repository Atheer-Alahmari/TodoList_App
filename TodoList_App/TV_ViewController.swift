//
//  ViewController.swift
//  TodoList_App
//
//  Created by Atheer Alahmari on 14/05/1443 AH.
//

import UIKit
import CoreData

class TV_ViewController: UITableViewController , Button_Delegate{
 
    
    
    var items : [New_Item] = [] // CoreData
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext // CoreData

    //--------------------------------------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems() // CoreData
        tableView.rowHeight = 100
    }
   
    // ---------------CoreData
    func fetchAllItems(){
        let request = NSFetchRequest<New_Item>.init(entityName: "New_Item")
        do {
            let results = try managedObjectContext.fetch(request)
            items = results

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch {
            print(error.localizedDescription) // print("\(error)")
        }
        
    }
    
    // MARK: -  ----------------------  addItem_Pressed ------------
    
    func addItem_Pressed( titel: String, note: String, dueDate: String) {
        //------- CoreData
       
                let item = NSEntityDescription.insertNewObject(forEntityName: "New_Item", into: managedObjectContext) as! New_Item

                    item.titel = titel
                    item.note = note
                    item.dueDate = dueDate
                    item.checkMark = false
                    items.append(item)
                
                    // This code is identical to the saveContext method in our AppDelegate
                    // Try and reference that method to make your code cleaner!
                    if managedObjectContext.hasChanges {
                    do {
                        try managedObjectContext.save()
                        DispatchQueue.main.async {
                            self.tableView.reloadData()

                            print("Success")

                     }
                        print("Success2")
                    } catch {
                        print(error.localizedDescription)
                    }
                
               }
            
        }
    
    // MARK: ---------------------------prepare-------------------------------------

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navegtion  = segue.destination as!  AddItem
            navegtion.delegate = self
            
    }
    
    // MARK: - ---------------------TableView-------------------------------------
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ID_Cell", for: indexPath) as! AddItem_Cell
       
        let listItem = items[indexPath.row]
       
        cell.titel_cell.text = listItem.titel
        cell.date_cell.text = listItem.dueDate
        cell.not_cell.text = listItem.note
        let ischeckmark = listItem.checkMark

        if ischeckmark == true{
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        var ischeckmark = items[indexPath.row].checkMark
        ischeckmark = true
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark


    }


}

