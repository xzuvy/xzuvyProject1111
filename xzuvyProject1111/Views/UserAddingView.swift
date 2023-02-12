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
        
            VStack{
                
                Spacer()
                loginTextField
                    .padding(.top)
                    //.position(x : 210 , y : 370 )
                passwordTextField
                    .padding(.bottom)
                    //.position(x : 210 , y : 90 )
                createButton
                    //.position(x : 210, y : 10)
                
                HStack{
                    homeButton
                    Spacer()
                }
                
                
            }
        
            .background(Image("backgroundRegistration").resizable().ignoresSafeArea(.all))
        .fullScreenCover(isPresented: $home) {
            StartView()
        }
            
        
    }
    
    var loginTextField : some View{
        TextField("Login", text: $login)
        
            .font(.title2.bold())
            .background(.white)
            .cornerRadius(12)
            .padding(.horizontal,100)
            .textFieldStyle(.roundedBorder)
            .position(x : 210 , y : 350 )
            
        
        
    }
    
    var passwordTextField : some View{
        TextField("Password", text: $password)
            .font(.title2.bold())
            .background(.white)
            .cornerRadius(12)
            .padding(.horizontal,100)
            .textFieldStyle(.roundedBorder)
            .position(x : 210 , y : 159 )
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
                .position(x : 210, y : -10)
                
            
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
