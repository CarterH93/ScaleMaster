//
//  ScaleViewerDetailView.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/19/22.
//

import SwiftUI
import AVFoundation




struct ScaleViewerDetailView: View {
    
    func getRealScale() -> scale? {
        for retrievedScale in AppInfoStorage.allScales {
            if retrievedScale.name == scale {
                if retrievedScale.octaves == octave {
                    return retrievedScale
                }
            }
        }
        return nil
    }
    
    @State private var showingFingeringsImage = false
    @State private var octave: Int
    
    @State private var scaleAudio: AVAudioPlayer?
    @State private var play = false
   
    @State private var position = 0
    @EnvironmentObject var storage: AppInfoStorage
    
    var scale: String?
    
    
    init(scale: String?) {
        self.scale = scale
        
        _octave = State(initialValue: 0)
        
    }

    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                /*
                LinearGradient(gradient: Gradient(colors: [.white, .white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                 */
                Color(.white)
                    .ignoresSafeArea()
                if scale != nil {
                    
                    VStack {
                        VStack {
                            /*
                            Text("\(scale) Scale")
                                .font(.system(size: geo.size.height > geo.size.width ? geo.size.height * 0.07: geo.size.height * 0.06))
                                .padding()
                                .background(.quaternary)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                            */
                            if let tempscale = getRealScale() {
                                Scale_View(scale: tempscale, geoH: geo.size.height / 1.6, geoW: geo.size.width / 1.6)
                            }
                        }
                        .frame(alignment: .center)
                        .padding()
                        
                        if let scale = getRealScale() {
                            ScaleViewerWithNoteMarkings(scale: scale, showingFingerings: showingFingeringsImage, play: $play,  resetPositionTo0AfterComplete: true, position: $position)
                        }
                        
                        
                    }
                    
                    
                    
                } else {
                    Text("Please Select a Scale")
                    
                }
            }
        }
        
        .onChange(of: scale) { newValue in
            play = false
            
            if let Wrappedscale = newValue {
                var tempStore: [Int] = AppInfoStorage.OctaveChoices(inputScale: Wrappedscale, instrument: storage.selectedInstrument)
               tempStore = tempStore.sorted(by: { $0 < $1 })
                octave = tempStore[0]
            } else {
                
                octave = 0
            }
        }
        .onChange(of: storage.selectedInstrument) { newValue in
            play = false
            if let Wrappedscale = scale {
                var tempStore: [Int] = AppInfoStorage.OctaveChoices(inputScale: Wrappedscale, instrument: storage.selectedInstrument)
               tempStore = tempStore.sorted(by: { $0 < $1 })
                octave = tempStore[0]
            } else {
                
                octave = 0
            }
        }
        
        .toolbar {
            if let scale = scale {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        //Show Fingerings
                        showingFingeringsImage.toggle()
                        
                    } label: {
                        
                        Text(showingFingeringsImage == true ? "Hide Fingerings" : "Show Fingerings")
                            .font(.title2)
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(.thinMaterial)
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                        
                        
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        if storage.useSlowedAudio == true {
                            storage.linkedSpeedIsFast = false
                        } else {
                            storage.linkedSpeedIsFast = true
                        }
                        //Play Audio
                        play.toggle()
                        
                        
                    } label: {
                        
                        Text(play == true ? "Stop Scale" : "Play Scale")
                            .font(.title2)
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(.thinMaterial)
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                        
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        if let tempscale = getRealScale() {
                            storage.linkedSpeedIsFast = false
                            storage.presentedViews.append(tempscale)
                            play = false
                        }
                        
                        
                    } label: {
                        
                        Text("Learn")
                            .font(.title2)
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(.blue.opacity(0.3))
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                        
                    }
                }
                ToolbarItem(placement: .bottomBar) { Spacer() }
                
                if octave > 0 {
                    ToolbarItem(placement: .bottomBar) {
                        
                        
                        Menu {
                            Picker("\(octave) \(octave == 1 ? "Octave" : "Octaves")", selection: $octave) {
                                ForEach(AppInfoStorage.OctaveChoices(inputScale: scale, instrument: storage.selectedInstrument), id: \.self)  { octave in
                                    Text("\(octave) \(octave == 1 ? "Octave" : "Octaves")")
                                }
                            }
                            
                            
                        } label: {
                            Text("\(octave) \(octave == 1 ? "Octave" : "Octaves")")
                                .font(.title2)
                                .foregroundColor(.secondary)
                                .padding(8)
                                .background(.thinMaterial)
                                .clipShape(Rectangle())
                                .border(.black.opacity(0.5))
                        }
                        
        
                    }
                }
                
                
                ToolbarItem(placement: .bottomBar) {
                    
                    
                    Menu {
                        Picker(storage.selectedInstrument.rawValue, selection: $storage.selectedInstrument) {
                            ForEach(AppInfoStorage.instrumentSelections, id: \.self)  { instrument in
                                Text(instrument.rawValue)
                            }
                        }
                        
                        
                    } label: {
                        Text(storage.selectedInstrument.rawValue)
                            .font(.title2)
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(.thinMaterial)
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                    }
                }
                
                
                
            }
        }
    }
}

struct ScaleViewerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ScaleViewerDetailView(scale: "A Major")
                .environmentObject(AppInfoStorage())
        }
       
    }
}
