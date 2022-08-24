//
//  SignUpView.swift
//  Diary master
//
//  Created by Евгений Воронов on 11.08.2022.
//

import SwiftUI

struct SignUpView: View {
    @State private var firstNameSignUp = ""
    @State private var lastNameSignUp = ""
    @State private var emailSignUp = ""
    @State private var passwordSignUp = ""
    
    @Binding var isPresented: Bool
    // var signIn = SignInView()
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey("createAccout"))
                .font(.title.bold())
                .padding(.bottom, 65)
            
            VStack(alignment: .leading) {
                
                Text(LocalizedStringKey("enterFirstName"))
                    .font(.headline)
                    .opacity(0.7)
                    .padding(.bottom, -2)
                TextField(LocalizedStringKey("firstName"), text: $firstNameSignUp)
                    .padding(.vertical)
                    .background(.gray.opacity(0.5))
                    .cornerRadius(15)
                    .padding(.bottom, 15)
                
                Text(LocalizedStringKey("enterLastName"))
                    .font(.headline)
                    .opacity(0.7)
                    .padding(.bottom, -2)
                TextField(LocalizedStringKey("lastName"), text: $lastNameSignUp)
                    .padding(.vertical)
                    .background(.gray.opacity(0.5))
                    .cornerRadius(15)
                    .padding(.bottom, 15)
                
                Text(LocalizedStringKey("enterYourEmail"))
                    .font(.headline)
                    .opacity(0.7)
                    .padding(.bottom, -2)
                TextField(LocalizedStringKey("email"), text: $emailSignUp)
                    .padding(.vertical)
                    .background(.gray.opacity(0.5))
                    .cornerRadius(15)
                    .padding(.bottom, 15)
                
                Text(LocalizedStringKey("enterYourPassword"))
                    .font(.headline)
                    .opacity(0.7)
                    .padding(.bottom, -2)
                TextField(LocalizedStringKey("password"), text: $passwordSignUp)
                    .padding(.vertical)
                    .background(.gray.opacity(0.5))
                    .cornerRadius(15)
                    .padding(.bottom, 15)
            }
            .padding(.bottom, 40)
            
            Button {
                //
            } label: {
                Text(LocalizedStringKey("signUp"))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 170)
                    .padding(20)
                    .background(LinearGradient(colors: [.cyan, .indigo.opacity(0.7)], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(25)
                    .font(.title2.bold())
            }
        }
        .toolbar(content: {
            Button  {
                isPresented = false
            } label: {
                Image(systemName: "x.circle.fill")
                    //.padding(.top, 45)
                    .padding(.horizontal, -5)
                    .font(.system(size: 30).bold())
                    .foregroundColor(.black)
            }
        })
        .padding()
        .background(Image("login fon2")
            .resizable()
            .frame(width: UIScreen.main.bounds.width - 0, height: UIScreen.main.bounds.height - 0).ignoresSafeArea(.all))
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignUpView(isPresented: .constant(true))
        }
        
    }
}
