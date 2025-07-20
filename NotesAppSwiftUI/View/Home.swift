//
//  Home.swift
//  NotesAppSwiftUI
//
//  Created by Developer on 29/05/25.
//

import SwiftUI

struct Home: View {

    @StateObject var model = ViewModel()
    @Environment(\.managedObjectContext) var context
//    @FetchRequest(
//        entity: Notas.entity(),
//        sortDescriptors: [
//            NSSortDescriptor(key: "fecha", ascending: true)
//        ],
//        animation: .spring
//    ) var result: FetchedResults<Notas>
    
    @FetchRequest(
        entity: Notas.entity(),
        sortDescriptors: [
            NSSortDescriptor(key: "fecha", ascending: true)
        ],
        predicate: NSPredicate(format: "fecha >= %@", Date() as CVarArg),
        animation: .spring
    ) var result: FetchedResults<Notas>

    var body: some View {
        NavigationView {
            List {
                ForEach(result, id: \.self) { item in
                    VStack(alignment: .leading) {
                        Text(item.nota ?? "Sin nota")
                            .font(.title)
                            .bold()

                        Text(item.fecha ?? Date(), style: .date)

                    }.contextMenu(menuItems: {
                        Button(action: {
                            model.sedData(item: item)
                        }) {
                            Label(
                                title: {
                                    Text("Editar")
                                },
                                icon: {
                                    Image(systemName: "pencil")
                                }
                            )
                        }

                        Button(action: {
                            model.deleteData(
                                item: item, context: context
                            )
                        }) {
                            Label(
                                title: {
                                    Text("Eliminar")
                                },
                                icon: {
                                    Image(systemName: "trash")
                                }
                            )
                        }
                    })
                }
            }.navigationTitle("Notas")
                .navigationBarItems(
                    trailing:
                        Button(
                            action: {
                                model.show.toggle()
                            }
                        ) {
                            Image(systemName: "plus")
                                .font(.title)
                                .foregroundColor(.blue)
                        }
                ).sheet(
                    isPresented: $model.show,
                    content: {
                        AddView(model: model)
                    })
        }
    }
}

#Preview {
    Home()
}
