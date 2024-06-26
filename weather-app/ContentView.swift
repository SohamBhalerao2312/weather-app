//
//  ContentView.swift
//  weather-app
//
//  Created by Soham Bhalerao on 25/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight=false
    
    var body: some View {
        
        ZStack{
            Backgroundview(isNight: $isNight) //$sign is used coz this isNight variable is same as above one that we created using @State
            
            VStack{
                CityTextView(cityname: "Pune", country: "India")
                
                MainWeatherStatusView(imagename: isNight ?"moon.dust.fill" : "sun.haze.fill", temperature:isNight ? 19 : 32)
                Spacer()
                
                HStack(spacing: 20){
                    WeatherDayView(day_of_week: "TUE", img_name: isNight ? "moon.haze.fill" :"sun.haze.fill", temperature: 26)
                    WeatherDayView(day_of_week: "WED", img_name:isNight ? "cloud.moon.bolt.fill" : "cloud.sun.bolt.fill", temperature: 24)
                    WeatherDayView(day_of_week: "THU", img_name:isNight ? "wind" : "cloud.moon.rain.fill", temperature: 21)
                    WeatherDayView(day_of_week: "FRI", img_name:isNight ? "smoke.fill" : "cloud.sun.bolt.fill", temperature: 23)
                    WeatherDayView(day_of_week: "SAT", img_name:isNight ? "cloud.sleet.fill" : "cloud.sun.fill", temperature: 26)
                    WeatherDayView(day_of_week: "SUN", img_name:isNight ? "moon.stars.fill" : "sun.max.fill", temperature: 28)
                }
                Spacer()
                Button{
                    //Performing Backend Operations
                    isNight.toggle()
                }label: {
                    Text("Change Day Time")
                        .font(.system(size: 25,weight: .semibold,design: .default))
                        .foregroundColor(isNight ? .blue : .white)
                        .frame(width: 280,height: 50)
                        .background(isNight ? .white : .blue)
                        .cornerRadius(10)
                        
                }
                .padding(.bottom, 32)
                
                
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
    
    @Binding var isNight:Bool       //@Binding is used to add some extra functionality to the variable
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue , isNight ? .gray : .green  ]), startPoint: .topLeading, endPoint: .bottomTrailing)
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

struct MainWeatherStatusView: View {
    var imagename:String
    var temperature:Int
    
    var body: some View {
        VStack(spacing: 20){
            Image(systemName: imagename)
            
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width:180,height: 180)
            
            
            Text("\(temperature)°C")
                .font(.system(size: 50 , weight: .medium,design: .default))
                .foregroundColor(.white)
                .padding(.horizontal, 9)
        }
        .padding(.bottom,32)
    }
}

