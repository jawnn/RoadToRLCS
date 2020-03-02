import UIKit

protocol MatchHistoryPresenterType: AnyObject, UITableViewDataSource {

}

protocol MatchHistoryListType: AnyObject {
    
}

class MatchHistoryPresenter: NSObject, MatchHistoryPresenterType {

    var model: MatchHistoryModelType
    var view: MatchHistoryListType

    init(model: MatchHistoryModelType, view: MatchHistoryListType) {
        self.model = model
        self.view = view
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.player.games.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ID") as? MatchHistoryTableCell else {
            return UITableViewCell()
        }
        let game = model.player.games[indexPath.row]
        cell.configure(league: game.league, points: game.points, shots: game.shots, goals: game.goals, assist: game.assists, saves: game.saves)
        return cell
    }


}
