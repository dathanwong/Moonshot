//
//  AstronautView.swift
//  Moonshot
//
//  Created by Dathan Wong on 6/7/20.
//  Copyright © 2020 Dathan Wong. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]
    
    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        var matches = [Mission]()
        for mission in missions{
            for crew in mission.crew{
                if crew.name == self.astronaut.id{
                    matches.append(mission)
                }
            }
        }
        self.missions = matches
    }
    
    var body: some View {
        GeometryReader{geometry in
            ScrollView(.vertical){
                VStack{
                    Image(self.astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width)
                    ForEach(self.missions, id: \.id){
                        mission in
                        Text("\(mission.displayName)")
                    }
                    Text(self.astronaut.description)
                    .padding()
                    .layoutPriority(1)
                }
            }
        }.navigationBarTitle(Text(astronaut.name))
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts:[Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions:[Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[14], missions: missions)
    }
}
