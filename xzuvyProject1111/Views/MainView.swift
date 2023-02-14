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
                
                VStack{
                    
                    charactersOfSerial
                        .position(x : 210 , y : 160)
                    gameOfWords
                        .position(x :210, y : 240 )
                    memorizeGame
                        .position(x : 210, y : 320)
                }
                Spacer()
                HStack{
                    homeButton
                        .position(x : 55 , y : 385)
                    
                    infoButton
                        .position(x : 147, y : 385)
                }
            }
        }
        .background(Image("mainView").resizable().ignoresSafeArea(.all))
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
                        .frame(width: 95 , height: 95)
                        .padding()

                }

        }
        

    }
    
    var gameOfWords : some View{
        Button {
            print("something")
        } label: {
            Image("gameofwords")
                .resizable()
                .frame(width: 95 ,height: 95)
                .padding()
            
        }

    }
    
    var memorizeGame : some View{
        Button {
            print("something")
        } label: {
            Image("memorize")
                .resizable()
                .frame(width: 95,height: 95)
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
