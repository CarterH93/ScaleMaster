//
//  Scale View.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/18/22.
//

import SwiftUI

struct Scale_View: View {
    
    var scale: scale
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text(scale.name)
                    .font(.system(size: geo.size.height > geo.size.width ? geo.size.width * 0.07: geo.size.height * 0.07))
                    .padding(15)
                    .background(.quaternary)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
    }
}

struct Scale_View_Previews: PreviewProvider {
    static var previews: some View {
        Scale_View(scale: scale(id: 999, name: "Test", octaves: 2))
    }
}
