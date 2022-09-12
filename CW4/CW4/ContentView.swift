//
//  ContentView.swift
//  CW4
//
//  Created by Fatima Garashi on 12/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State var newItem : String = ""
    @State var items : [String] = []
    @State var selectedItem : Int = 0
    
    var body: some View {
        
        VStack{
            List(items, id: \.self) { item in
                HStack{
                    Image(item)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70 )
                    Text(item)
                }.onTapGesture {
                    selectedItem = items.firstIndex(where: { $0.hasPrefix(item) }) ?? 0
                }
                }
            .padding()
            HStack{
                
                TextField("new item", text: $newItem)
                    .padding()
                Button(action:{
                    items.append(newItem)
                }){
                    Image(systemName: "plus.app.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.green)
                }
                Button(action:{
                    items.remove(at: selectedItem)
                    
                    //let itemIndex = items.firstIndex(where: {$0 == id(id:\.self)})
                   
                }){
                    Image(systemName: "minus.square.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.red)
                }
                
            
                Button(action:{
                    items.append(items.randomElement() ?? "")

                }){
                    Image(systemName: "questionmark.app.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                }

                       
                
            }
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
