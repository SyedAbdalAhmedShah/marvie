//
//  ContentView.swift
//  marvie
//
//  Created by Abdal Shah on 10/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    
    var body: some View {
        ZStack(alignment: .center, content:  {
            Color(.background).ignoresSafeArea()
            VStack(alignment: .leading, content:  {
                
                Spacer(minLength: 30)
                Text("Welcome").font(.largeTitle).bold().foregroundStyle(.white).padding(.top, 30 ).padding(.bottom,1)
                Text("Sign in to continue").font(.system(size: 20)).foregroundStyle(.grey)
                
                HStack {
                    Image(systemName: "person").foregroundStyle(Color("yellowClr")).frame(maxWidth: 40,maxHeight: 40).background(Color("lightYellow")).clipShape(.rect(cornerRadius: 8)).padding(.trailing,10)
                    
                    ZStack {
                        TextField("Full Name", text: $fullName,prompt: Text("Your full name").foregroundStyle(Color("greyColor")))
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black.opacity(0.2)).padding(.top,35)
                           
                    }
                 
                }.padding(.top, 50)
                
                HStack {
                    Image(systemName: "lock").foregroundStyle(.red).frame(maxWidth: 40,maxHeight: 40).background(Color("lightRed")).clipShape(.rect(cornerRadius: 8)).padding(.trailing,10)
                    
                    ZStack {
                        if showPassword {
                            TextField("Full Name", text: $password,prompt: Text("● ● ● ● ● ●").foregroundStyle(Color("greyColor")))
                        }else {
                            SecureField("Full Name", text: $password,prompt: Text("● ● ● ● ● ●").foregroundStyle(Color("greyColor")))
                            
                        }
                       
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black.opacity(0.2)).padding(.top,35)
                        
                    }.overlay(alignment: .trailing) {
                        
                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName:showPassword ? "eye.fill"  : "eye.slash.fill").foregroundStyle(.grey)
                        }
                    }
                    
                   

                }.padding(.top, 50)
                
                
                Button {
                    
                } label: {
                    HStack {
                        Text("Sign in").foregroundStyle(.white).bold().padding().frame(maxWidth: .infinity).background(.greenClr).clipShape(.rect(cornerRadius: 10))
                    }
                }.padding(.top,50)
                
                
                Button {
                    
                } label: {
                    Text("Forgot Password? ").frame(maxWidth: .infinity).font(.system(size: 16)).foregroundStyle(.grey)
                }.padding(.vertical)
                
                
                Button {
                    
                } label: {
                    HStack {
                        Text("Sign up").foregroundStyle(.white).bold().padding().frame(maxWidth: .infinity).background(.greenClr.opacity(0.5)).clipShape(.rect(cornerRadius: 10))
                    }
                }.padding(.top,30)
                Spacer(minLength: 30)
                
            }).padding()
            
        })
    }
}

#Preview {
    ContentView()
}
