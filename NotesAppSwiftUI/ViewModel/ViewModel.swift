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
}


