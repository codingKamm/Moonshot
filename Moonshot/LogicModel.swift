//
//  LogicModel.swift
//  Moonshot
//
//  Created by Cameron Warner on 11/21/23.
//

import Foundation
import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new Custom Text")
        self.text = text
    }
}

struct User: Codable {
    let name: String
    let address: String
}

struct Address: Codable {
    let street: String
    let city: String 
}


extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
