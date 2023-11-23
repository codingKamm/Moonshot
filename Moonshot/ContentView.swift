//
//  ContentView.swift
//  Moonshot
//
//  Created by Cameron Warner on 11/21/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        VStack{
            Text(String(astronauts.count))
        }
        
    }
}

#Preview {
    ContentView()
}
