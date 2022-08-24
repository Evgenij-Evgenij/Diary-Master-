//
//  TabBar.swift
//  Dairy master
//
//  Created by Евгений Воронов on 12.08.2022.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var tabBarItem: TabBarItem
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
               // Spacer()
                barButton(image: "calendar icon3",
                          item: .calendar,
                          name: TabBarItem.calendar.title)
                Spacer()
                
                barButton(image: "clients icon2",
                          item: .client,
                          name: TabBarItem.client.title)
                Spacer()
                
                Button {
                    //
                } label: {
                    Image("icon plus")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.height - 830, height: UIScreen.main.bounds.height - 830)
                        .padding(10)
                }
                .background(.yellow)
                .clipShape(Circle())
                .offset(y: -40)

                Spacer()
                barButton(image: "services1", item: .services, name: TabBarItem.services.title)
                Spacer()
                
                barButton(image: "settings1", item: .settings, name: TabBarItem.settings.title)
                 Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, -10)
            .background(.gray.opacity(0.5))
        }
    }
    @ViewBuilder
    private func barButton(image: String,
                           item: TabBarItem,
                           name: String) -> some View {
        Button  {
            withAnimation(.easeInOut) {
                tabBarItem = item
            }
        } label: {
            VStack {
                Image(image)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.height - 865, height: UIScreen.main.bounds.height - 865)
                
                Text(LocalizedStringKey(name))
                    .font(.system(size: 12))
                    .foregroundColor(.black)
            }
            .foregroundColor(tabBarItem == item ? .red : .black)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(tabBarItem: .constant(.calendar))
    }
}
