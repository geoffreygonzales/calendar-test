// Beautiful Level Of Excellence
// Harmonious Distribution
// Infinite Sustainability
//

import JTAppleCalendar

extension JournalViewController : JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource
{
          // Animates Calendar Up To The View
          func wakeUpCalendar()
          {
                    print("—————————— Animating Calendar Up To The View ——————————\n")
                    
                    // Prevent Jump To Today And Hide Calendar From Being Called In View Did Load Subviews Again
                    if calendarIsNotSetup
                    {
                              calendarIsSetup()
                    }
                    
                    // Communicate To Controller That Calendar Is Awake
                    calendarIsSleeping = false
                    
                    // Set Speed Of Animation
                    let animationDuration = 0.08
                    
                    // Get Screen Height
                    let screenHeight = UIScreen.main.bounds.height
                    
                    // Animate Calendar Up To The View
                    UIView.animate(withDuration: animationDuration)
                    {
                              self.calendarContainer.frame.origin.y = screenHeight - self.calendarContainer.frame.size.height
                              self.calendarContainer.frame.origin.y = screenHeight - self.calendarContainer.frame.size.height
                    }
                    
                    // Blur Bg
                    // Show Button That Dismisses
          }
          
          // Animates Calendar Down Below The Screen
          func putCalendarToSleep()
          {
                    print("—————————— Animating Calendar Down Below The Screen ——————————\n")
                    
                    // Communicate To Controller That Calendar Is Sleeping
                    calendarIsSleeping = true
                    
                    // Set Speed Of Animation
                    let animationDuration = 0.08
                    
                    // Get Screen Height
                    let screenHeight = UIScreen.main.bounds.height
                    
                    // Animate Down Below Screen
                    UIView.animate(withDuration: animationDuration)
                    {
                              self.calendarContainer.frame.origin.y = screenHeight
                              self.calendarContainer.frame.origin.y = screenHeight
                    }
                    
                    // Unblur
                    // Hide Button That Dismisses
          }
          
          // Hide The Calendar Content View Below The Screen Without Animaiton
          func hideCalendar()
          {
                    print("—————————— Hide The Calendar Below The Screen Without Animaiton —————————— \n")
                    
                    // Get Screen Properties
                    let screenHeight = UIScreen.main.bounds.height
                    
                    // Move The Calendar And The  Below The Screen
                    calendarContainer.frame.origin.y = screenHeight
                    calendarView.frame.origin.y = 367.0
          }
          
          // Jump To Todays Date Without Animation
          // Used On Inital Load To Force The Calendar To Show Today
          func jumpToToday()
          {
                    print("—————————— Jump To Todays Date Without Animation ——————————")
                    let today = Date()
                    calendarView.scrollToDate(today, animateScroll: false)
                    
//                    print("Setting calendarIsNotSetup To False")
//                    calendarIsNotSetup = false
          }
          
          // Called When Scrolling Finger Lifts Up Off Screen //
          // Calling Calender Check MAKES SCROLL SLOW
          func scrollDidEndDecelerating(for calendar: JTAppleCalendarView)
          {
                    print("—————————— Did End Decelerating —————————— \n")
                    
                    // TESTING : Show Current Date On Labels
                    printCurrentDate()
          }
          
          // Use If Did End Decelerating Doesnt Adequatly Keep With With Needing To Reload The Start And End Dates
          func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo)
          {
                    print("—————————— Finished Scroll To Date Segment —————————— \n")
                    
                    calendarView.reloadData()
          }
          
          // Set Up Date Cell
          func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell
          {
                    // print("—————————— Set Up Date Cell ——————————")
                    
                    // Get Cell
                    let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
                    
                    // Set Date On Cell
                    cell.dateLabel.text = cellState.text
                    
                    // Set Color Of Date On Cell
                    
                    return cell
          }
          
         // Check And Set Calendar Dates
          func checkAndSetCalenderDates()
          {
                    print("—————————— Check And Set Calendar Dates —————————— \n")
                    
                    // Cushion Of Scrollable Area Before Reaching The Begining Or End Of The Loaded Content
                    let scrollCushion = 2000
                    print("Scroll Cushion : \(scrollCushion)")
                    
                    // Cushion Of Years Loaded Into The Future And Past
                    let cushionYears = 2
                    print("Cushion Years : \(cushionYears)")
                    
                    // Get Current Scroll Position
                    let contentOffset = Int(calendarView.contentOffset.y)
                    let contentHeight = Int(calendarView.contentSize.height)
                    
                    print("Offset Y : \(contentOffset)") // runtime is 0
                    print("Content Height : \(contentHeight)") // runtime is 0. after touching display, content height is set
                    print("\n")
                    
                    // Check If Current Scroll Position Is Within Scroll Cushion Of The Begining Or End Of Content Height
                    // At Inital Runtime Both Values Are 0 as They Are Not Set, And This Will Always Be Called
                    // If Calendar Cannot Load It Will Loop Forever
                    if contentOffset - scrollCushion < 0 || contentOffset + scrollCushion > contentHeight
                    {
                              print("Close To The End Of Scrollable Area - Resetting Start And End Date")
                              
                              // Get Dates Currently Visable To The View
                              let visableDates = calendarView.visibleDates()
                              
                              // Setting A Foremat For The Date
                              let forematter = DateFormatter()
                              let currentTimeZone = TimeZone.current
                              
                              // Set The Format Of The Individuals Date
                              forematter.dateFormat = "yyyy-MM-dd"
                              forematter.timeZone = currentTimeZone
                              
                              // Inital Buildtime
                              // Load Cushion Years Into Future And Past From Today
                              if contentHeight == 0
                              {
                                        print("""
                                        Inital Load Of Calendar Before View Did Load
                                        Loading Cushion Years Into Future And Past From Today

                                        """)
                                        
                                        // Get Today
                                        let today = Date()
                                        
                                        // Get Todays Month
                                        forematter.dateFormat = "MM"
                                        guard let todaysMonth = Int(forematter.string(from: today)) else
                                        {
                                                  print("Could Not Get Todays Month")
                                                  return
                                        }
                                        print("Todays Month \(todaysMonth)")
                                        
                                        // Get Todays Year
                                        forematter.dateFormat = "yyyy"
                                        guard let todaysYear = Int(forematter.string(from: today)) else
                                        {
                                                  print("Could Not Get Todays Year")
                                                  return
                                        }
                                        print("Todays Month \(todaysYear)")
                                        
                                        // Set Start And End Date For Calendar
                                        forematter.dateFormat = "yyyy-MM-dd"
                                        startDate = forematter.date(from: "\(todaysYear - cushionYears)-\(todaysMonth)-01")!
                                        endDate = forematter.date(from: "\(todaysYear + cushionYears)-\(todaysMonth)-28")!
                                        
                                        // Print Start And End Date To The Console
                                        print("Start Date : \(startDate)")
                                        print("End Date : \(endDate)")
                                        
                                        // Set Scroll Offset To Today
                                        calendarView.scrollToDate(today, animateScroll: false)
                              }
                                        
                              // During Runtime Scrolling
                              // Load Cushion Years Into Future And Past From Currently Viewed Month
                              else
                              {
                                        print("""
                                        Loading Cushion Years Into Future And Past From Currently Viewed Month
                                        Will Reload Calendar Data

                                        """)
                                        
                                        // Get Current Date In View
                                        guard let currentDateInView = visableDates.monthDates.first?.date else { return }
                                        print("Current Date In View : \(currentDateInView)")
                                        
                                        // Get Current Month In View From Current Date
                                        let currentMonthInView = Calendar.current.dateComponents([.month], from: currentDateInView).month!
                                        print("Current Month In View \(currentMonthInView)")
                                        
                                        // Get Current Year In View From Current Date
                                        let currentYearInView = Calendar.current.component(.year, from: currentDateInView)
                                        print("Current Year In View \(currentYearInView)")
                                        
                                        // Set Start And End Date For Calendar
                                        startDate = forematter.date(from: "\(currentYearInView - cushionYears)-\(currentMonthInView)-01")!
                                        endDate = forematter.date(from: "\(currentYearInView + cushionYears)-\(currentMonthInView)-28")!
                                        
                                        // Print Start And End Date To The Console
                                        print("Start Date : \(startDate)")
                                        print("End Date \(endDate)")
                                        
                                        // Set Scroll Position To Current Scroll Position
                                        calendarView.scrollToDate(currentDateInView, animateScroll: false)
                              }
                    }
          }
          
          // Configure The Calenders Paramaters
          // Called Before View Did Load On Inital Launch
          func configureCalendar(_ calendar : JTAppleCalendarView) -> ConfigurationParameters
          {
                    print("—————————— Configure The Calendar —————————— \n")

                    // Clipping Head And Tail Dates To Enable Infinte Continuous Scrolling
                    let inDateSetting = InDateCellGeneration.off
                    let outDateSetting = OutDateCellGeneration.off
                    
                    // Remove All Date Cell Inset And Line Spacing Fat
                    calendarView.minimumInteritemSpacing = 0
                    calendarView.minimumLineSpacing = 0

                    // Check Boundry Dates Loaded In Calendar And Set Them If Needed
                    checkAndSetCalenderDates()
                    
                    // Set The Calenders Paramaters
                    let paramaters = ConfigurationParameters (
                              startDate : startDate,
                              endDate : endDate,
                              numberOfRows : 6,
                              generateInDates : inDateSetting ,
                              generateOutDates : outDateSetting,
                              hasStrictBoundaries : false
                    )
                    
                    print("\n")
                    return paramaters
          }
          
          // Switch For Preventing View Did Layout Subviews To Call Calendar Setup Funtions
          func calendarIsSetup()
          {
                    print("—————————— Calendar Confirmed Setup ——————————\n")
                    calendarIsNotSetup = false
          }
          
          // DEBUG : Print Current Date Shown On Screen
          func printCurrentDate()
          {
                    print("—————————— Current Date On Screen ——————————")
                    // Get Dates Visable In Calendar
                    let visableDates = calendarView.visibleDates()
                    
                    // Get Current Date In View
                    guard let currentDateInView = visableDates.monthDates.first?.date else { return }
                    print("Current Date In View : \(currentDateInView)")
                    
                    // Get Current Month In View From Current Date
                    let currentMonthInView = Calendar.current.dateComponents([.month], from: currentDateInView).month!
                    print("Current Month In View \(currentMonthInView)")
                    
                    // Get Current Year In View From Current Date
                    let currentYearInView = Calendar.current.component(.year, from: currentDateInView)
                    print("Current Year In View \(currentYearInView)\n")
          }
}
































