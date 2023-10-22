//
//  ItemModel.swift
//  hot-dog list app
//
//  Created by GMAN's macbook on 2023/5/24.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompeleted: Bool
    let labels: String
    
    init(id: String = UUID().uuidString, title: String, isCompeleted: Bool, labels: String) {
        self.id = id
        self.title = title
        self.isCompeleted = isCompeleted
        self.labels = labels
    }
    
    func updateCompletion() -> ItemModel{
        return ItemModel(id: id, title: title, isCompeleted: !isCompeleted, labels: labels)
    }
    
}
