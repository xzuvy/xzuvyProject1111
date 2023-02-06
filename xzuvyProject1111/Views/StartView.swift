//
//  ContentView.swift
//  xzuvyProject1111
//
//  Created by Peter Clarke on 06.02.2023.
//

import SwiftUI

struct StartView: View {
        @State var login = ""
        @State var password = ""
        @State var infoView = false
        var body: some View {
            VStack{
                HStack{
                    add
                    Spacer()
                    info
                    
                }
                Spacer()
                VStack{
                    xzuvyProjectText
                    loginTextField
                    passwordTextField
                    loginButton
                }
                Spacer()
                
            }
            
            .background(Image("backgroundStartMenu").resizable().ignoresSafeArea(.all))
            .fullScreenCover(isPresented: $infoView, content: {
                InfoView()
            })
            
        }
        
        var loginButton : some View{
            Button {
                print("something")
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
            TextField("LOGIN...", text: $login)
                .font(.title2)
                .background(.white)
                .cornerRadius(12)
                .padding(.horizontal,70)
                .textFieldStyle(.roundedBorder)
        }
        
        var passwordTextField : some View{
            TextField("PASSWORD...", text: $password)
                .font(.title2)
                .background(.white)
                .cornerRadius(12)
                .padding(.horizontal,70)
                .textFieldStyle(.roundedBorder)
        }
        
        var xzuvyProjectText : some View{
            Text("Xzuvy\nProject")
                .font(.custom("AvenirNext-Bold", size: 40))
                .foregroundColor(.white)
                .shadow(radius: 4)
        }
        
        var add : some View{
            Button {
                print("sdsd")
            } label: {
                Image(systemName: "person.badge.plus")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 55, height: 55)
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
                    .frame(width: 55 , height: 55)
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
        }
    
    }


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
