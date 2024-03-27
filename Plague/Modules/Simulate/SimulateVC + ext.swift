import UIKit

extension SimulateViewController:
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        guard
            let rows = rows,
            let lastRow = lastRow
        else
            { return 7 }
        if section == rows {
            return lastRow
        }
        return 7
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let rows = rows else { return 20 }
        return rows + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HumanCell.identifier,
                for: indexPath
            ) as? HumanCell
        else {
            fatalError("Unable deque cell...")
        }
        
        let isInfected = infected.contains(Coord(
                row: indexPath.section, column: indexPath.row
            )
        )
        cell.configure(isInfected)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let clickedCell = collectionView.cellForItem(
            at: indexPath
        ) as? HumanCell {
            clickedCell.markAsInfected()
            presenter?.humanInfected(indexPath.section, indexPath.row)
            updateCounts()
        }
    }
}
