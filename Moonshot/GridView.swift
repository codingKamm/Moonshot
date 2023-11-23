//
//  GridView.swift
//  Moonshot
//
//  Created by Cameron Warner on 11/23/23.
//

import SwiftUI

struct GridView: View {
//    let layout = [
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80))
//    ]
    
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: layout) {
                ForEach(0..<1_000) {
                    Text("Item \($0)")
                }
            }
        }
        
        ScrollView (.horizontal){ //Horizonatl Scroll
            LazyHGrid(rows: layout){
                ForEach(0..<1_000) {
                    Text("Rows \($0)")
                }
            }
            
        }
        
        
    }
}

#Preview {
    GridView()
}
