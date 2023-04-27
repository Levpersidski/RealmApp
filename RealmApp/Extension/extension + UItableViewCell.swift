//
//  extension + UItableViewCell.swift
//  RealmApp
//
//  Created by Роман Бакаев on 27.04.2023.
//  Copyright © 2023 Alexey Efimov. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func configure(with taskList: TaskList) {
        let currentTasks = taskList.tasks.filter("isComplete = false")
        var content = defaultContentConfiguration()
        
        content.text = taskList.name
        
        if taskList.tasks.isEmpty {
            content.secondaryText = "0"
            accessoryType = .none
        } else if currentTasks.isEmpty {
            content.secondaryText = nil
            accessoryType = .checkmark
        } else {
            if #available(iOS 15.0, *) {
                content.secondaryText = currentTasks.count.formatted()
            } else {
                // Fallback on earlier versions
            }
            accessoryType = .none
        }

        contentConfiguration = content
    }
}
