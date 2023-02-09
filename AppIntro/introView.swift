//
//  introView.swift
//  SwiftUIAll
//
//  Created by Mohamed Makhlouf Ahmed on 08/02/2023.
//

import SwiftUI

struct introView: View {
    @AppStorage("Signed_in") var userSignedIn : Bool = false
    var body: some View {
        ZStack{
            
            Color.purple
                .ignoresSafeArea()
            
            if userSignedIn{
                profileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            }else{
                OnBoardingView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            }
        }
    }
}

struct introView_Previews: PreviewProvider {
    static var previews: some View {
        introView()
    }
}
