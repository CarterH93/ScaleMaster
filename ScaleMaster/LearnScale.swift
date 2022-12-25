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
    @State private var stopAt: Int?
  
    var body: some View {
        VStack {
            ScaleViewerWithNoteMarkings(scale: scale, stopAtPosition: stopAt, showingFingerings: showingFingerings, play: $play)
            Button("Showing Fingerings") {
                showingFingerings.toggle()
            }
            Button("Play \(play.description)") {
                
                play.toggle()
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
