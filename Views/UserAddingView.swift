//
//  UserAddingView.swift
//  xzuvyProject1111
//
//  Created by Peter Clarke on 08.02.2023.
//

import SwiftUI
import Firebase

struct SecureTextField : View {
    @State var isSecureField  = true
    @Binding var text : String
    
    var body : some View{
        HStack{
            if isSecureField {
                SecureField("Password", text: $text)
            } else {
                TextField(text, text: $text)
            }
        }
        .overlay(alignment : .trailing) {
            Image(systemName: isSecureField ? "eye.slash": "eye")
                .onTapGesture {
                    isSecureField.toggle()
                }
        }
    }
}


struct UserAddingView: View {
    @State var login = ""
    @State var password = ""
    @State var isSecured = true
    @State var home = false
    @State private var userIsLogged = false
    @State private var alertMessage = ""
    @State private var isShowAlert = false
    var body: some View {
        content
        
    }
    
    var content : some View{
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
        TextField("Email", text: $login)
        
            .font(.title2.bold())
            .background(.white)
            .cornerRadius(12)
            .padding(.horizontal,80)
            .textFieldStyle(.roundedBorder)
            .position(x : 210 , y : 350 )
        
        
        
    }
    
    var passwordTextField : some View{
        SecureTextField(text: $password)
            .font(.title2.bold())
            .background(.white)
            .cornerRadius(12)
            .padding(.horizontal,80)
            .textFieldStyle(.roundedBorder)
            .position(x : 210 , y : 159 )
    }
    
    var createButton : some View{
        Button("Создать") {
            register()
            isShowAlert = true
            self.login = ""
            self.password = ""
            
            
        }
        .alert(isPresented: $isShowAlert) {
            Alert(
                title: Text("Регистрация прошла успешно"),
                message: Text("Вы успешно создали аккаунт с почтой : \n\(login)"))
            
            
        }
        
        .padding()
        .foregroundColor(.black)
        .font(.custom("AvenirNext-Bold", size: 19))
        .background(.white)
        .cornerRadius(25)
        .padding()
        .position(x : 210 , y : -10)
        
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
    
    func register() {
        Auth.auth().createUser(withEmail: login, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            
        }
    }
    
    
}

struct UserAddingView_Previews: PreviewProvider {
    static var previews: some View {
        UserAddingView()
    }
}
