//
//  CoreDataStack.swift
//  HW4
//
//  Created by Mac on 24.12.2023.
//

import CoreData

class CoreDataStack {
    static let shared = CoreDataStack() // Реализация с использованием паттерна Singleton

    private init() {} // Приватный инициализатор для Singleton

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FriendsDataModel")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Не удается загрузить хранилище: \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Ошибка сохранения контекста: \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

