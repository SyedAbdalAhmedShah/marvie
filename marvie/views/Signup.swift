//
//  Signup.swift
//  marvie
//
//  Created by Abdal Shah on 15/10/2024.
//

import SwiftUI

struct Signup: View {
    @State private var userName: String = ""

    var body: some View {
        
        ZStack(alignment: .center, content: {
            Color(.background).ignoresSafeArea()

            VStack (alignment: .leading, content:  {
                HeadingText(title: "Hello!")
                SubHeading(title: "lets introduce")
                HStack {
                    Image(systemName: "person").foregroundStyle(Color("yellowClr")).frame(maxWidth: 40,maxHeight: 40).background(Color("lightYellow")).clipShape(.rect(cornerRadius: 8)).padding(.trailing,10)
                    
                    ZStack {
                        TextField("Full Name", text: $userName,prompt: Text("Your full name").foregroundStyle(Color("greyColor")))
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black.opacity(0.2)).padding(.top,35)
                        
                    }
                    
                }.padding(.top, 50)
                HStack {
                    Image(systemName: "person").foregroundStyle(Color("yellowClr")).frame(maxWidth: 40,maxHeight: 40).background(Color("lightYellow")).clipShape(.rect(cornerRadius: 8)).padding(.trailing,10)
                    
                    ZStack {
                        TextField("Full Name", text: $userName,prompt: Text("User Name").foregroundStyle(Color("greyColor")))
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black.opacity(0.2)).padding(.top,35)
                        
                    }
                    
                }.padding(.top, 50)
                
                HStack {
                    BackButton().padding(.top,50)
                    NavigationLink {
                        NumberView().navigationBarBackButtonHidden(true)
                        
                    } label: {
                        HStack {
                            NextButton()
                        }
                    }.padding(.top,50)

                   
                    
                    
                }
               
            }).padding()
        })
    }
}

#Preview {
    Signup()
}

struct NextButton: View {
    var body: some View {
        Text("Next").foregroundStyle(.white).bold().padding().frame(maxWidth: .infinity).background(.greenClr).clipShape(.rect(cornerRadius: 10))
    }
}


struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "arrow.left").foregroundStyle(.white).bold().padding().frame(maxWidth: 100).background(.greenClr.opacity(0.3)).clipShape(.rect(cornerRadius: 10))
            }
        }
    }
}
