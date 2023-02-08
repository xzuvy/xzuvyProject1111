//
//  UserAddingView.swift
//  xzuvyProject1111
//
//  Created by Peter Clarke on 08.02.2023.
//

import SwiftUI

struct UserAddingView: View {
    @State var login = ""
    @State var password = ""
    @State var home = false
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Text("Регистрация")
                    .foregroundColor(.white)
                    .font(.custom("AvenirNext-Bold", size: 40).bold())
                    .shadow(radius: 15)
                    .padding()
                loginTextField
                passwordTextField
                createButton
                Spacer()
                HStack{
                    homeButton
                    Spacer()
                }
                
                
            }
        }
        .background(Image("backgroundAdding"))
        .fullScreenCover(isPresented: $home) {
            StartView()
        }
            
        
    }
    
    var loginTextField : some View{
        TextField("Login", text: $login)
        
            .font(.title2.bold())
            .background(.white)
            .cornerRadius(12)
            .padding(.horizontal,80)
            .textFieldStyle(.roundedBorder)
        
        
    }
    
    var passwordTextField : some View{
        TextField("Password", text: $password)
            .font(.title2.bold())
            .background(.white)
            .cornerRadius(12)
            .padding(.horizontal,80)
            .textFieldStyle(.roundedBorder)
    }
    
    var createButton : some View{
        Button {
            print("something")
        } label: {
            Text("Создать")
                .padding()
                .foregroundColor(.black)
                .font(.custom("AvenirNext-Bold", size: 19))
                .background(.white)
                .cornerRadius(25)
                .padding()
                
            
        }

    }
    
    var homeButton : some View{
        Button {
            home.toggle()
        } label: {
            Image(systemName:"house")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .padding()
        }

    }
    
    
}

struct UserAddingView_Previews: PreviewProvider {
    static var previews: some View {
        UserAddingView()
    }
}
