//
//  ContentView.swift
//  Moonshot
//
//  Created by Dathan Wong on 6/6/20.
//  Copyright © 2020 Dathan Wong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var missionView = true
    
    var body: some View {
        NavigationView{
            Group{
                if missionView{
                    List(missions){
                        mission in
                        NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)){
                            Image(mission.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 44, height: 44)
                            VStack(alignment: .leading) {
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.formattedLaunchDate)
                            }
                        }
                    }
                }else{
                    List(astronauts){ astronaut in
                        NavigationLink(destination: AstronautView(astronaut: astronaut, missions: self.missions)) {
                            Image(astronaut.id)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 44, height: 44)
                            VStack(alignment: .leading) {
                                Text(astronaut.name)
                                    .font(.headline)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Moonshot")
                .navigationBarItems(trailing: Button(action: {
                    self.missionView.toggle()
                }, label: {
                    Text(self.missionView ? "Astronauts" : "Missions")
                }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
