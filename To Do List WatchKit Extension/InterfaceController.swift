

import WatchKit
import Foundation

var toDoList = [String]()

class InterfaceController: WKInterfaceController {
    
    func loadTableData() {
        
        watchTable.setNumberOfRows(toDoList.count, withRowType: "tableRowController")
        
        for (index, value) in enumerate(toDoList) {
            
            let row = watchTable.rowControllerAtIndex(index) as! tableRowController
            
            row.rowLabel.setText(value)
            
        }
        
    }
    
    var defaults = NSUserDefaults(suiteName: "group.com.JackDeschenes.toDoList")
    
    @IBOutlet var watchTable: WKInterfaceTable!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if defaults?.objectForKey("toDoList") != nil {
            
            toDoList = defaults?.objectForKey("toDoList") as! [String]
            
        }
        
        loadTableData()
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
            
        toDoList.removeAtIndex(rowIndex)
            
        defaults?.setObject(toDoList, forKey: "toDoList")
        
        defaults?.synchronize()
            
        loadTableData()
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
