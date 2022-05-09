//
//  File.swift
//  LearnWithBalloon_Jisu
//
//  Created by Jisu Jang on 2022/04/23.
//

import SwiftUI

struct PageView: View {
    
    let screenWidth1 = UIScreen.main.bounds.size.width
    let screenHeight1 = UIScreen.main.bounds.size.height
    
    // Input Parameter
    let story: Story
    let pageIndex: Int
    
    var body: some View {
        
        VStack {
            
                Text(guide[pageIndex])
                    .font(.largeTitle)
                    .bold()
                    .offset(y: -screenWidth1*0.17)
                
                Text(gestureExplanation[pageIndex])
                    .font(.title2)
                    .offset(y: -screenWidth1*0.15)
                
     
            BalloonView(selection: pageIndex)
            
            // story의 detination은 1부터 시작,
            // destiation의 pageIndex는 choice에서 가져오며, 거기는 destination이 1부터 시작함.
            
            ForEach(story[pageIndex].choices, id: \.self) { choice in
                NavigationLink(destination: PageView(story: story, pageIndex: choice.destination)) {
                    Text(choice.text)
                        .font(.title3)
                        .bold()
                        .frame(width: screenWidth1*0.5, height: screenHeight1*0.012)
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 20)
                        .background(Color.blue)
                        .cornerRadius(20)
                    
                }
                .offset(y: screenHeight1*0.12)
            }
        }
        .padding()
        .navigationTitle(pageTitle[pageIndex])
        .navigationBarTitleDisplayMode(.inline)
        .frame(width: screenWidth1*0.9, height: screenHeight1*0.9)
        .padding()
        
    }
    
    
    var pageTitle : [String] = [
        "Departure", "TapGesture", "LongTapGesture", "DragGesture",
        "RotateGesture", "CustomizedGesture", "Play on you own!" ]
    
    
    let guide : [String] = [
        "Welcome!",
        
        "Tap the balloon to get response!",
        
        "Touch and hold the balloon!"
        ,
        "Swipe the balloon!"
        ,
        "Rotate the balloon with two fingers!",
        
        "Tap with three fingers!",
        
        "Explore all the gestures!" ]
    
    let gestureExplanation : [String] = [
        "Let's learn finger gestures of iOS with balloon!",
        
        "Tap is widely used for activating a control or selecting an item ",
        
        "Touch and hold to call a hidden function or information",
        
        "Swipe is used for changing view or something",
        
        "Some gestures need more than one finger",
        
        "You can create your own gesture with iPad in Accesibility",
        
        "And Create your own gesture!" ]
        }

struct Page_Previews: PreviewProvider {
    static var previews: some View {
        PageView(story: storyInformation, pageIndex: 0)
    }
}

