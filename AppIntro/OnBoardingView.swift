//
//  OnBoardingView.swift
//  SwiftUIAll
//
//  Created by Mohamed Makhlouf Ahmed on 08/02/2023.
//

import SwiftUI

struct OnBoardingView: View {
    @State var name : String = ""
    @State var age : Double = 25
    @State var gender : String = ""
    @State var showAlert : Bool = false
    @State var alertTitle : String = ""
    let transition : AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    //AppStorage
    @AppStorage("Signed_in") var userSignedIn : Bool = false
    @AppStorage("userName") var userName : String?
    @AppStorage("userAge") var userAage : Int?
    @AppStorage("userGender") var  userGender : String?


    @State var onBoardingState : Int = 0
    var body: some View {
        ZStack{
            
            switch onBoardingState {
            case 0:
                welcomeScreen
                    .transition(transition)
            case 1:
                addNameScreen
                    .transition(transition)

            case 2:
                addAgeScreen
                    .transition(transition)

            case 3:
                addGenderView
                    .transition(transition)

            default:
                Text("sd")
            }
                VStack{
                    Spacer()
                    buttonView
                }
            
            .padding(30)
        }
        .alert(isPresented: $showAlert) {
            return Alert(title: Text(alertTitle))
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
            .background(Color.purple)
    }
}

extension OnBoardingView{
    private var buttonView : some View {
        Text(onBoardingState == 0 ? "SIGN UP" : onBoardingState == 3 ? "FINISH" : "NEXT" )
            .foregroundColor(.purple)
            .font(.headline)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
            handleButtonPressed()
            }
    }
    
    private var welcomeScreen : some View {
        VStack(spacing: 40.0 ){
            Spacer()
            Image( systemName:"heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200 , height: 200)
                .foregroundColor(.white)
            
            
            Text("Find your match.")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundColor(.white)
                    ,alignment: .bottom
                )
            
            Text("this application is bla bla bla bvla vavmsdkvkdv dsfjksdfj skdfs aahsds dffgfsaas jfjdnklm .")
                .foregroundColor(.white)
               
                .fontWeight(.medium)
            Spacer()
            Spacer()

        }
        .multilineTextAlignment(.center)
    }
    
    private var addNameScreen : some View {
        VStack(spacing: 40.0 ){
           Spacer()

            Text("What's your name?")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.semibold)
             
             TextField("Type your name here...", text: $name)
                .fontWeight(.medium)
                .padding()
                .padding(.horizontal)
                .background(Color.white.cornerRadius(10))
            Spacer()
            Spacer()


        }
        .padding(20)
    }
    
    private var addAgeScreen : some View {
        VStack(spacing: 40.0 ){
           Spacer()

            Text("What's your Age?")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.semibold)
             
            Text("\( String(format: "%.2f", age))")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.semibold)
             
            Slider(value: $age, in: 18...60 , step: 1)
                .accentColor(.white)
                
            Spacer()
            Spacer()


        }
        .padding(20)
    }
    
    
    private var addGenderView : some View {
        VStack(spacing: 40.0 ){
           Spacer()

            Text("What's your Gender?")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.semibold)
        
            Picker(selection: $gender, content: {
                Text("male").tag("male")
                Text("female").tag("female")
            }, label: {
                Text("Select your gender")
                    .foregroundColor(.white)
            })
            .pickerStyle(.menu)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white.cornerRadius(10))
           
            .background(Color.gray)
            Spacer()
            Spacer()


        }
        .padding(20)
    }
}

//MARK: FUNCTIONS
extension OnBoardingView {
    
    func handleButtonPressed(){
        
        //CECK INPUTS
        switch onBoardingState {
        case 1 :
            guard name.count >= 3 else {
               showAlert(title: "Your name should be at least 3 characters")
                return
            }
        default : break
        }
        //GO TO NEXT
        if onBoardingState == 3{
            signIn()
        }else{ withAnimation(.spring()) {onBoardingState += 1 } }
    }
    
    func showAlert(title : String){
        alertTitle = title
        showAlert.toggle()
    }
    
    func signIn(){
        userName = name
        userAage = Int(age)
        userGender = gender
        withAnimation {
            userSignedIn = true
        }
        
    }
}
