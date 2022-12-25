//
//  LearnScale.swift
//  ScaleViewerWithNoteMarkings
//
//  Created by Carter Hawkins on 12/23/22.
//


import SwiftUI
import AVFoundation

struct ScaleViewerWithNoteMarkings: View {
    
    @EnvironmentObject var storage: AppInfoStorage
    
    var scale: scale
    
    var stopAtPosition: Int?
    
    var howFast: Double {
        if storage.linkedSpeedIsFast == true {
            return 0.5
        } else {
            return 1
        }
    }
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var scaleAudio: AVAudioPlayer?
    @Binding var position: Int
    var showingFingerings: Bool
    @Binding var play: Bool
    
    var body: some View {
        VStack {
          //  Text(scale.name)
            ScaleWithMarking(scale: scale, showingFingeringsImage: showingFingerings, position: position)
                
            
                
           // Text("current position: \(position.formatted())")
           
                
               
            
        }
        .onChange(of: play) { Inputplay in
            if Inputplay == true {
                position = 0
                do {
                    let path = Bundle.main.path(forResource: "\(scale.name)\(scale.octaves)\(storage.selectedInstrument)Audio\(howFast == 0.5 ? "" : "Slowed")", ofType: "mp3")
                    
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
            
            
            if let stopAtPosition = stopAtPosition { if stopAtPosition == position {
                scaleAudio?.stop()
                play = false
                return
            }}
            
            if scale.octaves > 0 {
                //Do settings for Normal Scales
                
                if let scaleAudio = scaleAudio {
                     if scaleAudio.currentTime < (0.9 * howFast) {
                       
                        position = 1
                    }
                    
                    if scaleAudio.currentTime >= (0.9 * howFast) && scaleAudio.currentTime < (4.3 * howFast)  {
                        if scaleAudio.currentTime > ((Double(position) * (0.5 * howFast)) + (0.5 * howFast)) {
                            
                            position += 1
                            
                        }
                    }
                    
                    if scaleAudio.currentTime >= (4.3 * howFast) && scaleAudio.currentTime < (4.9 * howFast) {
                        
                        position = 8
                    }
                    
                    if scaleAudio.currentTime >= (4.9 * howFast) && scaleAudio.currentTime < (8.3 * howFast)  {
                        if scaleAudio.currentTime > ((Double(position) * (0.5 * howFast)) + (1 * howFast)) {
                            
                            position += 1
                            
                        }
                    }
                    
                    
                    if scaleAudio.currentTime >= (8.3 * howFast) && scaleAudio.currentTime < (8.9 * howFast) {
                        
                        position = 15
                    }
                    
                    if scaleAudio.currentTime >= (8.9 * howFast) && scaleAudio.currentTime < (12 * howFast)  {
                        if scaleAudio.currentTime > ((Double(position) * (0.5 * howFast)) + (1.5 * howFast)) {
                            
                            position += 1
                            
                        }
                    }
                    
                    if scaleAudio.currentTime >= (12 * howFast) && scaleAudio.currentTime < (13 * howFast) {
                        
                        position = 22
                    }
                    
                    if scaleAudio.currentTime >= (13 * howFast) && scaleAudio.currentTime < (16 * howFast) {
                        if scaleAudio.currentTime > ((Double(position) * (0.5 * howFast)) + (2 * howFast)) {
                            
                            position += 1
                            
                        }
                    }
                    
                    if scaleAudio.currentTime >= (16 * howFast) {
                        
                        position = 29
                        play = false
                    }
                    
                    
                    
                }
                
                
                
            } else if scale.octaves == 0 {
                //Do settings for chromatic scale
                
                if let scaleAudio = scaleAudio {
                    if scaleAudio.currentTime == 0 {
                        
                        position = 0
                        
                        
                    } else if scaleAudio.currentTime < (0.6 * howFast) {
                        
                        position = 1
                    } else if position < 59 {
                        if scaleAudio.currentTime > (Double(position) * (0.6 * howFast)) {
                            
                            position += 1
                            
                        } else  if position > 58 {
                        
                            position = 59
                            play = false
                        }
                        
                    }
                }
            }
        }
    }
    
}








