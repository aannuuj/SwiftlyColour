//
//  RGBtoColorView.swift
//  SwiftlyColour
//
//  Created by Hariom Palkar on 09/12/20.
//

import SwiftUI
import Combine

struct RGBtoColorView: View {
    @State var red : String = ""
    @State var green : String = ""
    @State var blue : String = ""
    @State var alpha : String = ""
    
    var body: some View {
        ZStack{
            let output = RGBToString(r: red, g: green, b: blue, a: alpha)
        VStack{
            HStack (alignment: .center, spacing: 10){
                TextField("25", text: $red)
                    .onReceive(Just(self.red)) { inputValue in
                        if inputValue.count > 3 {
                            self.red.removeLast()
                        }
                    }
                    .textFieldStyle(PlainTextFieldStyle())
                    .background(RoundedRectangle(cornerRadius: 2).stroke(Color.white.opacity(0.7)))

                TextField("55", text: $green)
                    .onReceive(Just(self.green)) { inputValue in
                        if inputValue.count > 3 {
                            self.green.removeLast()
                        }
                    }
                    .textFieldStyle(PlainTextFieldStyle())
                    .background(RoundedRectangle(cornerRadius: 2).stroke(Color.white.opacity(0.7)))

                TextField("56", text: $blue)
                    .onReceive(Just(self.blue)) { inputValue in
                        if inputValue.count > 3 {
                            self.blue.removeLast()
                        }
                    }
                    .textFieldStyle(PlainTextFieldStyle())
                    .background(RoundedRectangle(cornerRadius: 2).stroke(Color.white.opacity(0.7)))

                TextField("1.0", text: $alpha)
                    .onReceive(Just(self.alpha)) { inputValue in
                        if inputValue.count > 7 {
                            self.alpha.removeLast()
                        }
                    }
                    .textFieldStyle(PlainTextFieldStyle())
                    .background(RoundedRectangle(cornerRadius: 2).stroke(Color.white.opacity(0.7)))

            }
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
        .background(Color(RGBToColor(r: red, g: green, b: blue, a: alpha)))
    }
}

struct RGBtoColorView_Previews: PreviewProvider {
    static var previews: some View {
        RGBtoColorView()
    }
}
