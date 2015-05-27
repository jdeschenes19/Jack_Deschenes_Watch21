

import UIKit
import WatchKit

class tableRowController: NSObject {
    
    @IBOutlet var button: WKInterfaceButton!
    
    var itemIsDone = false
    
    @IBOutlet var rowLabel: WKInterfaceLabel!
    
    @IBAction func buttonAction() {
    
        if itemIsDone == false {
            
            button.setBackgroundImageNamed("checkbox.png")
            
            itemIsDone = true
            
        } else {
            
            button.setBackgroundImageNamed("67563-Metal-White-And-Black-Square-Background.jpg")
            
            itemIsDone = false
            
        }
        
    }
    
}
