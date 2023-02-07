//
//  MainView.swift
//  xzuvyProject1111
//
//  Created by Peter Clarke on 07.02.2023.
//

import SwiftUI

struct MainView: View {
    @State var startView = false
    var body: some View {
        ZStack{
            VStack{
                Text("Список возможностей")
                    .font(.custom("AvenirNext-Bold", size: 30))
                    .foregroundColor(.white)
                HStack{
                    charactersOfSerial
                    gameOfWords
                    memorizeGame
                }
                Spacer()
                HStack{
                    homeButton
                    Spacer()
                    infoButton
                }
            }
        }
        .background(Image("backgroundMainMenu"))
        .fullScreenCover(isPresented: $startView) {
            StartView()
        }
        
    }
    
    var charactersOfSerial : some View{
        VStack{
            Button {
                print("")
            } label: {
                Image("vikings")
                    .resizable()
                    .frame(width: 100 , height: 100)
                    .padding()
                Text("lalala")
                    .foregroundColor(.white)
            }
        }
        

    }
    
    var gameOfWords : some View{
        Button {
            print("something")
        } label: {
            Image("gameofwords")
                .resizable()
                .frame(width: 100 ,height: 100)
                .padding()
            
        }

    }
    
    var memorizeGame : some View{
        Button {
            print("something")
        } label: {
            Image("memorize")
                .resizable()
                .frame(width: 100,height: 100)
                .padding()
        }

    }
    
    var homeButton : some View{
        Button {
            startView.toggle()
        } label: {
            Image(systemName:"house")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .padding()
            
        }
        
    }
    var infoButton : some View{
        Button {
            print("")
        } label: {
            Image(systemName: "info.square")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .padding()
        }
    }

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
