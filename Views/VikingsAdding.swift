//
//  VikingsAdding.swift
//  xzuvyProject1111
//
//  Created by Peter Clarke on 02.03.2023.
//

import SwiftUI

struct VikingsAdding: View {
    
    @State private var showImagePicker = false
    @State private var image = UIImage(systemName: "photo")!
    @State private var imageName = ""
    @State private var name = ""
    @State private var information = ""
    @State private var status = ""
    let charactersss : ListOfCharacters
    
    var body: some View {
        VStack{
            Image(uiImage: image)
                .resizable()
                .frame(maxWidth: 150, maxHeight: 150)
                .aspectRatio( contentMode: .fit)
                .padding()
                .shadow(radius: 3)
                .padding()
                .onTapGesture {
                    showImagePicker.toggle()
                }
            
            TextField("Имя персонажа ", text: $name)
                .padding()
//                .background(.black)
                .foregroundColor(.black)
                
            TextField("Информация о персонаже", text: $information)
                .padding()
            TextField("Статус", text: $status)
                .padding()
            
            Button {
                var viking = CharactersVikings(imageName: imageName, name: name, information: information, status: status)
                viking.imageName = charactersss.character.imageName
                viking.name = charactersss.character.name
                viking.status = charactersss.character.status
                
                let imageData = image.jpegData(compressionQuality: 0.3)
                
                print("dobavlen")
            } label: {
                Text("Добавить")
                    .padding()
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(15)

            }
            Spacer()

        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
        }
    }
}

struct VikingsAdding_Previews: PreviewProvider {
    static var previews: some View {
        VikingsAdding(charactersss: ListOfCharacters(character: CharactersVikings(imageName: "", name: "", information: "", status: "")) )
    }
}
