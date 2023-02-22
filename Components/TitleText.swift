//
//  TitleText.swift
//  xzuvyProject1111
//
//  Created by Peter Clarke on 22.02.2023.
//

import SwiftUI

struct TitleText: View {
    @State var text : String
    var body: some View {
        
        Text(text)
            .padding()
            .font(.custom("AvenirNext-Bold", size: 42))
            .cornerRadius(20)
            .frame(maxWidth: .infinity)
            .background(Color("firstPlayer"))
            .foregroundColor(.white)
        
    }
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        TitleText(text : "Магнитотерапия")
    }
}
