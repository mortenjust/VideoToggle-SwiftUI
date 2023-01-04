//
//  NightVideo.swift
//  CustomSwitch
//
//  Created by Morten Just on 1/4/23.
//

import SwiftUI

struct Videos {
    static var hbNight = "kHwmzef842g"
    static var skateCam = "g5ndKLDG-t4"
    static var amsterdam = "R3YNscjcJOk"
}

struct NightVideo: View {
    let id : String
    
    var body: some View {
        VStack {
            
            YouTubeView(videoId: id)
                .frame(width: 400, height: 450)
                .fixedSize()
                .frame(width: 300, height: 120)
                .clipped()
           
        }
    }
}

struct NightVideo_Previews: PreviewProvider {
    static var previews: some View {
        NightVideo(id: Videos.hbNight)
    }
}



import Foundation
import WebKit

struct YouTubeView: NSViewRepresentable {
    let videoId: String
    func makeNSView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateNSView(_ uiView: WKWebView, context: Context) {
        guard let demoURL = URL(string: "https://www.youtube.com/embed/\(videoId)?autoplay=true") else { return }
//        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: demoURL))
    }
}
