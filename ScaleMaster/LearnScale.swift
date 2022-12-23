//
//  LearnScale.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/23/22.
//


import SwiftUI
import AVFoundation

struct LearnScale: View {
    
    @EnvironmentObject var storage: AppInfoStorage
    
    var scale: scale
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var timerValue: Double = 0
    @State private var scaleAudio: AVAudioPlayer?
    @State private var position: Double = 0
    var body: some View {
        VStack {
            Text(scale.name)
            Text(timerValue.formatted())
            Text("current position: \(position.formatted())")
            Button("hi") {
                
                do {
                    let path = Bundle.main.path(forResource: "\(scale.name)\(scale.octaves)\(storage.selectedInstrument)AudioSlowed", ofType: "mp3")
                    
                    if let path = path {
                        let url = URL(fileURLWithPath: path)
                        scaleAudio = try AVAudioPlayer(contentsOf: url)
                        scaleAudio?.play()
                        
                    } else {
                        
                    }
                } catch {
                    // couldn't load file :(
                }
            }
        }
        .onReceive(timer) { time in
            if let scaleAudio = scaleAudio {
                if scaleAudio.currentTime > ((position * 3) + 3) {
                    position += 1
                    
                }
                timerValue += 0.1
                
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




