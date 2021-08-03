//
//  DetailView.swift
//  Scrumdinger
//
//  Created by lei zhang on 2021/8/3.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    @State private var isPresented = false
    var body: some View {
        List{
            Section(header: Text("Meeting Info")){
                NavigationLink(
                    destination: MeetingView()){
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                        .accessibilityLabel(Text("Start Meeting"))
                }
                HStack{
                    Label("Length", systemImage: "clock").accessibilityLabel("Length")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                HStack{
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill").foregroundColor(scrum.color)
                }.accessibilityElement(children: .ignore)
            }
            Section(header: Text("Attendess")){
                ForEach(scrum.attendees, id: \.self){attendee in
                    Label(attendee, systemImage:"person")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text(attendee))
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing: Button("Edit"){
            isPresented = true
        })
        .navigationTitle("Design")
        .fullScreenCover(isPresented: $isPresented, content: {
            NavigationView{
                EditView()
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Cancle"){
                        isPresented = false
                    }, trailing: Button("Done"){
                        isPresented = true
                    })
            }
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(scrum: DailyScrum.data[0])
        }
    }
}
