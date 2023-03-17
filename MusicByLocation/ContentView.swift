//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Luke Vereker on 01/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var state = StateController()
    
    var body: some View {
        VStack {
            List(state.artistsByLocation) { item in
                Text(item)
            }
                .padding(15)
            Spacer()
            Button("Find Music", action: {
                state.findMusic()
            })
        }.onAppear(perform: {
            state.requestAccessToLocationData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
