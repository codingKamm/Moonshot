//
//  ContentView.swift
//  Moonshot
//
//  Created by Cameron Warner on 11/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            NavigationLink("Tap Me") {
                Text("Detail View")
            }
                .navigationTitle("SwiftUI")
            
            NavigationLink {
                Text("Second View")
            } label: {
                VStack{
                    Text("This is a label")
                    Text("This is too")
                    Image(systemName: "moon")
                }
                .font(.largeTitle)
            }
        }
        
        List(0..<100) { row in
            NavigationLink("Row \(row)") {
                Text("Detail \(row)")
            }
            
        }


    }
}

#Preview {
    ContentView()
}
