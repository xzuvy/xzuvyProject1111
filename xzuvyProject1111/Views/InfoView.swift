//
//  InfoView.swift
//  xzuvyProject1111
//
//  Created by Peter Clarke on 06.02.2023.
//

import SwiftUI

struct InfoView: View {
    
    private let spravkaList : [SpravkaItem] = [
        SpravkaItem(spravka: "📚", name: "Функционал данного проекта", description: "Функционал данного проекта:\n1)Взаимодействие с БД для использования приложения;\n2)Имеется регистрация/авторизация пользователя в приложении.\n \n    Из чего состоит проект:\n1)Информация о персонажах сериала 'Vikings'\n2)Игра в слова\n3)Игра запоминай картинки."),
        SpravkaItem(spravka: "🧩", name: "Из чего состоит проект?", description: "Из чего состоит проект:\n1)Информация о персонажах сериала 'Vikings'\n2)Игра в слова\n3)Игра запоминай картинки\n \n Что из себя представляет каждый пункт?\n1)Приложение 'Информация о персонажах' позволяет выбрать героя сериала нажав на картинку персонажа после чего даётся возможность посмотреть всю интересующуюся информацию о персонаже. Также можно добавлять/редактировать персонажей\n2)Игра в слова - игра, в которой двум игрокам дается возможность выбрать одно длинное слово с помощью которого они будут собирать слова, а также ввести в двух полях имя каждого игрока.\n3)Игра запоминай картинки - игра, в которой перед игроком лежит определенное количество картинок каждую из которой он поворачивает и должен запомнить где лежит другая точно такая же картинка.")
        
    ]
    
    @State var startView = false
    var body: some View {
        
        NavigationView {
            List(spravkaList) { SpravkaItem in
                NavigationLink(destination: DetalisView(spravkaItem: SpravkaItem)){
                    HStack {
                        SpravkaCircleView(spravkaItem: SpravkaItem)
                        Text(SpravkaItem.name)
                            .font(.headline)
                        
                    }
                    .padding(5)
                }
                
            }
            .navigationBarTitle(Text("Справка"))
            .toolbar{
                Button("Home"){
                    startView.toggle()
                }
            }
        }
        .background(Image("infoView"))
        .fullScreenCover(isPresented: $startView) {
            StartView()
        
        }
        
        
    }
    
}

struct DetalisView : View{
    let spravkaItem : SpravkaItem
    
    var body : some View{
        VStack{
            HStack{
                SpravkaCircleView(spravkaItem: spravkaItem)
                    .padding(5)
                
                Text(spravkaItem.name)
                    .font(.largeTitle)
                    .bold()
            }
            Text(spravkaItem.description)
                .padding(.top)
        }
        .padding()
        .navigationBarTitle(Text(spravkaItem.name))
    }
}

struct SpravkaCircleView : View{
    let spravkaItem : SpravkaItem
    var body: some View {
        ZStack{
            Text(spravkaItem.spravka)
                .shadow(radius: 3)
                .font(.largeTitle)
                .frame(width : 65 , height: 65)
                .overlay(
                    Circle().stroke(Color.purple, lineWidth: 3)
                )
        }
    }
}

struct SpravkaItem : Identifiable {
    let id = UUID()
    let spravka : String
    let name : String
    let description : String
    
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
