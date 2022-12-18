//
//  ScaleViewer.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/18/22.
//

import SwiftUI

struct ScaleViewer: View {
    @EnvironmentObject var storage: AppInfoStorage
    
    var body: some View {
        VStack {
            Text("Scale Viewer")
            Text("For \(storage.selectedInstrument.rawValue)")
            
            Button("Change Instrument") {
                storage.presentedViews.append("settings")
            }
        }
    }
}

struct ScaleViewer_Previews: PreviewProvider {
    static var previews: some View {
        ScaleViewer()
            .environmentObject(AppInfoStorage())
    }
}
