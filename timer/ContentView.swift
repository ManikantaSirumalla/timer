//
//  ContentView.swift
//  timer
//
//  Created by Bubbly Boey on 06/05/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    var body: some View {
        ZStack{
            Image("bgclk")
                .resizable().aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 5)
            VStack {
                Text(String(format: "%.1f", stopWatchManager.secondsElapsed))
                    .font(.custom("Avenir", size: 60))
                    .padding(.top, 173)
                    .padding(.bottom, 100)
                    .padding(.trailing, 100)
                    .padding(.leading, 100)
               
            if stopWatchManager.mode == .stopped {
                Button(action:  {self.stopWatchManager.start()}){
                    TimerButton(label: "start" , buttoncolor: .green, textcolor: .black)
                }
            }
            if stopWatchManager.mode == .running {
                Button(action:  {self.stopWatchManager.pause()}){
                    TimerButton(label: "stop" , buttoncolor: .yellow, textcolor: .black)
                }
               
            }
            
            if stopWatchManager.mode == .paused {
                Button(action:  {self.stopWatchManager.start()}){
                    TimerButton(label: "resume" , buttoncolor: .green, textcolor: .black)
               }
            
                Button(action:  {self.stopWatchManager.stop()}){
                    TimerButton(label: "reset" , buttoncolor: .red,
                                textcolor: .white)
                }
                .padding(.top, 30)
            }
            Spacer()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct TimerButton: View {
    
    let label: String
    let buttoncolor: Color
    let textcolor: Color
    
    var body: some View {
        Text(label)
            .foregroundColor(textcolor)
            .padding(.vertical, 20)
            .padding(.horizontal, 90)
            .background(buttoncolor)
            .cornerRadius(10)
        }
}

