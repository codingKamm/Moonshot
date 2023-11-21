//
//  ScrollView.swift
//  Moonshot
//
//  Created by Cameron Warner on 11/21/23.
//

import SwiftUI

struct ScrollingView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyVStack (spacing: 10) { //Lazy Stacks can be used in exactly the same way as regular stacks but will load their content on-demand – they won’t create views until they are actually shown, and so minimize the amount of system resources being used.
                ForEach(0..<100){
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity) //allows users to use entire screen to scroll 
        }
            
    }
}

#Preview {
    ScrollingView()
}
