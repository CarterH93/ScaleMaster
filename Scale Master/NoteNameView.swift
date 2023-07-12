//
//  NoteNameView.swift
//  Scale Master
//
//  Created by Carter Hawkins on 7/12/23.
//

import SwiftUI



//taken from https://prafullkumar77.medium.com/swiftui-how-to-build-text-with-subscript-and-super-script-5c215e078b93


struct SubSuperScriptText: View {
    let inputString: String
    let bodyFont: Font
    let subScriptFont: Font
    let baseLine: CGFloat
    var body: some View {
        var string = inputString
        var text = Text("")
        while let validIndex = string.firstIndex(where: { (char) -> Bool in  return (char == "_" || char == "^") }) {
            
            let mySubstringP1 = string[..<validIndex]
            var mySubstringP2 = string[validIndex...]
            text = text + Text(mySubstringP1).font(bodyFont) //add normal string to text
            //subscript
            
            if mySubstringP2.count < 3 { //no possible  sub or super
                return text + Text(mySubstringP2).font(bodyFont)
            }
            
            var subscriptType = mySubstringP2.first!
            mySubstringP2 = mySubstringP2.dropFirst() ///remove ^ _
            
            var subScriptString = ""
            if mySubstringP2.first != "{"  { //not a subscript
                subScriptString.append(String(subscriptType))
                subscriptType = Character(" ") //no subscript
            } else if let subStringIndex = mySubstringP2.firstIndex(where: { (char) -> Bool in  return (char == "}") })  {
                mySubstringP2 = mySubstringP2.dropFirst() ///remove {
                subScriptString = String(mySubstringP2[..<subStringIndex])
                mySubstringP2 = mySubstringP2[subStringIndex...].dropFirst() //remove }
            } else {
                return Text("") //not balance string
            }
            
            switch subscriptType {
            case "^":
                text = text + Text(subScriptString)
                    .font(subScriptFont)
                                  .baselineOffset(baseLine)
            case "_":
                text = text + Text(subScriptString)
                    .font(subScriptFont)
                                  .baselineOffset(-1 * baseLine)
            default:
                text = text + Text(subScriptString).font(bodyFont)
            }
            string = String(mySubstringP2)
        }
        text = text + Text(string).font(bodyFont)
        return text
    }
}





struct NoteNameView: View {
    
    var note: String
    
    var octave: Int
    
    var body: some View {
        GeometryReader { geo in
            SubSuperScriptText(inputString: "\(note)_{\(octave)}", bodyFont: .system(size: geo.size.width * 0.5), subScriptFont: .system(size: geo.size.width * 0.2), baseLine: 6.0)
                .frame(width: geo.size.width, height: geo.size.width)
                .frame(width: geo.size.width, height: geo.size.height)
            
        }
    }
}

struct NoteNameView_Previews: PreviewProvider {
    static var previews: some View {
        NoteNameView(note: "Ab", octave: 3)
    }
}
