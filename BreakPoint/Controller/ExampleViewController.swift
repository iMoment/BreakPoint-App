
import UIKit
import Firebase

class ExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func someFunction() {
        do {
            try Auth.auth().signOut()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
