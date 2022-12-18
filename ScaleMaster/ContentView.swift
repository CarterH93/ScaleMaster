//
//  ContentView.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tubaRotate = 0.0
   
    
    @EnvironmentObject var storage: AppInfoStorage
    
    
    var body: some View {
        NavigationStack(path: $storage.presentedViews) {
            GeometryReader { geo in
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color("NiceOrange"), .white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            .ignoresSafeArea()
                        
                        Image("Music Scales")
                            .resizable()
                            .opacity(0.04)
                        
                        
                    
                    VStack(spacing: 15) {
                        Text("Scale Master 🎶")
                            .fontWeight(.semibold)
                            .font(.system(size: geo.size.height > geo.size.width ? geo.size.width * 0.1: geo.size.height * 0.1))
                            .padding(5)
                            .foregroundColor(.black)
                        
                            .background(.quaternary)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding(.top)
                        
                        Image("Tuba")
                            .resizable()
                            .scaledToFit()
                            .rotation3DEffect(.degrees(tubaRotate), axis: (x: 0, y: 1, z: 0))
                            .onTapGesture {
                                withAnimation(.interpolatingSpring(stiffness: 60, damping: 6)) {
                                    tubaRotate += 360
                                }
                            }
                        NavigationLink(value: "main") {
                            
                            Text("Start")
                                .font(.system(size: geo.size.height > geo.size.width ? geo.size.width * 0.07: geo.size.height * 0.07))
                                .padding(15)
                                .background(.quaternary)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                        
                        
                        NavigationLink(value: "settings") {
                            
                            Text("Settings")
                                .font(.system(size: geo.size.height > geo.size.width ? geo.size.width * 0.07: geo.size.height * 0.07))
                                .foregroundColor(.secondary)
                                .padding(8)
                                .background(.thinMaterial)
                                .clipShape(Rectangle())
                                .border(.black.opacity(0.5))
                            
                        }
                        
                        
                        
                    }
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            
                            Spacer()
                        }
                        ToolbarItem(placement: .bottomBar) {
                            
                            Text("Created by Carter Hawkins")
                                .foregroundColor(.accentColor)
                               
                        }
                    }
                            
                }
            }
            .navigationDestination(for: String.self) { selectedView in
                if selectedView == "main" {
                    Main()
                      
                } else if selectedView == "settings" {
                    Settings()
                      
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppInfoStorage())
    }
}


