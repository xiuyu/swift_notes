import BeeHive
import ModuleProtocol

public class MineViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(type: .custom)
        
        btn.setTitle("MinePageAction", for: .normal)
        btn.setTitleColor(.green, for: .normal)
        btn.backgroundColor = .green
        btn.frame = CGRect(x: 100, y: 100, width: 200, height: 80)
        self.view.addSubview(btn)
        
        btn.addTarget(self, action: #selector(MineViewController.btnHandler), for: .touchUpInside)
    }
    
    @objc func btnHandler() {
        let provider = BeeHive.shareInstance()?.createService(SeeSomeOneUserCardProtocol.self) as? SeeSomeOneUserCardProtocol
        
        provider?.openUserCard(userId: 888)
        
     
        
    }
}
