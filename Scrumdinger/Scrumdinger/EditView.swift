//
//  EditView.swift
//  Scrumdinger
//
//  Created by lei zhang on 2021/8/3.
//

import SwiftUI

struct EditView: View {
    //SwiftUI会观察@State属性，并在属性发生变化时自动重绘视图的主体。这种行为确保了用户界面在用户操作屏幕上的控件时保持最新状态。
    @State private var scrumData: DailyScrum.Data = DailyScrum.Data()
    @State private var newAttendee = ""
    var body: some View {
        List{
            Section(header: Text("Meeting Info")){
                TextField("Title", text: $scrumData.title)
                HStack{
                    Slider(value: $scrumData.lengthInMinutes, in: 5...30, step: 1.0){
                        //TODO Text的作用？
                        Text("length")
                    }.accessibilityValue(Text("\(Int(scrumData.lengthInMinutes)) minutes"))
                    Spacer()
                    Text("\(Int(scrumData.lengthInMinutes)) minutes").accessibilityHidden(true)
                }
                ColorPicker("Color", selection: $scrumData.color).accessibilityLabel(Text("Color Picker"))
            }
           
            Section(header: Text("Attendees")){
                ForEach(scrumData.attendees, id:\.self){ attendee in
                    Text(attendee)
                }
                .onDelete(perform: { indexSet in
                    scrumData.attendees.remove(atOffsets: indexSet)
                })
            }
            HStack{
                TextField("New Attendee", text: $newAttendee)
                Button(action:{
                    withAnimation{
                        scrumData.attendees.append(newAttendee)
                        newAttendee = ""
                    }
                }){
                    Image(systemName: "plus.circle.fill").accessibilityLabel(Text("Add attendee"))
                }
                .disabled(newAttendee.isEmpty)
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
