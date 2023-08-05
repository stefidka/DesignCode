//
//  Home.swift
//  DesignCode
//
//  Created by Stefka Vacheva on 5.08.23.
//

import SwiftUI

struct Home: View {
    @State var showProfile = false
    
    var body: some View {
        ZStack {
            Color(.lightGray)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        self.showProfile.toggle()
                    }) {
                        Image("Avatar")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Spacer()
            }
            .padding(.top, 44)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: showProfile ? -450 : 0)
            .rotation3DEffect(.degrees(showProfile ? -10 : 0), axis: (x: 10.0, y: 0, z: 0))
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: showProfile)
            .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .offset(y: showProfile ? 0 : 600)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: showProfile)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
