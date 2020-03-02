import UIKit

class NewGameViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var saveButton: UIButton!

    var presenter: NewGameyPresenterType!
    var game = Game()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = UIColor(named: "OuterSpace")
        navigationController?.title = "New Game"
        navigationController?.navigationBar.tintColor = UIColor(named: "AntiFlashWhite")
        navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveNewGame))

        saveButton.layer.cornerRadius = 8
        saveButton.addTarget(self, action: #selector(saveNewGame), for: .touchUpInside)

        tableView.register(UINib(nibName: "\(TextFieldCell.self)", bundle: nil), forCellReuseIdentifier: "textFieldID")
        tableView.register(UINib(nibName: "\(StepCounterTableCell.self)", bundle: nil), forCellReuseIdentifier: "stepCounterID")
        tableView.delegate = self
        tableView.dataSource = presenter
    }

    @objc func saveNewGame() {
        // check if the game is valid
        // return to match history and reload tableview
    }

}

extension NewGameViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(named: "RichBlack")
        return view
    }
}

extension NewGameViewController: NewGameListType {
    
}

extension NewGameViewController: StepperDelegate {
    func stepperValueChanged(value: Int, stat: String) {
        switch stat {
        case NewGamePresenter.Rows.shots.rawValue:
            game.shots = value
        case NewGamePresenter.Rows.goals.rawValue:
            game.goals = value
        case NewGamePresenter.Rows.assists.rawValue:
            game.assists = value
        case NewGamePresenter.Rows.saves.rawValue:
            game.saves = value
        default:
            break
        }
        print("shots: \(game.shots)")
        print("goals: \(game.goals)")
        print("assists: \(game.assists)")
        print("saves: \(game.saves)")
        print("points: \(game.points)")
    }
}

extension NewGameViewController: TextFieldDelegate {
    func pointsValueChanged(value: String) {
        guard let points = Int(value) else {
            print("not a number")
            return
        }
        game.points = points
    }
}
