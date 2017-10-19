//
//  DateExtension.swift
//  Honeydew
//
//  Created by Geoffrey Gonzales on 10/12/17.
//  Copyright © 2017 Sunlight. All rights reserved.
//
// Beautiful Level Of Excellence
// Harmonious Distribution
// Infinite Sustainability
//

import Foundation

let currentTimeZone = TimeZone.current

extension Date
{
          /// Returns A Full Date, For Example 1993 01 23
          func fullDate() -> String?
          {
                    let dateFormatter = DateFormatter()
                    dateFormatter.timeZone = currentTimeZone
                    dateFormatter.dateFormat = "yyyy MM dd"
                    return dateFormatter.string(from: self)//.capitalized
                    // or use capitalized(with: locale) if you want
          }
          
          /// Returns The Year, For Example 1993
          func year() -> String?
          {
                    let dateFormatter = DateFormatter()
                    dateFormatter.timeZone = currentTimeZone
                    dateFormatter.dateFormat = "yyyy"
                    return dateFormatter.string(from: self)//.capitalized
                    // or use capitalized(with: locale) if you want
          }
          
          /// Returns The Month, For Example 01
          func month() -> String?
          {
                    let dateFormatter = DateFormatter()
                    dateFormatter.timeZone = currentTimeZone
                    dateFormatter.dateFormat = "MM"
                    return dateFormatter.string(from: self).lowercased()
                    // or use capitalized(with: locale) if you want
          }
          
          /// Returns The Month Abbreviated, For Example Jan
          func monthAbbreviated() -> String?
          {
                    let dateFormatter = DateFormatter()
                    dateFormatter.timeZone = currentTimeZone
                    dateFormatter.dateFormat = "MMM"
                    return dateFormatter.string(from: self).capitalized
                    // or use capitalized(with: locale) if you want
          }
          
          /// Returns The Day Of The Month, For Example 23
          func dayOfTheMonth() -> String?
          {
                    let dateFormatter = DateFormatter()
                    dateFormatter.timeZone = currentTimeZone
                    dateFormatter.dateFormat = "dd"
                    return dateFormatter.string(from: self)//.capitalized
                    // or use capitalized(with: locale) if you want
          }
          
          /// Returns The Day Of The Week, For Example Saturday
          func dayOfTheWeek() -> String?
          {
                    let dateFormatter = DateFormatter()
                    dateFormatter.timeZone = currentTimeZone
                    dateFormatter.dateFormat = "EEEE"
                    return dateFormatter.string(from: self)//.capitalized
                    // or use capitalized(with: locale) if you want
          }
          
          /// Returns The Time, For Example 12:30
          func timeOfTheDay() -> String?
          {
                    let dateFormatter = DateFormatter()
                    dateFormatter.timeZone = currentTimeZone
                    dateFormatter.dateFormat = "hh:mm"
                    return dateFormatter.string(from: self)
                    
                    // Maybe Use Later For Use Around The world?
//                   var localTimeZone: String { return TimeZone.current.abbreviation() ?? "" }
//                    dateFormatter.locale = Locale(identifier: localTimeZone)
//                    return time.lowercased(with: dateFormatter.locale)
                    // or use capitalized(with: locale) if you want,
                    // The Individuals Current Time Zone
                    // "GMT-2"
 
          }
          
          /// Returns The AMPM, For Example am
          func AMPMOfTheDay() -> String?
          {
                    let dateFormatter = DateFormatter()
                    dateFormatter.timeZone = currentTimeZone
                    dateFormatter.dateFormat = "a"
                    return dateFormatter.string(from: self)//.capitalized
                    // or use capitalized(with: locale) if you want
          }
}

//print(Date().dayOfWeek()!) // Wednesday




















