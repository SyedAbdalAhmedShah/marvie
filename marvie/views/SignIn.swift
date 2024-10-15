//
//  ContentView.swift
//  marvie
//
//  Created by Abdal Shah on 10/10/2024.
//

import SwiftUI

struct SignIn: View {
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    
    var body: some View {
        NavigationView(content:  {
            ZStack(alignment: .center, content:  {
                Color(.background).ignoresSafeArea()
                VStack(alignment: .leading, content:  {
                    
                    Spacer(minLength: 30)
                    HeadingText(title: "Welcome")
                    SubHeading(title: "Sign in to continue")
                    
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
                    
                    
                    NavigationLink(destination: Signup().navigationBarBackButtonHidden(true)) {
                        Text("Sign up")
                            .foregroundStyle(.white)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.greenClr.opacity(0.5))
                            .clipShape(.rect(cornerRadius: 10))
                    }.padding(.top,30)

                    
                 
                    Spacer(minLength: 30)
                    
                }).padding()
                
            })
        }
    )}
}

#Preview {
    SignIn()
}




struct HeadingText: View {
    let title: String
    var body: some View {
        Text(title).font(.largeTitle).bold().foregroundStyle(.white).padding(.top, 30 ).padding(.bottom,1)
    }
}

struct SubHeading: View {
    let title: String
    var body: some View {
        Text(title).font(.system(size: 20)).foregroundStyle(.grey)
    }
}


struct CountryCode: View {
    @State private var selectedCountry: Country?
    @State private var searchText = ""
    
    let countries: [Country] = [
        Country(name: "United States", flag: "🇺🇸", code: "+1"),
        Country(name: "United Kingdom", flag: "🇬🇧", code: "+44"),
        Country(name: "Canada", flag: "🇨🇦", code: "+1"),
        Country(name: "Australia", flag: "🇦🇺", code: "+61"),
        Country(name: "Germany", flag: "🇩🇪", code: "+49"),
        Country(name: "France", flag: "🇫🇷", code: "+33"),
        Country(name: "Japan", flag: "🇯🇵", code: "+81"),
        Country(name: "India", flag: "🇮🇳", code: "+91"),
        // Add more countries as needed
    ]
    var filteredCountries: [Country] {
        if searchText.isEmpty {
            return countries
        } else {
            return countries.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    var body: some View {
        NavigationView {
            List(filteredCountries) { country in
                HStack {
                    Text(country.flag)
                        .font(.largeTitle)
                    Text(country.name)
                    Spacer()
                    Text(country.code)
                        .foregroundColor(.gray)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedCountry = country
                }
            }
            .navigationTitle("Select Country")
            .searchable(text: $searchText, prompt: "Search countries")
        }
        .alert(item: $selectedCountry) { country in
            Alert(title: Text("Selected Country"),
                  message: Text("\(country.name) (\(country.code))"),
                  dismissButton: .default(Text("OK")))
        }
    }
}

