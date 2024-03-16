//
//  ContentView.swift
//  Grids_D4
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/16.
//

import SwiftUI

struct ContentView: View {
    
    @State var sheetVisible = false
    @State var selectedImage = ""
    
    var photos = [
        
        "gallery1", "gallery2", "gallery3", "gallery4",
        "gallery5", "gallery6", "gallery7", "gallery8",
        "gallery9", "gallery10", "gallery11"
    
    ]
    
    
    var body: some View {
        VStack{
            Text("Sushi MENU")
                .foregroundColor(.brown)
                .font(.largeTitle)
                .bold()
            ScrollView{
                LazyVGrid(columns: [GridItem(), GridItem()]){
                    ForEach(photos, id: \.self){pic in
                        Image(pic)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .onTapGesture {
                                selectedImage = pic
                                sheetVisible = true
                            }
                        
                    }
                }
            }
        }
        .sheet(isPresented: $sheetVisible, content: {
            PhotoView(sheetVisible: $sheetVisible, selectedImage: $selectedImage)
        })
    }
}

#Preview {
    ContentView()
}
