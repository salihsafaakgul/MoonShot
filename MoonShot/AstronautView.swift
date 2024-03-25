//
//  AstronautView.swift
//  MoonShot
//
//  Created by salih on 19.03.2024.
//

import SwiftUI

struct AstronautView: View {
    let astronauts:Astronauts
    var body: some View {
        ScrollView {
            VStack {
                Image(astronauts.id)
                    .resizable()
                    .scaledToFit()
                Text(astronauts.description)
                    .padding()
            }
            .background(.darkBackground)
            .navigationTitle(astronauts.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let astronauts:[String: Astronauts] = Bundle.main.decode("astronauts.json")
    return AstronautView(astronauts: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
}
