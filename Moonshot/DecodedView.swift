//
//  DecodedView.swift
//  Moonshot
//
//  Created by Cameron Warner on 11/21/23.
//

import SwiftUI

struct DecodedView: View {
    var body: some View {
        Button("JSON Decoder") {
            let input = """
                        {
                        "name": "E.M. Douglass"
                        "address": {
                            "street": "123 Poet Ave"
                            "city": "Detroit"
                        }
                        }
                        """
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data){
                print(user.address)
            }
            
        }
        
        
    }
}

#Preview {
    DecodedView()
}
