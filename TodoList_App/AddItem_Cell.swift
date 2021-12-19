//
//  AddItem_CellTableViewCell.swift
//  TodoList_App
//
//  Created by Atheer Alahmari on 14/05/1443 AH.
//

import UIKit

class AddItem_Cell: UITableViewCell  {
    
    @IBOutlet weak var titel_cell : UILabel!
    @IBOutlet weak var not_cell : UILabel!
    @IBOutlet weak var date_cell : UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
