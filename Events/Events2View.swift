//
//  Events2View.swift
//  Events
//
//  Created by mai abdullah qurun on 17/06/1444 AH.
//

import SwiftUI


struct EventModel: Identifiable {
    let id = UUID().uuidString
    let eventName: String
    let eventType: String
    let eventDate: Int
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [EventModel] = []
    @Published var filteredArray: [EventModel] = []
    @Published var mappedArray: [String] = []
   
    init () {
        
        updateFilteredArrey()
    }
}
func updateFilteredArrey() {
   
    @State var dataArray: [EventModel] = []
    @State var filteredArray: [EventModel] = []
    
    filteredArray = dataArray.sorted { (event1, event2 ) -> Bool in
        return event1.eventDate < event2.eventDate
    }
    
//   filteredArray = dataArray.sorted{ $0.evevtData < $1.eventDate }
//    
//    filteredArray = dataArray.filter({ (event) -> String in
//        return event.eventType
//    })
}
struct Events2View: View {
 
    var GE:[EventModel] = [
        EventModel (eventName: "حفل التخرج", eventType: "تعليمية", eventDate: 134),
        EventModel (eventName: "العيد", eventType: "دينية", eventDate: 64),
        EventModel (eventName: "الاختبارات النهائية", eventType: "تعليمية", eventDate: 130),
       
        EventModel (eventName: "حفل عيد ميلادي", eventType: "اجتماعية", eventDate: 13)
    ]
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
    
        ZStack {
            
            Color.theme.backGround
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 30) {
                    ForEach(GE, id: \.id) { event in
                        VStack(alignment: .leading) {
                            Text(event.eventName)
                                .font(.headline)
                                .bold()
                            HStack {
                                Text("\(event.eventType)")
                                Spacer()
                                Text("\(event.eventDate)")
                                Image(systemName: "flame.fill")
                                
                            }
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("ElementColor")).cornerRadius(20)
                    .padding(.horizontal)
                }
                Spacer()
                Spacer()
//                            Button {
//
//                            } label: {
//                            Text("اضافة حدث")
//                            .bold()
//                            .font(.title2)
//                            .foregroundColor(.white)
//
//                            .padding(.horizontal)
//                            .padding()
//                            .background(
//                            Capsule()
//                                .stroke(Color.white, lineWidth: 2.0)
//                            )
//                            }
            }
            
            
        }
        
    }
    
    
    struct Events2View_Previews: PreviewProvider {
        static var previews: some View {
            Events2View()
        }
    }
}
