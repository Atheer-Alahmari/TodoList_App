//
//  Button_Delegate.swift
//  TodoList_App
//
//  Created by Atheer Alahmari on 14/05/1443 AH.
//

import UIKit
protocol Button_Delegate :class {
    func addItem_Pressed( titel : String ,note : String ,dueDate : String )

}
