//
//  File.swift
//  LearnWithBalloon_Jisu
//
//  Created by Jisu Jang on 2022/04/23.
//

import SwiftUI

struct BalloonView: View {
    
    
    @State var TouchIndex : Int = 0
    
    @State var BalloonSize = 0
    @State var ColorIndex = 0
    @State var ExplanationIndex = 0
    
    @State var isBallonPoped = false
    @State var rotation = Angle.zero
    
    @State var isThreeFingerPress = false
    @State var isDetectingLongPress = false
    @State var completedLongPress = false
    
    let screenWidth1 = UIScreen.main.bounds.size.width
    let screenHeight1 = UIScreen.main.bounds.size.height
    
    let selection : Int
    
    
    var body: some View {
        
        // welcome
        if selection == 0 {
            
            Image("balloon2")
                .foregroundColor(.yellow)
                .frame(width: screenWidth1*0.9, height: screenHeight1*0.2)
                .offset(y: -screenHeight1*0.2)
        }
        
        // Tap
        if selection == 1 {
            
            Image(ImageNames[BalloonSize])
                .foregroundColor(balloonColors[ColorIndex])
                .gesture(shortPressGesture) //#1
                .frame(width: screenWidth1*0.9, height: screenHeight1*0.2)
                .offset(y: -screenHeight1*0.25)
            
        }
        // Long Tab
        if selection == 2 {
            
            ZStack {
                
                Image("balloon2")
                    .foregroundColor(balloonColors[ColorIndex])
                    .gesture(longPressGesture) //#2
                    .frame(width: screenWidth1*0.9, height: screenHeight1*0.2)
                    .offset(y: -screenHeight1*0.2)
                    .scaleEffect(isDetectingLongPress ? 0.7 : 1)
                
                
                if isDetectingLongPress == true {
                    
                    ChatBubble(direction: .left) {
                        Text(colorExplanation[ColorIndex])
                            .font(.subheadline)
                            .bold()
                            .padding(.all, 20)
                            .foregroundColor(Color.white)
                            .background(balloonColors[ColorIndex])
                    }
                    .offset(x: screenWidth1*0.5, y: -screenWidth1*0.15)
                }
            }
        }
        // Drag
        if selection == 3 {
            
            Image("balloon2")
                .foregroundColor(balloonColors[ColorIndex])
                .gesture(draggingGesture) //#3
                .frame(width: screenWidth1*0.9, height: screenHeight1*0.2)
                .offset(y: -screenHeight1*0.2)
        }
        
        // Rotate
        if selection == 4 {
            
            Image("balloon22")
                .foregroundColor(balloonColors[ColorIndex])
                .rotationEffect(rotation) //#4// #1
                .gesture(rotationGesture)
                .frame(width: screenWidth1*0.9, height: screenHeight1*0.2)
                .offset(y: -screenHeight1*0.025)
        }
        
        // Three fingers
        if selection == 5 {
            Image(isThreeFingerPress ? "PoppedUp33" : "balloon22")
                .foregroundColor(balloonColors[ColorIndex])
                .overlay(
                    ThreeFingerTouch { _ in
                        isThreeFingerPress = true
                    })
                .frame(width: screenWidth1*0.9, height: screenHeight1*0.2)
                .offset(y: -screenHeight1*0.025)
            
            
            if isDetectingLongPress == true {
                Text(colorExplanation[ColorIndex])
                .font(.largeTitle) }
        }
        
        
        // Play on your own
        
        if selection == 6 {
            
            
            //            버튼으로 부터 특정값을 받아와서, 그 값이 어떤 값이 되면 벌룬 사이즈는 영이다.
            //            if isRestart == 1 {
            //                BalloonSize = isRestart
            //            }
            
            ZStack {
                
                if BalloonSize == 0 {
                    Image(isThreeFingerPress ? "PoppedUp33" : ImageNames2[BalloonSize])
                        .overlay(
                            ThreeFingerTouch { _ in
                                isThreeFingerPress = true
                            })
                        .foregroundColor(balloonColors[ColorIndex])
                        .gesture(shortPressGesture) //#1
                        .gesture(longPressGesture) //#2
                        .gesture(draggingGesture) //#3
                        .rotationEffect(rotation) //#4
                        .gesture(rotationGesture)
                    
                        .frame(width: screenWidth1*0.9, height: screenHeight1*0.2)
                        .offset(y: screenHeight1*0.2)
                    
                    if isDetectingLongPress == true {
                        
                        ChatBubble(direction: .left) {
                            Text(colorExplanation[ColorIndex])
                                .font(.subheadline)
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(Color.white)
                                .background(balloonColors[ColorIndex])
                        }
                        .offset(x: screenWidth1*0.5, y: screenWidth1*0.15)
                        
                    }
                }
            }
            
            
            ZStack {
                if BalloonSize == 1 {
                    Image(isThreeFingerPress ? "PoppedUp33" : ImageNames2[BalloonSize])
                        .overlay(
                            ThreeFingerTouch { _ in
                                isThreeFingerPress = true
                            })
                        .foregroundColor(balloonColors[ColorIndex])
                        .gesture(shortPressGesture) //#1
                        .gesture(longPressGesture) //#2
                        .gesture(draggingGesture) //#3
                        .rotationEffect(rotation) //#4
                        .gesture(rotationGesture)
                    
                        .frame(width: screenWidth1*0.9, height: screenHeight1*0.2)
                        .offset(y: screenHeight1*0.15)
                    
                    if isDetectingLongPress == true {
                        
                        ChatBubble(direction: .left) {
                            Text(colorExplanation[ColorIndex])
                                .font(.subheadline)
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(Color.white)
                                .background(balloonColors[ColorIndex])
                        }
                        .offset(x: screenWidth1*0.5)
                        
                    }
                }
            }
            
            ZStack {
                
                if BalloonSize == 2 {
                    Image(isThreeFingerPress ? "PoppedUp33" : ImageNames2[BalloonSize])
                        .overlay(
                            ThreeFingerTouch { _ in
                                isThreeFingerPress = true
                            })
                        .foregroundColor(balloonColors[ColorIndex])
                        .gesture(shortPressGesture) //#1
                        .gesture(longPressGesture) //#2
                        .gesture(draggingGesture) //#3
                        .rotationEffect(rotation) //#4
                        .gesture(rotationGesture)
                    
                        .frame(width: screenWidth1*0.9, height: screenHeight1*0.2)
                        .offset(y: screenHeight1*0.1)
                    
                    if isDetectingLongPress == true {
                        
                        ChatBubble(direction: .left) {
                            Text(colorExplanation[ColorIndex])
                                .font(.subheadline)
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(Color.white)
                                .background(balloonColors[ColorIndex])
                        }
                        .offset(x: screenWidth1*0.5, y: -screenWidth1*0.17)
                        
                    }
                }
            }
            
            ZStack {
                if BalloonSize == 3 {
                    Image(isThreeFingerPress ? "PoppedUp1" : ImageNames2[BalloonSize])
                        .overlay(
                            ThreeFingerTouch { _ in
                                isThreeFingerPress = true
                            })
                        .foregroundColor(balloonColors[ColorIndex])
                        .gesture(shortPressGesture) //#1
                        .gesture(longPressGesture) //#2
                        .gesture(draggingGesture) //#3
                        .rotationEffect(rotation) //#4
                        .gesture(rotationGesture)
                    
                        .frame(width: screenWidth1*0.9, height: screenHeight1*0.2)
                        .offset(y: screenHeight1*0.05)
                    
                    if isDetectingLongPress == true {
                        
                        ChatBubble(direction: .left) {
                            Text(colorExplanation[ColorIndex])
                                .font(.subheadline)
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(Color.white)
                                .background(balloonColors[ColorIndex])
                        }
                        .offset(x: screenWidth1*0.5, y: -screenWidth1*0.32)
                        
                    }
                }
            }
            
            ZStack {
                
                if BalloonSize == 4 {
                    Image(isThreeFingerPress ? "PoppedUp1" : ImageNames2[BalloonSize])
                        .overlay(
                            ThreeFingerTouch() { _ in
                                isThreeFingerPress = true
                            })
                    
                        .foregroundColor(balloonColors[ColorIndex])
                        .gesture(shortPressGesture) //#1
                        .gesture(longPressGesture) //#2
                        .gesture(draggingGesture) //#3
                        .rotationEffect(rotation) //#4
                        .gesture(rotationGesture)
                    
                        .frame(width: screenWidth1*0.9, height: screenHeight1*0.2)
                        .offset(y: screenHeight1*0)
                    
                    if isDetectingLongPress == true {
                        
                        ChatBubble(direction: .left) {
                            Text(colorExplanation[ColorIndex])
                                .font(.subheadline)
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(Color.white)
                                .background(balloonColors[ColorIndex])
                        }
                        .offset(x: screenWidth1*0.5, y: -screenWidth1*0.35)
                        
                    }
                    
                }
            }
            
        }
        
        
    }
    
    var ImageNames: [String] = [
        "balloon1", "balloon2", "balloon3",
        "balloon4", "balloon5", "PoppedUp1"
    ]
    
    var ImageNames2: [String] = [
        "balloon11", "balloon22", "balloon33",
        "balloon44", "PoppedUp4"
    ]
    
    var balloonColors : [Color] = [
        Color.yellow, Color.green, Color.blue, Color.indigo, Color.purple, Color.red, Color.orange]
    
    var colorExplanation : [String] = [
        "Yellow makes you comfortable and happy!",
        "Green relieves your eyes! ",
        "Blue means for trust and peace!",
        "Indigo is the color of wisdom!",
        "Purple is mysterious but powewrful!",
        "Red may stimulates your appetite!",
        "Orange means for curiosity and liveliness!"
    ]
    
    // # Gestures
    
    
    // #1
    var shortPressGesture: some Gesture {
        
        TapGesture()
            .onEnded { value in
                withAnimation {
                    
                    if isThreeFingerPress == true {
                        
                        isThreeFingerPress = false
                        BalloonSize = 0
                    }
                    
                    
                    if isDetectingLongPress == false {
                        
                        if selection == 1 {
                            
                            if BalloonSize >= ImageNames.count - 4 {
                                BalloonSize = 0
                            } else {
                                BalloonSize += 1
                            }
                            
                            
                        }
                        
                        else {
                            
                            if BalloonSize >= 4 {
                                BalloonSize = 0
                            } else {
                                BalloonSize += 1
                            }
                            
                        }
                    } else {
                        isDetectingLongPress = false
                    }
                    
                    
                    
                }
            }
    }
    
    // #2
    var longPressGesture: some Gesture {
        LongPressGesture()
            .onChanged { _ in
                isDetectingLongPress = false
            }
            .onEnded { _ in
                isDetectingLongPress = true
                
            }
    }
    
    
    // #3
    var draggingGesture : some Gesture {
        DragGesture()
            .onEnded { value in
                withAnimation {
                    ColorIndex += 1
                    ExplanationIndex += 1
                    
                    if ColorIndex == balloonColors.count {
                        ColorIndex = 0
                    }
                }
            }
    }
    
    // #4
    var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged{ angle in
                rotation = angle
            }
            .onEnded { angle in
                rotation = angle
            }
    }
    
    struct Description : View {
        var body: some View {
            Text("Yellow will make you happy !")
                .bold()
            
        }
    }
    
    
    
}

