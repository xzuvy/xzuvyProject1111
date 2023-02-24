//
//  MemorizeView.swift
//  xzuvyProject1111
//
//  Created by Peter Clarke on 24.02.2023.
//

import SwiftUI

struct MemorizeView: View {
    
    @State private var isMainView = false
    
    private var fourColumnGrid = [GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible())]
    private var sixColumnGrid = [GridItem(.flexible()),
                                 GridItem(.flexible()),
                                 GridItem(.flexible()),
                                 GridItem(.flexible()),
                                 GridItem(.flexible()),
                                 GridItem(.flexible())]
    
    @State var cards = createCardList().shuffled()
    @State var MatchedCards = [Card]()
    @State var UserChoices = [Card]()
    
    var body: some View {
        GeometryReader{ geo in
            VStack{
                Text("🧠Игра запоминайка🧠")
                    .font(.custom("AvenirNext-Bold", size: 35))
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                LazyVGrid(columns: fourColumnGrid, spacing: 10){
                    ForEach(cards){ card in
                        MemorizeCardView(card: card, width: Int(geo.size.width/4 - 10), MatchedCards: $MatchedCards, UserChoices: $UserChoices)
                    }
                    
                }
                VStack{
                    Text("Найдите эти карты ,\n чтобы выиграть : ")
                        .font(.custom("AvenirNext-Bold", size : 27))
                        .foregroundColor(.white)
                    LazyVGrid(columns: sixColumnGrid, spacing: 5){
                        ForEach(cardValues, id:\.self){cardValue in
                            if !MatchedCards.contains(where: {$0.text ==
                                cardValue}) {
                                Text(cardValue)
                                    .font(.system(size: 30))

                            }
                            
                        }
                    }
                    

                }
                HStack{
                    Button {
                        isMainView.toggle()
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward")
                            .resizable()
                            .frame(width: 40 , height: 40)
                            .foregroundColor(.white)
                            .padding(.leading)
                    }
                    Spacer(minLength: 10)
                }
            }
            .background(Image("backgroundMemorize"))
            .fullScreenCover(isPresented: $isMainView) {
                MainView()
            }
            
        }
    }
}

struct MemorizeView_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeView()
    }
}
