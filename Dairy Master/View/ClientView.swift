//
//  ClientView.swift
//  Dairy master
//
//  Created by Евгений Воронов on 15.08.2022.
//

import SwiftUI

struct ClientView: View {
   // @Binding var clientView: TabBarItem
    var body: some View {
        Text(LocalizedStringKey("clients"))
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        ClientView()
    }
}
