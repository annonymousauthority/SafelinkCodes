//
//  OnboardingScreens.swift
//  SafelinkCodes
//
//  Created by Augustine Francis on 02/09/2022.
//

import SwiftUI


enum AuthenticationOption{
   case login,createAccount, navigation
}
struct OnboardingScreens: View {

    @State var onboardingScreenIndex: Int = 0
    @State var tutorialsScreen: Bool = true
    @State var navigationOption: AuthenticationOption = .navigation
    var body: some View {
        if(tutorialsScreen){
            SwitchingViews(onboardingScreenIndex: $onboardingScreenIndex, tutorialsScreen: $tutorialsScreen)
        }else{
            self.selectView()
        }
    }

    @ViewBuilder func selectView() -> some View {
        switch navigationOption{
        case .navigation: NavigationScreen(navigationOption: $navigationOption)
        case .login: Login(navigationOption: $navigationOption)
        case .createAccount: CreateAccount(navigationOption: $navigationOption)
        }
    }
}

struct OnboardingScreens_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Login:View{
    @State var username: String = ""
    @State var password: String = ""
    @Binding var navigationOption: AuthenticationOption
    var body: some View{
        ZStack{
            StyledBackground(backgroundImage: "user-listening")
            VStack(alignment:.center, spacing: 25){
                StyledHeader(headerText: "User Login", taglineText: "Get back in to keep updated \nwith what’s happening")

                StyledTextInput(label: "Username", obscureText: false, textVariable: $username)
                StyledTextInput(label: "Password", obscureText: true, textVariable: $password)
                HStack{
                    Spacer()
                    Button(action: {
                        navigationOption = AuthenticationOption.navigation
                    }) {
                        Text("Recover Account")
                            .font(.caption.bold())
                    }
                }
                .padding(.horizontal)
                StyledButton(text: "Login", bgColor: Color.blue, textColor: .white) {

                }
                .padding(.horizontal)

                HStack {
                    Text("Don't have an account?")
                        .font(.caption.bold())
                        .foregroundColor(.white)
                    Button(action: {
                        navigationOption = AuthenticationOption.createAccount
                    }) {
                        Text("Create one")
                            .font(.caption.bold())
                    }
                }
            }
        }
        .animation(.interactiveSpring(), value: true)
    }
}

struct CreateAccount: View{
    @State var username: String = ""
    @State var password: String = ""
    @State var email: String = ""
    @Binding var navigationOption: AuthenticationOption
    var body: some View{
        ZStack{
            StyledBackground(backgroundImage: "user-listening")
            VStack(alignment:.center, spacing: 25){
                StyledHeader(headerText: "Create Account", taglineText: "Everyday individuals can now book \ntheir favorite artist")

                StyledTextInput(label: "Email", obscureText: false, textVariable: $email)
                StyledTextInput(label: "Username", obscureText: false, textVariable: $username)
                StyledTextInput(label: "Password", obscureText: true, textVariable: $password)
                StyledButton(text: "Create Account", bgColor: Color.blue, textColor: .white) {

                }
                .padding(.horizontal)

                HStack {
                    Text("Already have an account?")
                        .font(.caption.bold())
                        .foregroundColor(.white)
                    Button(action: {
                        navigationOption = AuthenticationOption.login
                    }) {
                        Text("Sign in")
                            .font(.caption.bold())
                    }
                }
            }
        }
        .animation(.interactiveSpring(), value: true)
    }

}

struct SwitchingViews:View{
    @State private var backgroundImageNames:[String]=["artist-1", "artist-2", "artist-3"]
    @Binding var onboardingScreenIndex: Int
    @Binding var tutorialsScreen: Bool
    var body: some View{
        switch onboardingScreenIndex{
        case 0:
            ZStack{
                BackgroundHolder(imageName: backgroundImageNames[0])
                VStack(alignment:.center){
                    Spacer()
                    Text("Connect with and easily \nbook your favorite artist.")
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    HStack{
                        Spacer()
                        Button(action: {
                            withAnimation(.easeIn(duration: 1)){
                                self.onboardingScreenIndex = 1
                            }
                        }) {
                            Image("right_direction")
                                .resizable()
                                .frame(width: 65, height: 65)
                        }
                    }
                    .padding(45)
                }
            }
            .animation(.interactiveSpring(), value: true)
        case 1: ZStack{
            BackgroundHolder(imageName: backgroundImageNames[1])
            VStack(alignment:.center){
                Spacer()
                Text("Saw that art you love? \nWe probaly have that \nartist available.")
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                HStack{
                    Button(action: {
                        withAnimation(.easeOut(duration: 1)){
                            self.onboardingScreenIndex -= 1
                        }
                    }) {
                        Image("left_direction")
                            .resizable()
                            .frame(width: 65, height: 65)
                    }
                    Spacer()
                    Button(action: {
                        withAnimation(.easeIn(duration: 1)){
                            self.onboardingScreenIndex += 1
                        }
                    }) {
                        Image("right_direction")
                            .resizable()
                            .frame(width: 65, height: 65)
                    }
                }
                .padding(45)
            }
        }
        .animation(.interactiveSpring(), value: true)
        case 2: ZStack{
            BackgroundHolder(imageName: backgroundImageNames[2])
            VStack(alignment:.center){
                Spacer()
                Text("Get the best of \nentertainment service.")
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                HStack{
                    Button(action: {
                        withAnimation(.easeOut(duration: 1)){
                            self.onboardingScreenIndex -= 1
                        }
                    }) {
                        Image("left_direction")
                            .resizable()
                            .frame(width: 65, height: 65)
                    }
                    Spacer()
                    Button(action: {
                        withAnimation(.easeIn(duration: 1)){
                            self.tutorialsScreen = false
                        }
                    }) {
                        Image("right_direction")
                            .resizable()
                            .frame(width: 65, height: 65)
                    }
                }
                .padding(45)
            }
        }
        .animation(.interactiveSpring(), value: true)
        default:  ZStack{
            BackgroundHolder(imageName: backgroundImageNames[0])
            VStack(alignment:.center){
                Spacer()
                Text("Connect with and easily \nbook your favorite artist.")
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                HStack{
                    Spacer()
                    Button(action: {
                        withAnimation(.easeIn(duration: 1)){
                            self.onboardingScreenIndex += 1
                        }
                    }) {
                        Image("right_direction")
                            .resizable()
                            .frame(width: 65, height: 65)
                    }
                }
                .padding(45)
            }
        }
        .animation(.interactiveSpring(), value: true)
        }
    }
}


struct BackgroundHolder:View{
    @State var imageName: String
    var body: some View{
        ZStack{
            StyledBackground(backgroundImage: imageName)
        }
    }
}


struct NavigationScreen:View{
    @Binding var navigationOption: AuthenticationOption
    var body: some View{
        ZStack{
            StyledBackground(backgroundImage: "user-listening-v2")

            VStack(alignment:.leading){
                Image("looking_glass_logo")
                    .resizable()
                    .frame(width: 50, height: 45)
                Spacer()
                Text("Welcome to \nLooking Glass Production")
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                Spacer()

                VStack(alignment:.center, spacing: 15){
                    StyledButton(text: "Create Account", bgColor: Color.blue, textColor: .white) {
                        navigationOption = AuthenticationOption.createAccount
                    }
                    StyledButton(text: "Login", bgColor: Color.black, textColor: .white) {
                        navigationOption = AuthenticationOption.login
                    }
                    StyledButton(text: "Sign in with Apple", bgColor: Color.white, textColor: .black, imageText: "apple-logo") {
                        navigationOption = AuthenticationOption.login
                    }
                }
            }
            .padding(.horizontal, 25)
        }
    }
}

struct StyledButton: View {
    @State var text: String
    @State var bgColor: Color
    @State var textColor: Color
    @State var imageText: String = ""
    @State var clickAction: ()->()
    var body: some View {
        Button(action: clickAction) {
            Image(imageText)
                .resizable()
                .frame(width: 25, height: 25)
            Text(text)
                .font(.title3.bold())
                .foregroundColor(textColor)
        }
        .padding(.horizontal,25)
        .padding(.vertical,15)
        .frame(height: 50)
        .frame(maxWidth:.infinity)
        .background(bgColor)
        .cornerRadius(12)
    }
}



struct StyledTextInput: View{
    @State var label: String
    @State var obscureText: Bool
    @Binding var textVariable: String
    var body: some View{
        VStack(alignment:.leading){
            Text(label)
                .font(.callout.bold())
                .foregroundColor(.white)
            TextField(
                text: $textVariable,
                prompt: Text( "Enter \(label)")
            ){}
                .frame(maxWidth:.infinity)
                .frame(height:50)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
                .background(Color.gray)
                .cornerRadius(12)
        }
        .padding(.horizontal)
    }
}
struct StyledSecureInput: View{
    @State var label: String
    @State var obscureText: Bool
    @Binding var textVariable: String
    var body: some View{
        VStack(alignment:.leading){
            Text(label)
                .font(.callout.bold())
                .foregroundColor(.white)
            SecureField(
                text: $textVariable,
                prompt: Text( "Enter \(label)")
            ){}
            .frame(maxWidth:.infinity)
            .frame(height:50)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
            .background(Color.gray)
            .cornerRadius(12)
        }
        .padding(.horizontal)
    }
}


struct StyledBackground: View {
    @State var backgroundImage:String
    var body: some View {
        Color.black
            .opacity(0.6)
            .background(
                Image(backgroundImage)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode:.fill)
            )
            .edgesIgnoringSafeArea(.all)
    }
}

struct StyledHeader: View{
    @State var headerText: String
    @State var taglineText:String
    var body: some View{
        VStack(alignment:.center, spacing: 8){
            Image("looking_glass_logo")
                .resizable()
                .frame(width: 50, height: 40)
            Text(headerText)
                .font(.title.bold())
                .foregroundColor(.white)
            Text(taglineText)
                .font(.body.bold())
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
    }
}
