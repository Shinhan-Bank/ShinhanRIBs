//
//  CellPresentable.swift
//  ShinhanRIBs
//
//  Created by xloha on 2022/06/27.
//

public protocol CellPresentable: AnyObject {}

public protocol CellActionLogic: AnyObject {}

public protocol CellPresentationLogic: AnyObject {}

open class CellPresenter<CellBusinessLogic>:
    CellPresentable,
    CellActionLogic,
    CellPresentationLogic
{
    public let interactor: CellBusinessLogic
    
    public init(interactor: CellBusinessLogic) {
        self.interactor = interactor
    }
}
