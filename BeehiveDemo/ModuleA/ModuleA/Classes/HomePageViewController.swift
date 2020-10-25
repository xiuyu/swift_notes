
import UIKit
import BeeHive
import ModuleProtocol
import ModuleNetwork

public class HomePageViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()

        let btn = UIButton(type: .custom)

        btn.setTitle("HomePageAction", for: .normal)
        btn.setTitleColor(.green, for: .normal)
        btn.backgroundColor = .red
        btn.frame = CGRect(x: 100, y: 100, width: 200, height: 80)
        self.view.addSubview(btn)
        
        //
        let provider = BeeHive.shareInstance()?.createService(SendGiftProtocol.self) as? SendGiftProtocol
        
        provider?.send()
        
        
     
        
        
    
//       let a =  XiuyuNetworking();
//        a.get
        
//        XiuyuNetworking.forwardingTarget(NSObject)
        
    }
}
