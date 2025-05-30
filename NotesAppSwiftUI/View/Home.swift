//
//  Home.swift
//  NotesAppSwiftUI
//
//  Created by Developer on 29/05/25.
//

import SwiftUI

struct Home: View {
    
    @StateObject var model = ViewModel()
    
    var body: some View {
        Button(action: {
            model.show.toggle()
        }) {
            Text("+")
        }.sheet(isPresented: $model.show, content: {
            AddView(model: model)
        })
    }
}

#Preview {
    Home()
}
