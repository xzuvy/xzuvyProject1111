//
//  WordCell.swift
//  xzuvyProject1111
//
//  Created by Peter Clarke on 22.02.2023.
//

import SwiftUI

struct WordCell: View {
    
    
    let word : String
    
    var body: some View {
        HStack{
            Text(word)
                .foregroundColor(.white)
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding()
                .font(.custom("AvenirNext-Bold", size: 22))
                
            
            Text("\(word.count)")
                .padding()
                .font(.custom("AvenirNext-Bold", size: 22))
                .foregroundColor(.white)
        }
    }
}

struct WordCell_Previews: PreviewProvider {
    static var previews: some View {
        WordCell(word: "Магнит")
    }
}
