//
//  MissionView.swift
//  Moonshot
//
//  Created by Cameron Warner on 11/24/23.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let crew: [CrewMember]
    let mission: Mission
    
    init(astronauts: [String: Astronaut], mission: Mission) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding()
                
                Text(mission.formattedLaunchDate)
                
                VStack(alignment: .leading){
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(crew, id: \.role) { crewMember in
                                NavigationLink {
                                    AstronautView(astronaut: crewMember.astronaut)
                                } label: {
                                    HStack {
                                        Image(crewMember.astronaut.id)
                                            .resizable()
                                            .frame(width: 104, height: 72)
                                            .clipShape(.capsule)
                                            .overlay(
                                                Capsule()
                                                    .strokeBorder(.white, lineWidth: 1)
                                            )
                                        VStack(alignment: .leading) {
                                            Text(crewMember.astronaut.name)
                                                .foregroundStyle(.white)
                                                .font(.headline)
                                            Text(crewMember.role)
                                                .foregroundStyle(.white.opacity(0.5))
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
               
                   
                                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                 
                    Text(mission.description)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.lightBackground)
                        .padding(.vertical)
                }
                .padding(.horizontal)
            }// End of VStack
            .padding(.bottom)
        } // End of ScrollView
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(astronauts: astronauts, mission: missions[0])
        .preferredColorScheme(.dark)
}
