//
//  ContentView.swift
//  SwiftlyColour
//
//  Created by Hariom Palkar on 09/12/20.
//

import SwiftUI


struct ContentView: View {
    @State var state = false
    @State private var showPicker = false
    var body: some View {
     
        
        VStack {
            Button(action: { self.showPicker = true}){
                Image("share")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                
            }
            .background(SharingsPicker(isPresented: $showPicker, sharingItems: ["Hey check out this cool MacOS app for converting colors"]))
            
            HStack(alignment: .center, spacing: 20){
                Text("HEX")
                Toggle("", isOn: $state)
                    .toggleStyle(SwitchToggleStyle())
                Text("RGB")
            }
            
            if state == true {
                RGBtoColorView()
            }
            else {
                ConverterView()
            }
            
        }
        .padding()
        .frame(minWidth: 480, maxWidth: .infinity, minHeight: 480, maxHeight: .infinity, alignment: .center)
        .edgesIgnoringSafeArea(.all)
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
