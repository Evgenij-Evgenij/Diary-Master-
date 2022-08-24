//
//  DateScreen.swift
//  Diary master
//
//  Created by Евгений Воронов on 13.08.2022.
//

import SwiftUI
// some code
struct DateScreen: View {
    @Binding var currentDate: Date
    // Month update on arrow clicks
    @State var currentMonth:Int = 0
    
    // Days...
    let days = [ "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    var body: some View {
        VStack  {
            
            HStack(spacing: 20) {
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(extratDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(extratDate()[1])
                        .font(.title.bold())
                }
                Spacer(minLength: 0)
                
                Button {
                    currentMonth -= 1
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2.bold())
                        .foregroundColor(.black)
                        
                }
                
                Button {
                    currentMonth += 1
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2.bold())
                        .foregroundColor(.black)
                        
                }

            }
            //.padding(.horizontal)
            
            //Day week name View...
            HStack {
                ForEach(days, id: \.self) {day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            // Dates...
            //Lazy grid...
            
            let colums = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: colums, spacing: 5) {
                ForEach(extractDate()) { value in
                    CardView(value: value)
                        .background(
                            Capsule()
                                .fill(.pink)
                                .padding(.horizontal, 8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0))
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            }
            
            ScrollView {
                VStack(spacing: 15) {
                    Text("Tasks")
                        .font(.title2.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 20)
                        
                    if let task = tasks.first(where: { task in
                        return isSameDay(date1: task.taskDate, date2: currentDate)
                    }) {
                        ForEach(task.task) { task in
                            VStack(alignment: .leading, spacing: 10) {
                                
                                // for custom timing...
                                
                                Text(task.time.addingTimeInterval(CGFloat.random(in: 0...5000)), style: .time)
                                Text(task.title)
                                    .font(.title2.bold())
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading )
                            .background(Color.white.opacity(0.7))
                            .cornerRadius(20)
                            
                        }
                    } else {
                        Text("No Task Found")
                    }
                  
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 85, height: 85)
                        //.foregroundColor(Color.clear)
                       
                        
                }
            }
            //.padding()
           
            
        }
        .onChange(of: currentMonth) { newValue in
            // updating month
            currentDate = getCurrentMonth()
        }
    }
    
    @ViewBuilder
    
    func CardView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }) {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    // выделяет дни с задачами
                    Spacer()
                    
                    Circle()
                    
                        .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .pink)
                        .frame(width: 8, height: 8)
                }
                else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
            }
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top) // ??
    }
    
    // Cheking Dates
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    // extracting Year and Month for display
    
    func extratDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        
        // Getting current Month date
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
    }
    
    func extractDate() ->[DateValue] {
        let calendar = Calendar.current
        
        // Getting current Month date
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            // getting day
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        // adding offsets days to get exact week day...
        let firstWeekDay = calendar.component(.weekday, from: days.first?.date ?? Date())
        for _ in 1..<firstWeekDay - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        return days
    }
}

struct DateScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
      
    }
}

//Extending Date to get current month dates...

extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        
        // Geting start date
        
        let stertDate = calendar.date(from: Calendar.current.dateComponents([.year, .month, .weekOfMonth], from: self))!
        // диапазон дат ( неделя, месяц, год)
        let range = calendar.range(of: .day, in: .month, for: stertDate)!
//        range.removeLast()
        // getting dates
        return range.compactMap { day -> Date in
            
            return calendar.date(byAdding: .day, value: day - 1, to: stertDate)!
        }
    }
}
