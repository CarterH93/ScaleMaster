//
//  Main.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/17/22.
//

import SwiftUI
import AVFoundation

struct Main: View {
    
    @State private var scales: [scale]
    @State private var showingAlert = false
    @State private var showingNoScaleAlert = false
    @State private var showingScaleImage = false
    @State private var showingFingeringsImage = false
    
    @State private var play = false
    
    @State private var scaleAudio: AVAudioPlayer?
    
    @State private var position = 0
    
    init(scales: [scale]) {
        _scales = State(initialValue: scales)
    }
    
  @EnvironmentObject var storage: AppInfoStorage
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.white, .white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    //Put actual code here
                    if scales.count > 0 {
                        Scale_View(scale: scales[0], geoH: geo.size.height, geoW: geo.size.width)
                            .padding(.bottom)
                    }
                    
                    if showingScaleImage {
                        ScaleViewerWithNoteMarkings(scale: scales[0], showingFingerings: showingFingeringsImage, play: $play, resetPositionTo0AfterComplete: true, position: $position)
                    }
                        
                    
                    
                }
                
            }
            .onAppear {
                if scales.count == 0 {
                    showingNoScaleAlert = true
                }
            }
            .alert("You Have Played Through All the Scales", isPresented: $showingAlert) {
                Button("Ok") {
                    resetButtons()
                    storage.presentedViews.removeLast(storage.presentedViews.count)
                }
            }
            .alert("You have no scales selected to play", isPresented: $showingNoScaleAlert) {
                Button("Home") {
                    resetButtons()
                    storage.presentedViews.removeLast(storage.presentedViews.count)
                    
                }
                Button("Settings") {
                    resetButtons()
                    storage.presentedViews.append("settings")
                }
            } message: {
                Text("Please select scales to play within the settings menu.")
            }
            
            .toolbar {
                if storage.previousScale != nil {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            //Put code for going to previous scale
                            resetButtons()
                            scales.insert(storage.previousScale!, at: 0)
                            storage.previousScale = nil
                        } label: {
                            
                            Text("Previous Scale")
                                .font(.largeTitle)
                                .foregroundColor(.secondary)
                                .padding(8)
                                .background(.thinMaterial)
                                .clipShape(Rectangle())
                                .border(.black.opacity(0.5))
                            
                        }
                        
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        storage.linkedSpeedIsFast = false
                        storage.presentedViews.append(scales[0])
                        scaleAudio?.stop()
                    } label: {
                        
                        Text("Learn")
                            .font(.largeTitle)
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(.blue.opacity(0.3))
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                        
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        resetButtons()
                        storage.presentedViews.removeLast(storage.presentedViews.count)
                        storage.previousScale = nil
                    } label: {
                        
                        Text("Home 🏠")
                            .font(.largeTitle)
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(.thinMaterial)
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                        
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        //Show Scale
                        showingScaleImage.toggle()
                        if !showingScaleImage {
                            showingFingeringsImage = false
                        }
                    } label: {
                        
                        Text(showingScaleImage == true ? "Hide Scale" : "Show Scale")
                            .font(.title3)
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(.thinMaterial)
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                        
                    }
                }
                if showingScaleImage {
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            //Show Fingerings
                            showingFingeringsImage.toggle()
                        } label: {
                            
                            Text(showingFingeringsImage == true ? "Hide Fingerings" : "Show Fingerings")
                                .font(.title3)
                                .foregroundColor(.secondary)
                                .padding(8)
                                .background(.thinMaterial)
                                .clipShape(Rectangle())
                                .border(.black.opacity(0.5))
                            
                        }
                    }
                
                
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            //Play Audio
                            if storage.useSlowedAudio == true {
                                storage.linkedSpeedIsFast = false
                            } else {
                                storage.linkedSpeedIsFast = true
                            }
                            play.toggle()
                            
                        } label: {
                            
                            Text(play == true ? "Stop Scale" : "Play Scale")
                                .font(.title3)
                                .foregroundColor(.secondary)
                                .padding(8)
                                .background(.thinMaterial)
                                .clipShape(Rectangle())
                                .border(.black.opacity(0.5))
                            
                        }
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Spacer()
                }
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            //Go to Next Scale
                            resetButtons()
                            if scales.count > 1 {
                                storage.previousScale = scales[0]
                                scales.remove(at: 0)
                            } else {
                                showingAlert = true
                                storage.previousScale = nil
                            }
                            
                        } label: {
                            
                            Text("Next Scale")
                                .font(.largeTitle)
                                .foregroundColor(.accentColor)
                                .padding(10)
                                .background(.green)
                                .clipShape(Rectangle())
                                .border(.black.opacity(0.5))
                            
                        }
                    }
                    
                }
                .navigationTitle("Play This Scale!")
                .navigationBarTitleDisplayMode(.large)
                .navigationBarBackButtonHidden(true)
            }
        }
    
    func resetButtons() {
        play = false
        showingScaleImage = false
        showingFingeringsImage = false
        scaleAudio?.stop()
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
    NavigationStack {
            Main(scales: AppInfoStorage.allScales)
                .environmentObject(AppInfoStorage())
        }
    }
}
