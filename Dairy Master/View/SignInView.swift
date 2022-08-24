//
//  SignInView.swift
//  Dairy master
//
//  Created by Евгений Воронов on 09.08.2022.
//

import SwiftUI

struct SignInView: View {
    @State var login = ""
    @State var pass = ""
    @State var isPresentinSignUp = false
    var body: some View {
        VStack {
            Spacer()
                .frame(minHeight: 0, maxHeight: 30)
               
            Text(LocalizedStringKey("signIn"))
                .font(.largeTitle.bold())
                .padding(.bottom, 50)
            
            VStack(alignment: .leading) {
                Text(LocalizedStringKey("enterYourLogin"))
                    .padding(.horizontal)
                    .font(.headline)
                    .opacity(0.7)
                    .padding(.bottom, -2)
                TextField(LocalizedStringKey("login"), text: $login)
                    .foregroundColor(.black)
                    .padding(.vertical, 20)
                    .padding(.horizontal)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(8)
                    .padding(.bottom, 25)
                Text(LocalizedStringKey("enterYourPassword"))
                    .padding(.horizontal)
                    .font(.headline)
                    .opacity(0.7)
                    .padding(.bottom, -2)
                TextField(LocalizedStringKey("password"), text: $pass)
                    .foregroundColor(.black)
                    .padding(.vertical, 20)
                    .padding(.horizontal)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(8)
                
                //                textloginAndPass(title: "Enter your login", textInField: "Enter login", bindValue: $login)
            }
            
            Button {
                //
            } label: {
                Text(LocalizedStringKey("enter"))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 170)
                    .padding(20)
                    .background(LinearGradient(colors: [.cyan, .indigo.opacity(0.7)], startPoint: .leading, endPoint: .trailing))
            }
            .font(.title2.bold())
            .cornerRadius(25)
            //.background(Capsule())
            .padding(.top, 35)
            
            Text(LocalizedStringKey("noAccount?"))
                .padding()
                .font(.title3)
            //.opacity(0.7)
            Button  {
                isPresentinSignUp.toggle()
            } label: {
                Text(LocalizedStringKey("signUp"))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 180)
                    .padding(20)
                    .background(LinearGradient(colors: [.cyan, .indigo.opacity(0.7)], startPoint: .leading, endPoint: .trailing))
            }
            .font(.title2.bold())
            .cornerRadius(20)
            //.background(Capsule().foregroundColor(.green))
            Text(LocalizedStringKey("enterUsed"))
                .bold()
                .padding()
                .padding(.top)
            
            HStack(spacing: 30) {
                
                Button {
                    //
                } label: {
                    Image("facebook logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
            }
                Button {
                    //
                } label: {
                    Image("google logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                }

                Button {
                    //
                } label: {
                    Image("apple logo2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                }

            }

            
            Spacer()
            
        }
        .offset(x: 0, y: -50)
        .sheet(isPresented: $isPresentinSignUp) {
            NavigationView {
                SignUpView(isPresented: $isPresentinSignUp)
            }
        }
        .background(Image("login fon2")
            .resizable()
            .frame(width: UIScreen.main.bounds.width - 0, height: UIScreen.main.bounds.height - 0).ignoresSafeArea(.all))
    }
    //    private func textloginAndPass (title: String, textInField: String, bindValue: Binding<String>) -> some View {
    //        Text(title)
    //            .font(.headline)
    //            .opacity(0.7)
    //        TextField(textInField, text: bindValue)
    //                .foregroundColor(.black)
    //                .padding()
    //                .background(Color.white.opacity(0.7))
    //                .cornerRadius(8)
    //            Divider()
    //                .padding(.bottom)
    //    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
//            .background(Image("login fon4")
//                .resizable()
//                .frame(width: 450, height: 1000)
//                        //.aspectRatio(contentMode: .fill)
//                .ignoresSafeArea(.all)
//            )
    }
}



