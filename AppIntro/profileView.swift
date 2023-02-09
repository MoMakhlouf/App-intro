//
//  profileView.swift
//  SwiftUIAll
//
//  Created by Mohamed Makhlouf Ahmed on 08/02/2023.
//

import SwiftUI

struct profileView: View {
    @AppStorage("Signed_in") var userSignedIn : Bool = false
    @AppStorage("userName") var userName : String?
    @AppStorage("userAge") var userAage : Int?
    @AppStorage("userGender") var  userGender : String?
    
    var body: some View {
        VStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200 , height: 200)
                .foregroundColor(.gray)
            
            Text(userName ?? "Name")
            Text("\(userAage ?? 0)" )
            Text(userGender ?? "not found")
            
            Text("SIGNOUT")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal,40)
                .background(Color.purple.cornerRadius(15))
                .onTapGesture {
                    signOut()
                }
            
        }
        .padding()
        .padding( 50)
        .background(Color.white)
        .shadow(radius: 20)
        
    }
    
    func signOut(){
        userAage = nil
        userName = nil
        userGender = nil
        withAnimation {
            userSignedIn = false
        }
       
    }
}

struct profileView_Previews: PreviewProvider {
    static var previews: some View {
        profileView()
          //  .background(Color.purple)

    }
}
