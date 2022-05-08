//
//  File.swift
//  LearnWithBalloon_Jisu
//
//  Created by Jisu Jang on 2022/04/23.
//

import Foundation
import SwiftUI

struct Story {
    
    let pages: [StoryPage]
    
    subscript(_ pageIndex: Int) -> StoryPage {
        return pages[pageIndex]
    }
}

struct StoryPage {
    let text: String
    
    let choices: [Choice]
    
    init(_ text: String, choices: [Choice]) {
        self.text = text
        self.choices = choices
    }
}

struct Choice {
    let text: String
    let destination: Int
}


struct ThreeFingerTouch: UIViewRepresentable
{
    var tapCallback: (UITapGestureRecognizer) -> Void
    
    typealias UIViewType = UIView
    
    //#1
    func makeCoordinator() -> ThreeFingerTouch.Coordinator
    {
        Coordinator(tapCallback: self.tapCallback)
    }
    //#2
    func makeUIView(context: Context) -> UIView
    {
        let view = UIView()
        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(sender:)))
        
        // Set number of touches.
        //
        doubleTapGestureRecognizer.numberOfTouchesRequired = 3
        
        view.addGestureRecognizer(doubleTapGestureRecognizer)
        return view
    }
    //#3
    func updateUIView(_ uiView: UIView, context: Context)
    {
    }
    //#4
    class Coordinator
    {
        var tapCallback: (UITapGestureRecognizer) -> Void
        
        init(tapCallback: @escaping (UITapGestureRecognizer) -> Void)
        {
            self.tapCallback = tapCallback
        }
        
        @objc func handleTap(sender: UITapGestureRecognizer)
        {
            self.tapCallback(sender)
        }
    }
}
