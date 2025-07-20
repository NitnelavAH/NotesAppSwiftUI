//
//  ViewModel.swift
//  NotesAppSwiftUI
//
//  Created by Developer on 29/05/25.
//

import Foundation
import CoreData
import SwiftUI

class ViewModel: ObservableObject {
    @Published var nota = ""
    @Published var fecha = Date()
    @Published var show = false
    @Published var updateItem: Notas!
    
    //CoreData
    
    func saveData(context: NSManagedObjectContext){
        let newNote = Notas(context: context)// Nombre del entity
        newNote.nota = nota
        newNote.fecha = fecha
        
        do {
            try context.save()
            print("Guardo")
            show.toggle()
        } catch let error as NSError {
            print("No guardo", error.localizedDescription)
        }
    }
    
    func deleteData(item: Notas, context: NSManagedObjectContext) {
        context.delete(item)
        
        //try! context.save()  omitir do catch
        
        do {
            try context.save()
            print("Elimino")

        } catch let error as NSError {
            print("No elimino", error.localizedDescription)
        }
    }
    
    func sedData(item: Notas) {
        updateItem = item
        nota = item.nota ?? ""
        fecha = item.fecha ?? Date()
        
        show.toggle()
    }
    
    func editData(context: NSManagedObjectContext) {
        updateItem.fecha = fecha
        updateItem.nota = nota
        
        do {
            try context.save()
            print("Edito")
            show.toggle()
        } catch let error as NSError {
            print("No edito", error.localizedDescription)
        }
    }
}


