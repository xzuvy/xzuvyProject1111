//
//  ContentView.swift
//  xzuvyProject1111
//
//  Created by Peter Clarke on 06.02.2023.
//

import SwiftUI
import Firebase

struct SecureTextFieldStartView : View{
    @State var isSecureFieldStart = true
    @Binding  var textSecure : String
    
    var body: some View{
        HStack{
            if isSecureFieldStart {
                SecureField("PASSWORD", text: $textSecure)
            } else {
                TextField(textSecure, text: $textSecure)
            }
        }
        .overlay(alignment : .trailing){
            Image(systemName: isSecureFieldStart ? "eye.slash": "eye")
                .onTapGesture {
                    isSecureFieldStart.toggle()
                }
        }
    }
}


struct StartView: View {
    @State var login = ""
    @State var password = ""
    @State var infoView = false
    @State var mainView = false
    @State var userAddView = false
    @State var userIsLogged = false
    @State var isShowAlert = false
    @State var alertMessage = ""
    var body: some View {
        VStack{
            HStack{
                add
                Spacer()
                info

            }
            Spacer()
            VStack{
                // xzuvyProjectText
                loginTextField
                    .shadow(radius: 4)
                passwordTextField
                    .shadow(radius: 4)
                    .padding(.bottom)
                loginButton
            }
            Spacer()
            
        }
        .onAppear {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    userIsLogged.toggle()
                }
                
            }
        }
        
        .background(Image("backgroundMainView").resizable().ignoresSafeArea(.all))
        .fullScreenCover(isPresented: $infoView, content: {
            InfoView()
        })
        .fullScreenCover(isPresented: $mainView) {
            MainView()
        }
        .fullScreenCover(isPresented: $userAddView) {
            UserAddingView()
        }
        
    }
    
    
    var loginButton : some View{
        Button {
            loginNew(email: self.login, password: self.password) { result in
                switch result {
                    
                case .success(let user):
                    mainView.toggle()
                case .failure(let error):
                    alertMessage = "???????????? ?????????????????????? : \(error.localizedDescription)"
                    isShowAlert.toggle()
                }
            }
        } label: {
            Image(systemName: "arrow.right.square")
                .resizable()
                .scaledToFill()
                .frame(width: 60 , height: 60)
                .foregroundColor(.white)
                .padding()
            
        }
        
    }
    
    var loginTextField : some View{
        TextField("EMAIL", text: $login)
            .font(.title2)
            .background(.white)
            .cornerRadius(12)
            .padding(.horizontal,70)
            .textFieldStyle(.roundedBorder)
            .padding(.top, 33)
    }
    
    var passwordTextField : some View{
        SecureTextFieldStartView(textSecure : $password)
            .font(.title2)
            .background(.white)
            .cornerRadius(12)
            .padding(.horizontal,70)
            .textFieldStyle(.roundedBorder)
            .padding(.bottom, 1)
    }
    var add : some View{
        Button {
            userAddView.toggle()
        } label: {
            Image(systemName: "person.badge.plus")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 35)
                .foregroundColor(.white)
                .padding(.horizontal)
        }
        
    }
    
    var info : some View{
        Button {
            infoView.toggle()
        } label: {
            Image(systemName: "info.square")
                .resizable()
                .scaledToFill()
                .frame(width: 50 , height: 30)
                .foregroundColor(.white)
                .padding(.horizontal)
        }
    }
    
    func loginNew( email : String,
                   password : String,
                   completion: @escaping (Result<User, Error>) -> ()) {
        Auth.auth().signIn(withEmail: login, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
            
        }
    }

}



struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
