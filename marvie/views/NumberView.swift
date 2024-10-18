//
//  NumberView.swift
//  marvie
//
//  Created by Abdal Shah on 15/10/2024.
//

import SwiftUI

struct NumberView: View {
    
        // Add more countries as needed
    
    @State private var phoneNumber: String = ""
 

    
    // List of options for the dropdown

    var body: some View {
        ZStack(alignment: .center ) {
            Color(.background).ignoresSafeArea()
            VStack(alignment: .leading) {
                HeadingText(title: "Sign Up").padding(.horizontal)
                SubHeading(title: "to start working").padding(.horizontal).padding(.bottom,50)
                HStack(alignment:.top) {
                    
                    CountrySelector()
                    
                    ZStack{
                        TextField("Full Name", text: $phoneNumber,prompt: Text("123 456 78").foregroundStyle(Color("greyColor")))
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black.opacity(0.2)).padding(.top,55)
                        
                    }
                    
                    
                    
                }.padding(.horizontal)
                
                HStack {
                    BackButton()
                    NextButton()
                }.padding(.top, 50).padding(.horizontal,20)
            }
           
           
        }
                
            
        }
      
        
    }


#Preview {
    NumberView()
}


struct CountrySelector: View {
    let countries: [Country] = [
        Country(name: "United States", flag: "🇺🇸", code: "+1"),
        Country(name: "United Kingdom", flag: "🇬🇧", code: "+44"),
        Country(name: "Canada", flag: "🇨🇦", code: "+1"),
        Country(name: "Australia", flag: "🇦🇺", code: "+61"),
        Country(name: "Germany", flag: "🇩🇪", code: "+49"),
        Country(name: "France", flag: "🇫🇷", code: "+33"),
        Country(name: "Japan", flag: "🇯🇵", code: "+81"),
        Country(name: "India", flag: "🇮🇳", code: "+91"),
        ]
    @State private var selectedCountry: Country =  Country(name: "India", flag: "🇮🇳", code: "+91")
    var body: some View {
        Menu {
            // Create a list of countries in the menu
            ForEach(countries) { country in
                Button(action: {
                    // Update selected country when tapped
                    selectedCountry = country
                }) {
                    // Display the flag and code in the menu
                    Text("\(country.flag) \(country.code)")
                }
            }
        } label: {
            // Customize the picker button with an image and selected country flag
            HStack {
                Text("\(selectedCountry.flag ) \(selectedCountry.code )").padding(.horizontal,10)
                Image(systemName:  "arrow.down") // Custom image (can be replaced with your own)
                    .resizable().padding(.trailing,5)
                    .frame(width: 15, height: 10) // Customize the size of the image
                
            }.frame(width: 110,height: 60).foregroundStyle(.white)
                
                .background(.greenClr.opacity(0.5)) // Custom background color
                .cornerRadius(8)
        }
    }
}
