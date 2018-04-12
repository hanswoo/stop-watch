
    import UIKit
        
        class ViewController: UIViewController {

        
            @IBOutlet weak var rt: UILabel!
            @IBOutlet weak var sta: UIButton!
            @IBOutlet weak var stoo: UIButton!
            @IBOutlet weak var res: UIButton!
            var count = 0
            var myTimer = Timer()
            override func viewDidLoad() {
                super.viewDidLoad()
                
                
            }
          
            @IBAction func st(_ sender: Any) {
            
            myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in
                    self.updateTime()
                });
                changeButtonState(start: false, stop: true, reset: true)
            }
         
            @IBAction func sto(_ sender: Any) {
            myTimer.invalidate()
                changeButtonState(start: true, stop: false, reset: true)
            }
            
            
            
            @IBAction func re(_ sender: Any) {
            myTimer.invalidate()
                count = 0
                rt.text = String(format:"00:00:00")
                changeButtonState(start: true, stop: true, reset: false)
            }
            func changeButtonState(start: Bool, stop: Bool, reset: Bool){
                sta.isEnabled = start
                stoo.isEnabled = stop
                res.isEnabled = reset
            }
            func updateTime() {
                count = count + 1
                let min = count / 60 / 100
                let sec = (count - (min * 60 * 100)) / 100
                let msec = count - (min * 60 * 100) - (sec * 100)
                rt.text = String(format: "%02d:%02d:%02d", min, sec, msec)
            }
            
            override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
            }

}

