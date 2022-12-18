//
//  ScaleSelectionList.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/18/22.
//

import SwiftUI

struct ScaleSelectionList: View {
    
@EnvironmentObject var storage: AppInfoStorage
    
    @State private var scales: [scale] 
    
    
    
    init(selectedScales: [scale]) {
        //Magic code that loads saved scales
        var tempStore: [scale] = AppInfoStorage.allScales
        
        for i in 0...(tempStore.count - 1) {
            for a in selectedScales {
                if tempStore[i].id == a.id {
                    tempStore[i] = a
                }
            }
        }
        
        
        _scales = State(initialValue: tempStore)
    }
    
    
    var body: some View {
        Form {
                    ForEach(scales.indices,  id:\.self) { index in
                        HStack {
                            HStack {
                                Image(
                                    systemName:
                                        scales[index].isSelected ? "checkmark.circle" : "circle"
                                )
                                
                                Text(scales[index].name)
                            }
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            scales[index].isSelected.toggle()
                            //Updates changes to selectedscales
                            update()
                            
                        }
                        }
                    }
    }
    func update() {
        var selectedTemp: [scale] = []
        for i in scales {
            if i.isSelected {
                selectedTemp.append(i)
            }
        }
        storage.selectedScales = selectedTemp
       
    }
}




struct ScaleSelectionList_Previews: PreviewProvider {
    static var previews: some View {
        ScaleSelectionList(selectedScales: [scale(id: 999, name: "Test", octaves: 3)])
            .environmentObject(AppInfoStorage())
    }
}
