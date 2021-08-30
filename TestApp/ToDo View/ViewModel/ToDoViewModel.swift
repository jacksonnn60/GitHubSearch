//
//  ToDoViewModel.swift
//  TestApp
//
//  Created by Jackson  on 30.08.2021.
//

import Foundation
import RxCocoa
import RxSwift

protocol ToDoViewModelProtocol {
    var toDoImtems: BehaviorSubject<[ToDoItem]> { get set }

    func addItem(name: String)
}

class ToDoViewModel: ToDoViewModelProtocol {
    var toDoImtems = BehaviorSubject<[ToDoItem]>.init(value: [])

    func addItem(name: String) {
        let toDoItem = ToDoItem(name: name)
        do {
            try toDoImtems.onNext(toDoImtems.value() + [toDoItem])
        } catch {
            print("Item can not be added.")
        }
    }
}
