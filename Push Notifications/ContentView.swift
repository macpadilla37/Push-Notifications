//
//  ContentView.swift
//  Push Notifications
//
//  Created by Mac Padilla on 10/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView {
                FirstTabView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                SecondTabView()
                    .tabItem {
                        Label("Football", systemImage: "football")
                    }
                
                ThirdTabView()
                    .tabItem {
                        Label("Baseball", systemImage: "baseball")
                    }
                
                ForthTabView()
                    .tabItem {
                        Label("Hockey", systemImage: "hockey.puck")
                    }
            }
        
    }
}

struct FirstTabView: View {
    @State private var showingSheet = false
    
    var pushNotificationService = PushNotificationService()
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Sports Book")
                    .font(.system(size: 55, weight: .bold))
                    .padding(EdgeInsets(top: 40, leading: 10, bottom: 5, trailing: 10))
                NavigationLink("Settings") {
                    DetailPageView()
                }
                .padding()
                
                
                Button("Legal Stuff"){
                    showingSheet = true
                }
                .sheet(isPresented: $showingSheet) {
                    SheetView()
                }
                .padding()
                .navigationTitle("Home")
                
                Button("Ask for push notification permissions") {
                    pushNotificationService.requestPermissions()
                }
                .padding()
            }
        }
    }
}

struct SecondTabView: View {
    @State private var Colorado = false
    @State private var Stanford = false
    
    var pushNotificationService = PushNotificationService()
    
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    Text("Friday October 13th")
                        .font(.system(size: 36))
                    Text("@ 8:00pm")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 5))
                        .font(.system(size: 26))
                }
                HStack {
                    Text("Spread -12")
                        .padding(EdgeInsets(top: 0, leading: 90, bottom: 0, trailing: 5))
                        .font(.system(size: 12))
                    Text("Total Un60")
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                        .font(.system(size: 12))
                    Text("Moneyline")
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                        .font(.system(size: 12))
                }
                HStack{
                    //Text("Colorado")
                       // .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
                       // .font(.system(size: 25, weight: .bold))
                    
                    Button("COLORADO") {
                        Colorado = true
                    }
                    .alert("Yeahhhhhhh I Like That", isPresented: $Colorado) {
                        Button("OK", role: .cancel) {}
                    }
                    
                    
                    Text("-110")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.black, width: 4)
                    Text("-110")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.black, width: 4)
                    Text("-430")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.black, width: 4)
                        
                            .navigationTitle("Football")
                }
                HStack {
                    Text("Spread +12")
                        .padding(EdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 5))
                        .font(.system(size: 12))
                    Text("Total Ov6")
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                        .font(.system(size: 12))
                    Text("Moneyline")
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                        .font(.system(size: 12))
                }
                HStack{
                    Button("STANFORD") {
                        Stanford = true
                    }
                    .alert("Smart guys can't win", isPresented: $Stanford) {
                        Button("OK", role: .cancel) {}
                    }
                    Text("-110")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.red, width: 4)
                    Text("-110")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.red, width: 4)
                    Text("+325")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.red, width: 4)
                        
                            .navigationTitle("Football")
                }
                Button("Push notifications for this game") {
                    pushNotificationService.scheduleNotificationFootball(
                        title: "College Football",
                        subtitle: "Your game Colorado v. Stanford is starting!"
                    )
                    
                }
                .padding(EdgeInsets(top: 50, leading: 20, bottom: 10, trailing: 20))
            }
        }
    }
}





struct ThirdTabView: View {
    @State private var Braves = false
    @State private var Phillies = false
    
    var pushNotificationService = PushNotificationService()
    
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    Text("Thursday October 12th")
                        .font(.system(size: 36))
                    Text("@ 6:00pm")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 5))
                        .font(.system(size: 26))
                }
                HStack {
                    Text("Spread -1.5")
                        .padding(EdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 5))
                        .font(.system(size: 12))
                    Text("Total Ov9")
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                        .font(.system(size: 12))
                    Text("Moneyline")
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                        .font(.system(size: 12))
                }
                HStack{
                    Button("BRAVES") {
                        Braves = true
                    }
                    .alert("Phillies won't lose at home", isPresented: $Braves) {
                        Button("OK", role: .cancel) {}
                    }
                    
                    
                    Text("+110")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.blue, width: 4)
                    Text("-120")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.blue, width: 4)
                    Text("-160")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.blue, width: 4)
                        
                }
                HStack {
                    Text("Spread +1.5")
                        .padding(EdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 5))
                        .font(.system(size: 12))
                    Text("Total Un9")
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                        .font(.system(size: 12))
                    Text("Moneyline")
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                        .font(.system(size: 12))
                }
                HStack{
                    Button("PHILLIES") {
                        Phillies = true
                    }
                    .alert("This team is actually really good", isPresented: $Phillies) {
                        Button("OK", role: .cancel) {}
                    }
                    Text("-130")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.red, width: 4)
                    Text("+100")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.red, width: 4)
                    Text("+130")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.red, width: 4)
                        
                            .navigationTitle("Baseball")
                }
                Button("Push notifications for this game") {
                    pushNotificationService.scheduleNotificationBaseball(
                        title: "MLB Playoffs",
                        subtitle: "Your game Atlanta v. Philadelphia is starting!"
                    )
                }
                .padding(EdgeInsets(top: 50, leading: 20, bottom: 10, trailing: 20))
            }
        }
    }
}

struct ForthTabView: View {
    @State private var Avalanche = false
    @State private var Sharks = false
    
    var pushNotificationService = PushNotificationService()
    
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    Text("Saturday October 14th")
                        .font(.system(size: 36))
                    Text("@ 8:00pm")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 5))
                        .font(.system(size: 26))
                }
                HStack {
                    Text("Spread -1.5")
                        .padding(EdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 5))
                        .font(.system(size: 12))
                    Text("Total Ov6")
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                        .font(.system(size: 12))
                    Text("Moneyline")
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                        .font(.system(size: 12))
                }
                HStack{
                    Button("AVALANCHE") {
                        Avalanche = true
                    }
                    .alert("2022 Stanley Cup Champions!! EASY MONEY", isPresented: $Avalanche) {
                        Button("OK", role: .cancel) {}
                    }
                    
                    
                    Text("+130")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.blue, width: 4)
                    Text("-105")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.blue, width: 4)
                    Text("-250")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.blue, width: 4)
        
                }
                HStack {
                    Text("Spread +1.5")
                        .padding(EdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 5))
                        .font(.system(size: 12))
                    Text("Total Un6")
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                        .font(.system(size: 12))
                    Text("Moneyline")
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                        .font(.system(size: 12))
                }
                HStack{
                    Button("SHARKS") {
                        Sharks = true
                    }
                    .alert("They are bad should be a easy win", isPresented: $Sharks) {
                        Button("OK", role: .cancel) {}
                    }
                        .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 0))
                    Text("+180")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.teal, width: 4)
                    Text("-115")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.teal, width: 4)
                    Text("+210")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .border(.teal, width: 4)
                        
                            .navigationTitle("Hockey")
                }
                Button("Push notifications for this game") {
                    pushNotificationService.scheduleNotificationHockey(
                        title: "NHL Hockey",
                        subtitle: "Your game Colorado v. San Jose is starting!"
                    )
                }
                .padding(EdgeInsets(top: 50, leading: 20, bottom: 10, trailing: 20))
            }
        }
    }
}

struct DetailPageView: View {
    var body: some View {
        NavigationView {
            VStack(content: {
                Text("Theres nothing here, Check back at a later time")
                    .foregroundColor(.blue)
            })
                .padding()
                .navigationTitle("Setting")
        
        }
    }
    
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("Mac Padilla's Sportsbooks' Terms and Conditions outline the rules and regulations governing their sports betting and online gaming platform. While the specific terms and conditions may change over time, here's a general summary of what you might find in them: Too Long to type.")
            .padding()

        Button("Press to Dismiss") {
            dismiss()
        }
    }
}



#Preview {
    ContentView()
}
