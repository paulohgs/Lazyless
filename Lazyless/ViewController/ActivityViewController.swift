import UIKit
import SwiftUI

class ActivityViewController: UIViewController {
    
    @IBOutlet var field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildLayout()
    }
    
}
extension ActivityViewController: ViewCoding {
    func setupView() {
        view.backgroundColor = UIColor.init(named: "secondColor")
    }
    
    func setupContrainsts() {
        print("")
    }
    
    func setupHierarchy() {
        print("")
    }
    
    
}
