//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Cameron Warner on 11/24/23.
//

import Foundation


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
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loaded
    }
}
