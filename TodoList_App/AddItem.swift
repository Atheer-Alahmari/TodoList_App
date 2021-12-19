//
//  AddItemViewController.swift
//  TodoList_App
//
//  Created by Atheer Alahmari on 14/05/1443 AH.
//

import UIKit

class AddItem: UIViewController {

    @IBOutlet weak var titel_TF: UITextField!
    @IBOutlet weak var date_Picker: UIDatePicker!
    @IBOutlet weak var note_TV: UITextField!
    
    weak var delegate : Button_Delegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addItem_Action(_ sender: UIButton!) {
        // Format Date, Time
        let date_Format = DateFormatter()
        date_Format.dateFormat = "dd/MM/yyyy"
        let dueDate_string = date_Format.string(from: date_Picker.date)
        
        // check if nil or not
        if let titel = titel_TF.text , let note = note_TV.text {
            if  titel != "" && note != ""{
                delegate?.addItem_Pressed(  titel: titel , note: note , dueDate: dueDate_string)
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
 

}
