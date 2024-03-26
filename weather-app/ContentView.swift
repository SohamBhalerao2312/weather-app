//
//  ContentView.swift
//  weather-app
//
//  Created by Soham Bhalerao on 25/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Backgroundview(topColor: .blue, bottomColor: .green)
            
            VStack{
                CityTextView(cityname: "Pune", country: "India")
                
                VStack(spacing: 7){
                    Image(systemName: "cloud.sun.fill")
                        
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width:180,height: 180)
                        
                    
                    Text("35°C")
                        .font(.system(size: 40 , weight: .medium,design: .default))
                        .foregroundColor(.white)
                        .padding(.horizontal, 9)
                }
                .padding(.bottom,32)
                Spacer()
                
                HStack(spacing: 20){
                    WeatherDayView(day_of_week: "TUE", img_name: "sun.haze.fill", temperature: 26)
                    WeatherDayView(day_of_week: "WED", img_name: "cloud.sun.bolt.fill", temperature: 24)
                    WeatherDayView(day_of_week: "THU", img_name: "cloud.moon.rain.fill", temperature: 21)
                    WeatherDayView(day_of_week: "FRI", img_name: "cloud.sun.bolt.fill", temperature: 23)
                    WeatherDayView(day_of_week: "SAT", img_name: "cloud.sun.fill", temperature: 26)
                    WeatherDayView(day_of_week: "SUN", img_name: "sun.max.fill", temperature: 28)
                }
                Spacer()
                Button {
                    //This part is to perform backend operations
                    print("Tapped")
                }label: {
                    Text("Change Day Time")
                        .frame(width: 280,height: 50)
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold,design: .default))
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.bottom,32)
                
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {    //This is the extracted view made for code reusability
    var day_of_week:String
    var img_name:String
    var temperature:Int
    var body: some View {
        VStack{
            
            Text(day_of_week)
                .font(.system(size: 16,weight: .medium,design: .default))
                .foregroundColor(.white)
            Image(systemName: img_name)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width:40,height: 40)
            Text("\(temperature)") //String interpolation
                .font(.system(size: 28, weight: .medium,design: .default))
                .foregroundColor(.white)
            
        }
    }
}

struct Backgroundview: View {
    var topColor:Color
    var bottomColor:Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor,bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView:View{
    var cityname:String
    var country:String
    var body: some View{
        Text("\(cityname), \(country)")
            .font(.system(size: 37, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.top, 40)
    }
}
