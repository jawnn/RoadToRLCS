import UIKit

protocol NewGameyPresenterType: AnyObject, UITableViewDataSource {

}

protocol NewGameListType: AnyObject {

}

class NewGamePresenter: NSObject, NewGameyPresenterType {

    enum Sections: CaseIterable {
        case Stats
        case Rank
        case Results
    }

    enum Rows: String, CaseIterable {
        case points = "Points"
        case shots = "Shots"
        case goals = "Goals"
        case assists = "Assists"
        case saves = "Saves"
        case league = "League"
        case place = "Place"
        case mvp = "MVP"
        case result = "Result"
    }

    var model: NewGameModelType
    var view: NewGameListType

    init(model: NewGameModelType, view: NewGameListType) {
        self.model = model
        self.view = view
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Rows.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Rows.allCases[indexPath.row] {
        case .points:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldID") as? TextFieldCell, let vc = view as? NewGameViewController else {
                return UITableViewCell()
            }
            cell.delegate = vc
            return cell
        case .shots, .goals, .assists, .saves:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "stepCounterID") as? StepCounterTableCell, let vc = view as? NewGameViewController else {
                return UITableViewCell()
            }
            cell.titleLabel.text = Rows.allCases[indexPath.row].rawValue
            cell.delegate = vc
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
}
