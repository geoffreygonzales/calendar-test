//
//  JournalViewController.swift
//  Honeydew
//
//  Created by Geoffrey Gonzales on 10/4/17.
//  Copyright © 2017 Sunlight. All rights reserved.
//


import UIKit
import JTAppleCalendar

class JournalViewController: UIViewController//, JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource
{
          @IBOutlet weak var label: UILabel!
          @IBOutlet weak var calendarButton: UIButton!
          @IBOutlet weak var calendarDismissButton: UIButton!
          @IBOutlet weak var calendarView: JTAppleCalendarView!
          @IBOutlet weak var calendarBackground: UIView!
          @IBOutlet weak var calendarContainer: UIView!
          
          // Running Values For The Start And End Dates Of The Loaded Calendar
          var startDate = Date() // Returns Current Day If Not Set
          var endDate = Date() // Returns Current Day If Not Set
          
          /// Running Value To Determine If The Calendar Is Visable Or Is Below The Screen
          var calendarIsSleeping = true
          
          /// Switch For Preventing View Did Layout Subviews To Call Calendar Setup Funtions
          var calendarIsNotSetup = true
          
          override func viewDidLoad()
          {
                    print("—————————— View Did Load —————————— \n")
                    
                    super.viewDidLoad()
                    
          }
          
          // Called Before View Appears
          // Set Calendar Size, Set Calendar Content Size, Jump Today, And Hide Calendar Force This To Be Called After View Did Appear
          // Is Recalled When Date Segment Info Is Gotten
          // JT Apple Calendar Sets The Size And Position Of The Calendar Form Interface Builder Specifications Durring This Funtion
          override func viewDidLayoutSubviews()
          {
                    print("—————————— View Did Layout Subviews —————————— \n")
                    
                    super.viewDidLayoutSubviews()
                    
                    if calendarIsNotSetup
                    {
                              jumpToToday()
                              hideCalendar()
                    }
                    
          }
          
          override func viewWillAppear(_ animated: Bool)
          {
                    print("—————————— View Will Appear —————————— \n")
                    super.viewWillAppear(animated)
          }
          
          override func viewDidAppear(_ animated: Bool)
          {
                    print("—————————— View Did Appear —————————— \n")
                    super.viewDidAppear(animated)
          }
          
          
          override func viewWillLayoutSubviews()
          {
                    print("—————————— View Will Layout Subviews —————————— \n")
                    
                    super.viewWillLayoutSubviews()
          }
          @IBAction func showCalendar(_ sender: Any)
          {
                    wakeUpCalendar()
          }
          @IBAction func hideCalendar(_ sender: Any)
          {
                    putCalendarToSleep()
                    
                    // Run With It And With IT Commented Out
                    // Check Out The Console Too Durring
                    label.text = ""
                    
          }
}












