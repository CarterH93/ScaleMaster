//
//  ScaleViewerDetailView.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/19/22.
//

import SwiftUI

struct ScaleViewerDetailView: View {
    
    var scale: String?
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            if let scale = scale {
                Text("\(scale) Scale")
            } else {
                Text("Please Select a Scale")
            }
        }
    }
}

struct ScaleViewerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleViewerDetailView()
    }
}
