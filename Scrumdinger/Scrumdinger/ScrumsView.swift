//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by lei zhang on 2021/8/3.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        List{
            //通过标题来识别scrums，但是，如果用户试图创建一个与现有标题相同的新的scrum
            ForEach(scrums){ scrum in
                //TODO color
                NavigationLink(destination:DetailView(scrum: scrum)){
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.color)
            }
        }
        .navigationTitle("Daily Scrums")
        .navigationBarItems(trailing: Button(action: {}) {
            Image(systemName: "plus")
        })
    }
    
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ScrumsView(scrums: DailyScrum.data)
        }

    }
}
