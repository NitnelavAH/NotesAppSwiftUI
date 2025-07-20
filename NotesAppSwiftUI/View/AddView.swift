//
//  AddView.swift
//  NotesAppSwiftUI
//
//  Created by Developer on 29/05/25.
//

import SwiftUI

struct AddView: View {

    @ObservedObject var model: ViewModel
    @Environment(\.managedObjectContext) var context

    var body: some View {
        VStack {
            Text(model.updateItem == nil ?
                 "Agregar nota" :
                    "Editar nota"
            )
                .font(.largeTitle)
                .bold()

            Spacer()
            
            TextEditor(text: $model.nota)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                )
                .font(.body)
                .foregroundColor(.primary)
            
            Spacer(minLength: 16)
            Divider()
            Spacer(minLength: 16)
            DatePicker("Seleccionar fecha", selection: $model.fecha)
            Spacer(minLength: 16)
            Button(action: {
                if model.updateItem != nil {
                    model.editData(context: context)
                } else {
                    model.saveData(context: context)
                }
                model.nota = ""
                model.fecha = Date()
            }) {
                Label(
                    title: { Text("Guardar").foregroundColor(.white).bold() },
                    icon: { Image(systemName: "plus").foregroundColor(.white) }
                )
            }
                .padding()
                .frame(width: UIScreen.main.bounds.width - 30)
                .background(model.nota == "" ? .gray : .blue)
                .cornerRadius(8)
                .disabled(model.nota == "" ? true : false)
            
        }.padding()
    }
}

#Preview {
    AddView(model: ViewModel())
}
