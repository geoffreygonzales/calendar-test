//
//  Journal.swift
//  Honeydew
//
//  Created by Geoffrey Gonzales on 10/4/17.
//  Copyright © 2017 Sunlight. All rights reserved.
//
// Beautiful Level Of Excellence
// Harmonious Distribution
// Infinite Sustainability
//
// Journal is a chatty cathy
// gosips about her experiences
// eggagerates (use color and italics)
// Her phone is full of pictures she never looks at (save pics to journal)
//

import Foundation
import RealmSwift

// For Saving Journal Entries To Device Memory
// For Saving Journal Entires To Cloud Storage
// For Reading Journal Entires From Device Memory
// For Reading Journal Entires From Cloud Storage
class Journal : Object
{
          /// Full Date Of The Journal Entry In Format YYYY MM DD
          @objc dynamic var fullDate = ""
          
          /// Date Of The Month Of The Journal Entry
          @objc dynamic var dayOfTheMonth = ""
          
          /// Day Of The Week Of The Journal Entry
          @objc dynamic var dayOfTheWeek = ""
          
          /// Time Of The Journal Entry
          @objc dynamic var time = ""
          
          /// AMPM Of The Journal Entry
          @objc dynamic var ampm = ""
          
          /// Entry Of The Journal Entry
          @objc dynamic var entry = ""
          
          /// Color Of The Day
          @objc dynamic var color = ""
          
          // Setting The Primary Key Of Journal Entries To Date
          // Optimizes Searching And Updating Journal Entries
          override static func primaryKey() -> String?
          {
                    return "fullDate"
          }
          
          /// Write Entry To Journal
          func write (entryDate : Date, dayOfTheMonth : String, dayOfTheWeek : String, time : String, ampm : String, entry : String, color : UIColor)
          {
                    print("\n—————————— Write Entry To Journal ——————————\n")
                    
                    // Do Try Catch Is Used To Handle Errors Initalizing Realm
                    do {
                              // 1
                              // Search Journal Entries For Existing Entries With A Matching Date
                              print("1 \nSearch Journal Entries For Existing Entries With A Matching Date")
                              
                              // Create An Instance Of Realm
                              let realm = try Realm()
                              
                              // Get Journal Entry At Date, If Unable Will Return Nil To Be Handled Later
                              let existingEntry = realm.objects(Journal.self).filter("fullDate = '\(entryDate.fullDate() ?? "")'").first
                              
                              // Print Date Time Entry To The Console
                              print("""
                                        Existing Full Date : \(String(describing: existingEntry?.fullDate))
                                        Existing Day Of Month : \(String(describing: existingEntry?.dayOfTheMonth))
                                        Existing Day Of Week : \(String(describing: existingEntry?.dayOfTheWeek))
                                        Existing Time : \(String(describing: existingEntry?.time))
                                        Existing Day Of AMPM : \(String(describing: existingEntry?.ampm))
                                        Existing Entry Entry : \(String(describing: existingEntry?.entry))
                                        Existing Entry Color : \(String(describing : existingEntry?.color))
                                        """)
                              
                              
                              // 2a
                              // If Journal Entry At Date Does Not Exist, Or Existing Entry Text Is Blank, Write A New Entry Including The Time And Color
                              // Used When A Journal Entry Is Created From Scratch, Or Rewritten Form A Blank Entry Field, As Time Is Then Established
                              if existingEntry?.entry == nil || existingEntry?.entry == ""
                              {
                                        print("""

                                                  2a
                                                  Journal Entry At Date Does Not Exist, Or Existing Entry Text Is Blank
                                                  Writing A New Entry Including The Time
                                                  """)
                                        
                                        // Create New Journal Object
                                        let newJournal = Journal()
                                        
                                        // Populate New Journal Including Time And Color
                                        newJournal.fullDate = entryDate.fullDate() ?? ""
                                        newJournal.dayOfTheMonth = dayOfTheMonth
                                        newJournal.dayOfTheWeek = dayOfTheWeek
                                        newJournal.time = time
                                        newJournal.ampm = ampm
                                        newJournal.entry = entry
//                                        newJournal.color = color.string()
                                        
                                        // Do Try Catch Is Used To Handle Errors Initalizing Realm And Saving To Realm
                                        do
                                        {
                                                  // Create An Instance Of Realm
                                                  let realm = try Realm()
                                                  
                                                  // Save Journal Entry To Realm
                                                  // If An Existing Journal Entry With The Same Date Exists, It Is Updated Automatically
                                                  try realm.write
                                                  {
                                                            realm.add(newJournal, update : true)
                                                  }
                                        }
                                        catch let error as NSError
                                        {
                                                  print("""
                                                            Error Creating An Instance Of Realm For Journal Entry, Or Error Saving Journal Entry To Realm
                                                            There Are 2 try Blocks In This do Funtion
                                                            Error : \(error.localizedDescription)
                                                            """)
                                        }
                                        
                                        // Print Data To The Console
                                        print("""
                                                  New Full Date : \(entryDate.fullDate() ?? "")
                                                  New Day Of Month : \(dayOfTheMonth)
                                                  New Day Of Week : \(dayOfTheWeek)
                                                  New Time : \(time)
                                                  New AMPM : \(ampm)
                                                  New Entry : \(entry)

                                                  """)
                              }
                                        
                                        
                                        // 2b
                                        // If Journal Entry At Date Exists And Entry Text Is Populated, Write An New Entry Without The Time
                                        // Used When A Journal Entry Already Exists And The Entry Field Has Been Written On Already, As Time Is Already Established
                                        // if existingEntry?.entry != nil && existingEntry?.entry != "" // bug with it running 2a & 2b, as it matched both bool tests after being edited. now using `else`
                              else
                              {
                                        print("""

                                        2b
                                        Journal Entry At Date Exists, And Entry Text Is Populated
                                        Writing An New Entry Without The Time
                                        """)
                                        
                                        // Do Try Catch Is Used To Handle Errors Creating An Instance Of Realm For Journal Entry, Or Error Saving Journal Entry To Realm
                                        do
                                        {
                                                  // Create An Instance Of Realm
                                                  let realm = try Realm()
                                                  
                                                  // Save Journal Entry To Realm
//                                                  try realm.write
//                                                  {
//                                                            // If An Existing Journal Entry With The Same Date Exists, It Is Updated Automatically
//                                                            // Create New Journal Object And Populate New Journal Without Time
//                                                            realm.create(Journal.self,
//                                                                         value: [
//                                                                                "fullDate" : entryDate.fullDate() ?? "",
//                                                                                "dayOfTheMonth" : dayOfTheMonth,
//                                                                                "dayOfTheWeek" : dayOfTheWeek,
//                                                                                "ampm" : ampm,
//                                                                                "entry" : entry,
//                                                                                "color" : color.string()
//                                                                                ],
//                                                                         update: true)
//                                                  }
                                        }
                                                  
                                        // Error Handeling For Creating An Instance Of Realm For Journal Entry, Or Error Saving Journal Entry To Realm
                                        catch let error as NSError
                                        {
                                                  print("""
                                                            Error Creating An Instance Of Realm For Journal Entry, Or Error Saving Journal Entry To Realm
                                                            There Are 2 try Blocks In This do Funtion
                                                            Error : \(error.localizedDescription)
                                                            """)
                                        }
                                        
                                        // Print New Data To The Console
                                        print("""
                                                  New Full Date : \(entryDate.fullDate() ?? "")
                                                  New Day Of Month : \(dayOfTheMonth)
                                                  New Day Of Week : \(dayOfTheWeek)
                                                  New Time : \(time)
                                                  New AMPM : \(ampm)
                                                  New Entry : \(entry)
                                                  
                                                  """)
                              }
                    }
                              
                              // Error Handeling For Creating An Instance Of Realm To Check If There Is An Existing Entry
                    catch let error as NSError
                    {
                              print("""
                                        Creating An Instance Of Realm To Check If There Is An Existing Entry
                                        Error : \(error.localizedDescription)
                                        No Journal Entry Will be Saved
                                        """ )
                    }
          }
          
          /// Read Entry From Journal
          func read (entryDate : Date) -> (entryDate : Date, dayOfTheMonth : String, dayOfTheWeek : String, time : String, ampm : String, entry : String, color : UIColor)
          {
                    print("—————————— Read Entry From Journal ——————————\n")
                    
                    // Do Try Catch Is Used To Handle Errors Initalizing Realm
                    do
                    {
                              // Create An Instance Of Realm
                              let realm = try Realm()
                              
                              // Search Journal Entries For Existing Entries With A Matching Date
                              print("Searching For Entries With matching Date Of \(entryDate.fullDate() ?? "")")
                              let entry = realm.objects(Journal.self).filter("fullDate = '\(entryDate.fullDate() ?? "")'").first
                              
                              // Print Stuff To The Console
                              // If No Matching Journal Entries Had Been Found, Default Values Are Returned
                              print("""
                                        Date : \(String(describing: entryDate.fullDate()))
                                        Day Of The Month : \(String(describing: entryDate.dayOfTheMonth()))
                                        Day Of The Week : \(String(describing: entryDate.dayOfTheWeek()))
                                        Returning Current Users Time And AMPM For Testing
                                        Time : \(String(describing: entry?.time))
                                        AMPM : \(String(describing: entry?.ampm))
                                        Entry : \(String(describing: entry?.entry))
                                        Existing Entry Color : \(String(describing: entry?.color))
                                        """)
                              
                              // Return Date Time Entry To The Tuple
                              // If No Matching Journal Entries Had Been Found, Default Values Are Returned
                              // Default Values Are : The Date Object (atDate), The Day That Was Checked, The Day Of The Week That Was Checked, The Rest Is Blank
                              
                              // If An There Is And Existing Color
                              if let entryColor = entry?.color
                              {
                                        return (entryDate,
                                                entryDate.dayOfTheMonth() ?? "",
                                                entryDate.dayOfTheWeek() ?? "",
                                                
                                                  // Returning Current Users Time And AMPM For Testing, Will Use If Date <= Today And Entry Is Blank
                                                  // Will Need To Put In Seconds Thingy
                                                  (entry?.time ?? entryDate.timeOfTheDay())!,
                                                  (entry?.ampm ?? entryDate.AMPMOfTheDay())!,
                                                  
                                                  // Many Lines To Let Scrolling Happen
                                                  entry?.entry ?? "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
                                                  
                                                  // Geting Color From String, Default Is Grey
                                                  UIColor(named: "\(entryColor)")!
                                        )
                              }
                              
                                        // If There Is Not A Color // TEST : Return Green For Testing
                              else
                              {
                                        return (entryDate,
                                                entryDate.dayOfTheMonth() ?? "",
                                                entryDate.dayOfTheWeek() ?? "",
                                                
                                                // Returning Current Users Time And AMPM For Testing, Will Use If Date <= Today And Entry Is Blank
                                                  // Will Need To Put In Seconds Thingy
                                                  (entry?.time ?? entryDate.timeOfTheDay())!,
                                                  (entry?.ampm ?? entryDate.AMPMOfTheDay())!,
                                                  
                                                  // Many Lines To Let Scrolling Happen
                                                  entry?.entry ?? "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
                                                  
                                                  // Geting Color From String, Default Is Grey
                                                  UIColor(named: "grey")!
                                        )
                              }
                    }
                              
                              // Error Handeling For Creating An Instance Of Realm For Reading From Journal Entry
                    catch let error as NSError
                    {
                              print("""
                                        Error Creating An Instance Of Realm For Reading From Journal Entry
                                        Error : \(error.localizedDescription)
                                        Returning The Date That Was Looked Up (atDate), An Empty Time, An Empty Entry
                                        """ )
                    }
                    
                    //  Returning The Date That Was Looked Up (atDate), An Empty Time, An Empty Entry
                    // This Is Only Returned In The Case There Is An Error Creating An Instance Of Realm, As In The Case Of Full Device Memory
                    // Many Lines To Let Scrolling Happen
                    print("Error Creating An Instance Of Realm, Returning Defualt Values ")
                    return (entryDate, "" , "", "", "", "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", UIColor(named : "deepDeepGrey")!)
          }
}




























