//
//  ScaleViewer.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/18/22.
//

import SwiftUI



struct ScaleViewer: View {
    @EnvironmentObject var storage: AppInfoStorage
    
    @State private var selectedScale: String?
    
    @State private var SplitViewVisible: NavigationSplitViewVisibility = .doubleColumn
    
    var body: some View {
        
        GeometryReader { geo in
            NavigationSplitView(columnVisibility: $SplitViewVisible) {
                    List(selection: $selectedScale) {
                        ForEach(AppInfoStorage.allScaleNames, id: \.self) { scale in
                                Text(scale)
                                    .padding(15)
                                    .foregroundColor(.black)
                                    .font(.system(size: geo.size.height > geo.size.width ? geo.size.width * 0.06: geo.size.height * 0.06))
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
                                    .padding(.bottom, 5)
                            }
                        }
                
                } detail: {
                    ScaleViewerDetailView(scale: selectedScale)
                }
                
                
                
                
        }
        
        .navigationTitle("Scale Viewer")
        .onChange(of: selectedScale) { _ in
            if UIDevice.current.userInterfaceIdiom == .phone || UIDevice.current.orientation.isPortrait {
                SplitViewVisible = .detailOnly
            }
            
            
        }
    }
}

struct ScaleViewer_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ScaleViewer()
                .environmentObject(AppInfoStorage())
        }
    }
}
