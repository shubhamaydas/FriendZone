import UIKit

class ViewController:UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    @IBOutlet var tableView: UITableView!
    var datasource = TableViewDataSource()
    var selectedFriend = -1

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = datasource
        
        title = "Friend Zone"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFriend))
    }


//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectedFriend = indexPath.row
//        coordinator?.configure(friend: friends[indexPath.row])
//    }

    @objc func addFriend() {
        let friend = Friend()
//        friends.append(friend)
//        tableView.insertRows(at: [IndexPath(row: friends.count - 1, section: 0)], with: .automatic)
//        saveData()
//
//        selectedFriend = friends.count - 1
        coordinator?.configure(friend: friend)
    }

    func update(friend: Friend) {
        guard selectedFriend >= 0 else { return }

        tableView.reloadData()
//        friends[selectedFriend] = friend
//        saveData()
    }

}

