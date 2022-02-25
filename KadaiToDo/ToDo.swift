//
//  ToDo.swift
//  KadaiToDo
//
//  Created by 溝手彩加 on 2022/02/26.
//

import Foundation
import RealmSwift

class ToDo: Object{
    @objc dynamic var ToDoTitle: String? = nil
    @objc dynamic var ToDoSubtitle: String? = nil
    @objc dynamic var deadLine: String? = nil
}
