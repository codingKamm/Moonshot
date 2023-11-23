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

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}



struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T { // Generics allow us to write code that is capable of working with a variety of different types. In this project, we wrote the Bundle extension to work with dictionary of astronauts, but really we want to be able to handle dictionaries of astronauts, arrays of missions, or potentially lots of other things.
        
       // To make a method generic, we give it a placeholder for certain types. This is written in angle brackets (< and >) after the method name but before its parameters
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loaded
    }
}
