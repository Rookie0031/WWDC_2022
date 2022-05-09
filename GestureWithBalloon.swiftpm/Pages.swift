//
//  File.swift
//  LearnWithBalloon_Jisu
//
//  Created by Jisu Jang on 2022/04/23.
//

// 페이지에 띄울 정보 양식을 통일화되서 저장함

import Foundation
import SwiftUI

let storyInformation = Story(pages: [
    
    StoryPage([Choice(text: "Let's go!", destination: 1)]),

    StoryPage([Choice(text: "Got it!", destination: 2)]),

    StoryPage([Choice(text: "Got it!", destination: 3)]),

    StoryPage([Choice(text: "Got it!", destination: 4)]),

    StoryPage([Choice(text: "Got it!", destination: 5)]),

    StoryPage([Choice(text: "Play on your own", destination: 6)]),

    StoryPage([ ])

    ]
    )
 
