//
//  NoteFingeringView.swift
//  Scale Master
//
//  Created by Carter Hawkins on 7/12/23.
//

import SwiftUI


struct Valves: View {
    var body: some View {
        GeometryReader { geo in
            HStack {
                Text("Valve")
            }
            .frame(width: geo.size.width, height: geo.size.width)
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct Slides: View {
    var body: some View {
        
        Text("Position")
    }
}




struct NoteFingeringView: View {
    
    @EnvironmentObject var storage: AppInfoStorage
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.gray)
            
            if storage.selectedInstrument == .Tuba || storage.selectedInstrument == .BaritoneBC {
                Valves()
            } else {
                Slides()
            }
        }
        
    }
}

struct NoteFingeringView_Previews: PreviewProvider {
    static var previews: some View {
        NoteFingeringView()
            .environmentObject(AppInfoStorage())
    }
}
