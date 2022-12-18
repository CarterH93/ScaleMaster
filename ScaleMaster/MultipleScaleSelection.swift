//
//  MultipleScaleSelection.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/17/22.
//

import SwiftUI

struct MultipleScaleSelection: View {
    @EnvironmentObject var storage: AppInfoStorage
    
    var scales = AppInfoStorage.allScales
    @State var selectedRows = Set<UUID>()
    
    
    var body: some View {
       
            List(selection: $selectedRows) {
                ForEach(scales) { scale in
                    ScaleRow(scale: scale, selectedItems: $selectedRows)
                }
            }
            //.listStyle(.inset)
            .onAppear {
                for i in storage.selectedScales {
                    for a in AppInfoStorage.allScales {
                        if i.name == a.name {
                            selectedRows.insert(a.id)
                        }
                    }
                    
                }
            }
    }

}

struct MultipleScaleSelection_Previews: PreviewProvider {
    static var previews: some View {
        MultipleScaleSelection()
            .environmentObject(AppInfoStorage())
    }
}
