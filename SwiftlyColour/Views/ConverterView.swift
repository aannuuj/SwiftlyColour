//
//  ConverterView.swift
//  SwiftlyColour
//
//  Created by Hariom Palkar on 09/12/20.
//

import SwiftUI
import Combine

struct ConverterView: View {
    
    @State var text : String = ""
    
    var body: some View {
       
        // add share this app icon
        // add dev name and website
        // design implementation
        
        ZStack{
            let output = hexToString(hexString: text)
            VStack(alignment: .center){
                HStack(alignment: .center, spacing: 5){
                    Text("#")
                    TextField("152644", text: $text)
                        .fixedSize()
                        .onReceive(Just(self.text)) { inputValue in
                            if inputValue.count > 7 {
                                self.text.removeLast()
                            }
                        }
                }
                .textFieldStyle(PlainTextFieldStyle())
                .background(RoundedRectangle(cornerRadius: 2).stroke(Color.white.opacity(0.7)))
                .padding(.all)
                HStack(alignment: .center, spacing: 5){
                    Text("Swift :")
                    Text(output)
                    Button(action: {copyString(textToCopy: output)}){
                        Image("copy")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                    }
                }
                Spacer()
            }
        }
        .background(Color(hexToColor(hexString: text)))
    }
}

struct ConverterView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView()
    }
}
