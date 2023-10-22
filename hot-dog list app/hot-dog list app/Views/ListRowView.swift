//
//  ListRowView.swift
//  hot-dog list app
//
//  Created by GMAN's macbook on 2023/5/20.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompeleted ? "checkmark.rectangle" : "rectangle")
                .foregroundColor(item.isCompeleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}
struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First item", isCompeleted: false, labels: "null")
    static var item2 = ItemModel(title: "Second item", isCompeleted: true, labels: "null")
    
    static var previews: some View {
        Group{
            ListRowView(item: item1)
//            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
