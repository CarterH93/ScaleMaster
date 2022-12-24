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
    
    @State private var scaleAudio: AVAudioPlayer?
    @State private var position: Int = 0
    var body: some View {
        VStack {
            Text(scale.name)
            ScaleWithMarking(scale: scale, showingFingeringsImage: true, position: position)
                
                
            Text("current position: \(position.formatted())")
            Button("play") {
                
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
            
            if scale.octaves > 0 {
                //Do settings for Normal Scales
                
                if let scaleAudio = scaleAudio {
                    if scaleAudio.currentTime == 0 {
                        position = 0
                        
                    } else if scaleAudio.currentTime < 0.9 {
                        position = 1
                    }
                    
                    if scaleAudio.currentTime >= 0.9 && scaleAudio.currentTime < 3.9  {
                        if scaleAudio.currentTime > ((Double(position) * 0.5) + 0.5) {
                            position += 1
                            
                        }
                    }
                    
                    if scaleAudio.currentTime >= 3.9 && scaleAudio.currentTime < 4.9 {
                        position = 8
                    }
                    
                    if scaleAudio.currentTime >= 4.9 && scaleAudio.currentTime < 7.9  {
                        if scaleAudio.currentTime > ((Double(position) * 0.5) + 1) {
                            position += 1
                            
                        }
                    }
                    
                    
                    if scaleAudio.currentTime >= 7.9 && scaleAudio.currentTime < 8.9 {
                        position = 15
                    }
                    
                    if scaleAudio.currentTime >= 8.9 && scaleAudio.currentTime < 12  {
                        if scaleAudio.currentTime > ((Double(position) * 0.5) + 1.5) {
                            position += 1
                            
                        }
                    }
                    
                    if scaleAudio.currentTime >= 12 && scaleAudio.currentTime < 13 {
                        position = 22
                    }
                    
                    if scaleAudio.currentTime >= 13 && scaleAudio.currentTime < 16  {
                        if scaleAudio.currentTime > ((Double(position) * 0.5) + 2) {
                            position += 1
                            
                        }
                    }
                    
                    if scaleAudio.currentTime >= 16 {
                        position = 29
                    }
                    
                    
                    
                }
                
                
                
            } else if scale.octaves == 0 {
                //Do settings for chromatic scale
                
                if let scaleAudio = scaleAudio {
                    if scaleAudio.currentTime == 0 {
                        position = 0
                        
                        
                    } else if scaleAudio.currentTime < 0.6 {
                        position = 1
                    } else if position < 59 {
                        if scaleAudio.currentTime > (Double(position) * 0.6) {
                            position += 1
                            
                        } else  if position > 58 {
                            position = 59
                        }
                        
                    }
                }
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




