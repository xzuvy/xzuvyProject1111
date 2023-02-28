//
//  VikingsDetailView.swift
//  xzuvyProject1111
//
//  Created by Peter Clarke on 28.02.2023.
//

import SwiftUI

struct VikingsDetailView: View {
    
    let character : CharactersVikings
    
    var body: some View {
        VStack {
            Image(character.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 300)
                .clipped()
                .shadow(radius: 3)
            Text(character.name)
                .font(.custom("AvenirNext-Bold", size: 40))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .shadow(radius: 3)
            Text(character.status)
                .foregroundColor(.white)
                .font(.custom("AvenirNext-Bold", size: 25))
                .fontWeight(.heavy)
                .shadow(radius: 1)
            Spacer(minLength: 20)
            ScrollView{
                VStack{
                    Text(character.information)
                        .foregroundColor(.white)
                        .font(.custom("AvenirNext-Bold", size: 25))
                        .shadow(radius: 3)
                        .padding()
                    
                    
                }
            }
            .shadow(radius: 4)
            
            
            //                .fixedSize(horizontal: false, vertical: true)
            //                //.multilineTextAlignment(.center)
            //                .padding()
            //                .frame(width: 350, height: 300)
            //                .background(Rectangle().fill(Color.clear).shadow(radius: 3))
        }
        .background(Image("backgroundWood"))
    }
}


struct VikingsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VikingsDetailView(character: characters[0])
    }
}
