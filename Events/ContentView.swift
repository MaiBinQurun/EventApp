//
//  ContentView.swift
//  Events
//
//  Created by mai abdullah qurun on 16/06/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @State var selection: String = "الكل"
    let filterOptions: [String] = [
        "اخرى", "دينية", "اجتماعية", "تعليمية", "الكل"
    ]
    
    var body: some View {
        
        ZStack {
            
            Color.theme.backGround
                .edgesIgnoringSafeArea(.all)
                
            VStack {
                Picker(
                    selection: $selection,
                    label: Text("Picker"),
                    content: {
                        ForEach( filterOptions.indices) { Index in
                            Text(filterOptions[Index])
                                .tag(filterOptions[Index])
                        }
                    })
                .pickerStyle(SegmentedPickerStyle())
                .background(Color("ElementColor"))
                
                Spacer()
                Button {
                    
                } label: {
                    Text("اضافة حدث")
                        .bold()
                        .font(.title2)
                   //     .frame(width: 300, height: 50)
                        .foregroundColor(.white)
//                        .background(Color("ElementColor"))
//                        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .padding(.horizontal)
                        .padding()
                        .background(
                        Capsule()
                            .stroke(Color.theme.element, lineWidth: 2.0)
                        
                        
                        )
                }
            
            }
        }
        
        
        
        
        
        
        
    }
    
    
}
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
                
            }
        }
        
        
 
   

