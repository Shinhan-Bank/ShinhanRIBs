//
//  CellInteractor.swift
//  ShinhanRIBs
//
//  Created by xloha on 2022/06/27.
//

import Combine

public protocol CellInteractable: AnyObject {}

public protocol CellBusinessLogic: AnyObject {}

open class CellInteractor: CellInteractable, CellBusinessLogic {
    
    public var cancellables: Set<AnyCancellable> = .init()
    
    public init() {}
    
    deinit {
        cancellables = []
    }
}

/// Interactor related `AnyCancellable` extensions.
public extension AnyCancellable {
    @discardableResult
    func cancelWith(interactor: CellInteractor) -> AnyCancellable {
        store(in: &interactor.cancellables)
        return self
    }
}
