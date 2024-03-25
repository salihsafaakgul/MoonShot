//
//  MissionView.swift
//  MoonShot
//
//  Created by salih on 19.03.2024.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember{
        let role:String
        let astronaut:Astronauts
    }
    
    let crew:[CrewMember]
    let mission:Mission
    var body: some View {
    NavigationStack{
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal){width, axes in
                            width * 0.6
                        }
                    
                    VStack(alignment: .leading) {
                        
                        Rectangle().frame(height: 2)
                            .foregroundStyle(.lightBackground)
                            .padding(.vertical)
                        
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        Rectangle().frame(height: 2)
                            .foregroundStyle(.lightBackground)
                            .padding(.vertical)
                        
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(crew, id: \.role) { CrewMember in
                                NavigationLink {
                                    AstronautView(astronauts: CrewMember.astronaut)
                                } label: {
                                    HStack {
                                        Image(CrewMember.astronaut.id).resizable()
                                            .frame(width: 104,height: 72).clipShape(.capsule)
                                            .overlay(Capsule().strokeBorder(.white,lineWidth: 1))
                                        VStack(alignment: .leading) {
                                            Text(CrewMember.astronaut.name).foregroundStyle(.white)
                                                .font(.headline)
                                            
                                            Text(CrewMember.role).foregroundStyle(.secondary)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        }
    }
    init(mission:Mission, astronauts: [String: Astronauts]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            }
            else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions:[Mission] = Bundle.main.decode("missions.json")
    let astronauts:[String: Astronauts] = Bundle.main.decode("astronauts.json")
    return MissionView(mission: missions[0],astronauts: astronauts).preferredColorScheme(.dark)
}
