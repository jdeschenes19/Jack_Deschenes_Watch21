

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    var defaults = NSUserDefaults(suiteName: "group.com.JackDeschenes.toDoList")
    
    @IBOutlet var item: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        
        if item.text != "" {
        
            toDoList.append(item.text)
            
        }
        
        item.text = ""
        
        defaults?.setObject(toDoList, forKey: "toDoList")
        
        defaults?.synchronize()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.item.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        item.resignFirstResponder()
        return true
        
    }
    
}

