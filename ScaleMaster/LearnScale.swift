//
//  LearnScale.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/24/22.
//

import SwiftUI

struct LearnScale: View {
    var scale: scale
    @State private var showingFingerings = true
    @State private var play = false
    @State private var stopAt: Int? = 8
    @State private var position: Int = 0
    var body: some View {
        VStack {
            Text("position: \(position)")
            ScaleViewerWithNoteMarkings(scale: scale, stopAtPosition: stopAt, position: $position, showingFingerings: showingFingerings, play: $play)
            Button("Showing Fingerings") {
                showingFingerings.toggle()
            }
            Button("Play \(play.description)") {
                
                play = true
            }
            
        }
    }
}

struct LearnScale_Previews: PreviewProvider {
    static var previews: some View {
        LearnScale(scale: AppInfoStorage.allScales[0])
            .environmentObject(AppInfoStorage())
    }
}
