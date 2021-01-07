//
//  CustomCollectionLayout.swift
//  XO
//
//  Created by Admin on 07.01.2021.
//

import UIKit

class CustomCollectionLayout: UICollectionViewLayout {
    var cacheAttributes = [IndexPath: UICollectionViewLayoutAttributes]()
                                          // Хранит атрибуты для заданных индексов

    var columnsCount = 3                  // Количество столбцов

    var cellHeight: CGFloat = 0       // Высота ячейки

    private var totalCellsHeight: CGFloat = 0 // Хранит суммарную высоту всех ячеек
    
    override func prepare() {
        self.cacheAttributes = [:] // Инициализируем атрибуты
        // Проверяем наличие collectionView
        guard let collectionView = self.collectionView else { return }
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        // Проверяем, что в секции есть хотя бы одна ячейка
        guard itemsCount > 0 else { return }
        cellHeight = collectionView.frame.width / CGFloat(self.columnsCount)    
        for index in 0..<itemsCount / columnsCount {
            for secondIndex in 0..<itemsCount / columnsCount{
              let indexPath = IndexPath(item: ((secondIndex * columnsCount) + index), section: 0)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = CGRect(x: cellHeight * CGFloat(index), y: cellHeight * CGFloat(secondIndex),
                                          width: cellHeight, height: self.cellHeight)
                cacheAttributes[indexPath] = attributes
            }
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cacheAttributes.values.filter { attributes in
            return rect.intersects(attributes.frame)
        }
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cacheAttributes[indexPath]
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: (collectionView?.frame.width)!,
                      height: (collectionView?.frame.height)!)
    }
}
