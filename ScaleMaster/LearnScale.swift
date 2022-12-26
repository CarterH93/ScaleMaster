//
//  LearnScale.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/24/22.
//

import SwiftUI

struct LearnScale: View {
    
    @EnvironmentObject var storage: AppInfoStorage
    
    
    var scale: scale
    @State private var showingFingerings = true
    @State private var play = false
    @State private var stopAt: Int?
    @State private var repeatSections: Int = 3
    @State private var timesPlayed = 0
    @State private var position = 0
    @State private var section = 1
    @State private var showingAlert = false
  
    func reset() {
        play = false
        position = 0
        timesPlayed = 0
        section = 1
    }
    
    func reachedEndOfLearn() {
        showingAlert = true
    }
    
    func PlayTheScale() {
        // code for playing the scale
        if timesPlayed >= repeatSections {
            section += 1
            timesPlayed = 0
        }
        
        switch scale.octaves {
        case 1:
            //do code
            stopAt = 4 * section
            if section > 4 {
                reachedEndOfLearn()
                return
            }
            break
            
        case 2:
            if section > 3 {
                stopAt = 4 * section - 1
                if section > 4 {
                    stopAt? -= 1
                }
                if section > 8 {
                    reachedEndOfLearn()
                    return
                }
                break
            } else {
                stopAt = 4 * section
            }
        case 0:
            //put code for chromatic scale
            break
        default:
            stopAt = 4 * section
            break
        }
    
        play = true
        timesPlayed += 1
        
        
        
    }
    
    
    var body: some View {
        GeometryReader { geo in
            
            VStack {
                Scale_View(scale: scale, geoH: geo.size.height / 2.5, geoW: geo.size.width / 1.5)
                ScaleViewerWithNoteMarkings(scale: scale, stopAtPosition: stopAt, showingFingerings: showingFingerings, play: $play, resetPositionTo0AfterComplete: false, position: $position)
                
                VStack {
                    Text("Section \(section)   Play \(timesPlayed)/\(repeatSections)")
                        .font(.system(size: geo.size.height > geo.size.width ? geo.size.height * 0.1: geo.size.height * 0.08))
                }
                .padding()
                .background(.quaternary)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .padding()
                
                
                
            }
        }
            .alert("You finished learn!", isPresented: $showingAlert) {
                Button("Back") {
                    storage.presentedViews.removeLast(1)
                    
                }
                Button("Learn Again") {
                    reset()
                }
            } message: {
                Text("Please select an option.")
            }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                
                
                
                Button {
                    reset()
                    //reset learn
                    
                    
                    
                } label: {
                    Text("Restart Learn")
                        .font(.title2)
                        .foregroundColor(.secondary)
                        .padding()
                        .background(.thinMaterial)
                        .clipShape(Rectangle())
                        .border(.black.opacity(0.5))
                }
            }
            
            ToolbarItem(placement: .bottomBar) {
                
                
                
                Button {
                    showingFingerings.toggle()
                    
                    
                    
                    
                } label: {
                    Text(showingFingerings == true ? "Hide Fingerings" : "Show Fingerings")
                        .font(.title2)
                        .foregroundColor(.secondary)
                        .padding()
                        .background(.thinMaterial)
                        .clipShape(Rectangle())
                        .border(.black.opacity(0.5))
                }
            }

            
            ToolbarItem(placement: .bottomBar) { Spacer() }
            
            ToolbarItem(placement: .bottomBar) {
                Button {
                    //Repeat
                    if timesPlayed != 0 {
                        timesPlayed -= 1
                        PlayTheScale()
                    }
                    
                } label: {
                    HStack {
                        Text("Repeat")
                        Image(systemName: "repeat")
                    }
                        .font(.largeTitle)
                        .foregroundColor(.accentColor)
                        .padding()
                        .background(.orange)
                        .clipShape(Rectangle())
                        .border(.black.opacity(0.5))
                    
                }.disabled(play == true || timesPlayed == 0 ? true : false)
                
                
            }
            
            
            ToolbarItem(placement: .bottomBar) {
                Button {
                    //Go to Next Scale
                    PlayTheScale()
                } label: {
                    
                    Text("Continue")
                        .font(.largeTitle)
                        .foregroundColor(.accentColor)
                        .padding()
                        .background(.green)
                        .clipShape(Rectangle())
                        .border(.black.opacity(0.5))
                       
                    
                }.disabled(play == true ? true : false)
                
            }
           
            
            ToolbarItem(placement: .bottomBar) { Spacer() }
            
            ToolbarItem(placement: .bottomBar) {
                
                
                Menu {
                    Picker("\(repeatSections) \(repeatSections == 1 ? "Time" : "Times")", selection: $repeatSections) {
                        ForEach( 1...6, id: \.self)  { times in
                            Text("\(times) \(times == 1 ? "Time" : "Times")")
                        }
                    }
                    
                    
                } label: {
                    Text("\(repeatSections) \(repeatSections == 1 ? "Time" : "Times")")
                        .font(.title2)
                        .foregroundColor(.secondary)
                        .padding()
                        .background(.thinMaterial)
                        .clipShape(Rectangle())
                        .border(.black.opacity(0.5))
                }
                

            }
            
            
        }
    }
}

struct LearnScale_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LearnScale(scale: AppInfoStorage.allScales[12])
                .environmentObject(AppInfoStorage())
        }
    }
}
