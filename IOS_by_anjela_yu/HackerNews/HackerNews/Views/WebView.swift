//
//  WebView.swift
//  HackerNews
//
//  Created by user223941 on 2/23/23.
//

import Foundation
import WebKit
import SwiftUI


// Burrowing the Web view from the UIKit
struct WebView: UIViewRepresentable {
    let urlString: String?
    
    // WebView.UIViewType changes to WKWebView
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
