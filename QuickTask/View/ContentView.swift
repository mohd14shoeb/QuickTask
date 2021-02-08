//
//  ContentView.swift
//  QuickTask
//
//  Created by Mohammad Yasir on 07/02/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var taskVM = TaskListViewModel()
    
    @State var title : String = ""
    @State var subtitle : String = ""
    
    
    var body: some View {
        
        NavigationView{
            
            
            ScrollView {
                ForEach(taskVM.data.indices , id: \.self) { i in
                    
                    
                    VStack{
                        HStack(alignment:.top){
                            Text(taskVM.data[i].title)
                                .font(.system(size: 24, weight: .bold))
                                .frame(maxWidth: 260, alignment: .leading)
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                                .onTapGesture{
                                    taskVM.deleteTask(index:i)
                                }
                        }
                        
                        
                        
                        Text(taskVM.data[i].subtitle)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            
                    }
                    .padding(.top,20)
                    .padding(.horizontal,20)
                    .frame(width: 390, height: 90)
                    .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                    .cornerRadius(30)
                    .shadow(color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).opacity(0.3), radius: 10, x: 0, y: 10)
                    
                    
                    
                }
                
                if taskVM.ask == true{
                    
                    VStack{
                        HStack(alignment:.top){
                            TextField("Title", text: $title)
                                .font(.system(size: 24, weight: .bold))
                                .frame(width: 160, alignment: .leading)
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .onTapGesture{
                                    taskVM.addTask(task: Task(title:title,subtitle:subtitle))
                                    title = ""
                                    subtitle = ""
                                    taskVM.ask = false
                                }
                        }
                        
                        
                        TextField("Subtitle", text: $subtitle)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .foregroundColor(.white)
                        
                    }
                    .padding(.top,20)
                    .padding(.horizontal,20)
                    .frame(width: 390, height: 90)
                    .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                    .cornerRadius(30)
                    .shadow(color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).opacity(0.3), radius: 10, x: 0, y: 10)
                    
                    
                }
                
                
            }.navigationBarTitle("Works")
            .navigationBarItems(trailing: Button(action: {
//                taskVM.addTask(task: Task(title:"new title" , subtitle:"new subtitle"))
                taskVM.ask = true
                
            }) {
                Image(systemName: "plus")
            })
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
