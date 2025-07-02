//
//  ContentView.swift
//  WishList
//
//  Created by adithyan na on 8/6/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    //MARK: - VARIABLES
    @Environment(\.modelContext) private var modelContext
    @Query private var model: [Model]
    @State private var isAlertPresented: Bool = false
    @State private var titleWish: String = ""
    @State private var showAlert = false
    
    
    var body: some View {
       
        NavigationStack{
            List{
                ForEach(model){ models in
                    
                    Text(models.title)
                        .padding(5)
                        .fontWeight(.bold)
                        .swipeActions {
                            Button("Delete", role: .destructive){
                              
                                self.modelContext.delete(models)
                            }
                        }
                    
                }
            }
            .navigationTitle("Wishlist")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        self.isAlertPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.headline)
                            
                    }

                }
            }
            .alert("Create a wish",isPresented: $isAlertPresented){
                
               TextField("Enter a wish", text: $titleWish)
                
                Button("Add"){
                    if titleWish.isEmpty{
                       showAlert = true
                    }else{
                        modelContext.insert(Model(title: titleWish))
                        titleWish = ""
                    }
                    
                    
                }.alert("Please enter a wish", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                }
                
                
            }
           
            
            .overlay{
                if model.isEmpty{
                    ContentUnavailableView("My WishList ", systemImage: "heart.circle.fill",description: Text("Your Wish List is empty. Add your first wish!") )
                        
                }
            }

        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for :Model.self, inMemory: true)
}
