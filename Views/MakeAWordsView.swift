//
//  MakeAWordsView.swift
//  xzuvyProject1111
//
//  Created by Peter Clarke on 22.02.2023.
//

import SwiftUI

struct WordsStartView: View {
    
    @State var word = ""
    @State var playerOne = ""
    @State var playerTwo = ""
    @State var gameView = false
    @State var isAlertPresented = false
    @State var mainView = false
    
    var body: some View {
        VStack{
            Button {
                mainView.toggle()
            } label: {
                Image(systemName: "arrowshape.turn.up.backward")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .position(x : 50, y : 1)
                    .foregroundColor(.white)
            }

            TitleText(text: "Игра в слова")
            
            BigWordTextField(word: $word, placeHolder: "Введите большое слово")
                .padding(20)
                .padding(.top,32)
            
            BigWordTextField(word: $playerOne, placeHolder: "Имя первого игрока")
                .cornerRadius(12)
                .padding(.horizontal, 20)
            
            BigWordTextField(word: $playerTwo, placeHolder: "Имя второго игрока")
                .cornerRadius(12)
                .padding(.horizontal, 20)
            
            Button {
                
                if word.count > 7{
                    gameView.toggle()
                }
                else{
                    self.isAlertPresented.toggle()
                }
                
                
            } label: {
                Text("Начать")
                    .padding()
                    .font(.custom("AvenirNext-Bold", size: 35))
                    .foregroundColor(.white)
                    .background(Color("firstPlayer"))
                    .cornerRadius(20)
                    .padding(.top, 80)
                
            }
            Spacer(minLength: 100)

                
        }
        .background(Image("backgroundWords"))
        .alert("Длинное слово слишком короткое",
               isPresented: $isAlertPresented,
               actions: {
            Text("Ok")
        })
        .fullScreenCover(isPresented: $gameView, content: {
            
            let name1 = playerOne == "" ? "Игрок 1" : playerOne
            let name2 = playerTwo == "" ? "Игрок 2" : playerTwo
            
            let playerOne = Player(name: name1)
            let playerTwo = Player(name: name2)
            
            let gameViewModule = GameViewModule(playerOne: playerOne, playerTwo: playerTwo, word: word)
            
            GameView(viewModel: gameViewModule)
        })
        .fullScreenCover(isPresented: $mainView) {
            MainView()
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WordsStartView()
    }
}
