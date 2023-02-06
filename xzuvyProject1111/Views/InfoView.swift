//
//  InfoView.swift
//  xzuvyProject1111
//
//  Created by Peter Clarke on 06.02.2023.
//

import SwiftUI

struct InfoView: View {
    private let url = URL(string: "https://github.com/xzuvy")!
    @State var startView = false
    var body: some View {
        
        VStack{
            Text("Справка")
                .foregroundColor(.white)
                .font(.custom("AvenirNext-Bold", size: 36))
                .padding(.bottom)
            
            Spacer()
            scrollView
            HStack{
                backButton
                Spacer()
                shareButton
                

            }
            
        }
        .background(Image("backgroundInfoMenu"))
        .fullScreenCover(isPresented: $startView) {
            StartView()
        }
    }
    var backButton : some View{
        Button {
            startView.toggle()
        } label: {
            Image(systemName: "arrowshape.turn.up.backward")
                .resizable()
                .frame(width: 35 , height: 35)
                .foregroundColor(.white)
                .padding()
        }
       
    }
    
    var shareButton : some View{
        ShareLink(item: url){
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .frame(width: 35, height: 35)
                .padding()
                .foregroundColor(.white)
        }
        
    }
    
    var scrollView : some View{
        
        ScrollView{
            VStack{
                Text("   Функционал данного проекта:\n1)Взаимодействие с БД для использования приложения;\n2)Имеется регистрация/авторизация пользователя в приложении.\n \n    Из чего состоит проект:\n1)Информация о персонажах сериала 'Vikings'\n2)Игра в слова\n3)Игра запоминай картинки\n \n Что из себя представляет каждый пункт?\n1)Приложение 'Информация о персонажах' позволяет выбрать героя сериала нажав на картинку персонажа после чего даётся возможность посмотреть всю интересующуюся информацию о персонаже. Также можно добавлять/редактировать персонажей\n2)Игра в слова - игра, в которой двум игрокам дается возможность выбрать одно длинное слово с помощью которого они будут собирать слова, а также ввести в двух полях имя каждого игрока.\n3)Игра запоминай картинки - игра, в которой перед игроком лежит определенное количество картинок каждую из которой он поворачивает и должен запомнить где лежит другая точно такая же картинка.")
                    .font(.custom("AvenirNext-Bold",
                     size: 24))
                    .foregroundColor(.white)
                    .padding(.leading)
                    .shadow(radius: 4)
            }
            
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
