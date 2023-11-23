//
//  ContentView.swift
//  Moonshot
//
//  Created by Cameron Warner on 11/21/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Address] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        VStack{
            Text(String(astronauts.count))
        }
        
    }
}

#Preview {
    ContentView()
}
