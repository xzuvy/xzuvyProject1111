//
//  VikingsView.swift
//  xzuvyProject1111
//
//  Created by Peter Clarke on 28.02.2023.
//

import SwiftUI

struct VikingsView: View {
    
    @State var mainView = false
    @State var addingViking = false
    
    var body: some View {
        NavigationView{
            List(characters){ character in
                NavigationLink(destination: VikingsDetailView(character: character)){
                    ListOfCharacters(character: character)
                    
                }
                
                .buttonStyle(PlainButtonStyle())
                
            }
            .navigationTitle("Персонажи сериала")
            .toolbarBackground(Color.red, for: .navigationBar)
            .background(.black)
            .accentColor(Color.black)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        mainView.toggle()
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .padding(.bottom)
                    }

                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        addingViking.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 40 , height: 40)
                            .padding(.bottom)
                    }

                }

            }
        }
        .accentColor(Color(.white))
        .fullScreenCover(isPresented: $mainView) {
            MainView()
        }
        .sheet(isPresented: $addingViking) {
            VikingsAdding(charactersss: ListOfCharacters(character: CharactersVikings(imageName: "", name: "", information: "", status: "")))
        }

    }
}

//struct MainViking : View{
//    var body: some View {
//
//    }
//}


struct VikingsView_Previews: PreviewProvider {
    static var previews: some View {
        VikingsView()
    }
}

struct ListOfCharacters: View {
    
    let character: CharactersVikings
    
    var body: some View {
        
        HStack {
            Image(character.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .clipped()
                .cornerRadius(40)
            VStack(alignment: .leading){
                Text(character.name)
                    .font(.system(size: 21, weight: .medium, design: .default))
                Text(character.status)
            }
        }
    }
}
