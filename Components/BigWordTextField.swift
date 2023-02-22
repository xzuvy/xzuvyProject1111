//
//  BigWordTextField.swift
//  xzuvyProject1111
//
//  Created by Peter Clarke on 22.02.2023.
//

import SwiftUI

struct BigWordTextField: View {
    
    @State var word : Binding<String>
    var placeHolder : String
    
    var body: some View {
        TextField(placeHolder, text: word)
            .font(.title2)
            .padding()
            .background(.white)
            //.background(Image("background"))
            .cornerRadius(12)
            
    }
}
