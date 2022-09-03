//
//  SplashScreen.swift
//  SafelinkCodes
//
//  Created by Augustine Francis on 02/09/2022.
//

import SwiftUI

struct SplashScreen: View {
    @State private var showAnimations: [Bool] = Array(repeating: false, count: 5)
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()

            VStack(alignment:.center, spacing: 0){
                ZStack{
                    Circle()
                        .stroke(.white,lineWidth: 5)
                        .frame(width: 40, height: 40)
                        .overlay(Circle().frame(width: 20, height: 20).overlay(Rectangle().fill(.blue).frame(height:showAnimations[3] ? nil: 0).frame(maxHeight:.infinity, alignment: .top).padding(.bottom,8)))
                        .offset(x: showAnimations[0] ? -25 : 0)
                    Circle()
                        .stroke(.white, lineWidth: 5)
                        .frame(width: 40, height: 40)
                        .overlay(Circle().frame(width: 20, height: 20).overlay(Rectangle().fill(.blue).frame(height:showAnimations[3] ? nil: 0).frame(maxHeight:.infinity, alignment: .top).padding(.bottom,8)))
                        .offset(x: showAnimations[0] ? 25 : 0)
                    Circle()
                        .trim(from: 0.7, to: 1)
                        .stroke(lineWidth: 5)
                        .frame(width: 80, height: 80)
                        .rotationEffect(.degrees(-35))
                        .offset(y:5)
                        .opacity(showAnimations[1] ? 1 : 0)
                }
                .foregroundColor(.white)
                .padding(.bottom,0)
                Text("Looking Glass \n Production")
                    .font(.title3)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .opacity(showAnimations[2] ? 1 : 0)
                    .offset(x: showAnimations[2] ? 0: 55, y: -10)

            }
        }
        .onAppear {
            delaySequence()
        }
    }
    private func delaySequence(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.easeOut(duration: 1)){
                showAnimations[0].toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.easeIn(duration:1)){
                    showAnimations[1].toggle()
                }
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation(.easeIn(duration: 1)){
                    showAnimations[2].toggle()
                }

            }


            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                withAnimation(.easeIn(duration: 0.1)){
                    showAnimations[3].toggle()
                }

                withAnimation(.easeIn(duration: 0.1).delay(0.1)){
                    showAnimations[3].toggle()
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                withAnimation(.easeIn(duration: 0.1)){
                    showAnimations[3].toggle()
                }

                withAnimation(.easeIn(duration: 0.1).delay(0.1)){
                    showAnimations[3].toggle()
                }
            }
        }
    }

}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
