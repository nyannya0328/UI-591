//
//  Home.swift
//  UI-591
//
//  Created by nyannyan0328 on 2022/06/19.
//

import SwiftUI
import MapKit

struct Home: View {
    @State var isPresented : Bool = false
    var body: some View {
        ZStack{
            
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 10, longitude: 10), latitudinalMeters: 10000, longitudinalMeters: 10000)
        
            Map(coordinateRegion: .constant(region))
                .ignoresSafeArea()
                .overlay(alignment: .topTrailing) {
                    
                    Button {
                        
                        isPresented.toggle()
                        
                    } label: {
                        
                         Image(systemName: "gearshape.fill")
                            .font(.title2)
                    }
                    .padding()

                }
                .BottomSheet(presentationDentes: [.medium,.large,.height(50)], isPresented: .constant(true), sheeetCorneRadius: 10) {
                    
                    ScrollView(.vertical,showsIndicators: false){
                        
                        VStack{
                            
                            TextField("Search", text: .constant(""))
                                .padding(.vertical,10)
                                .padding(.horizontal)
                                .background{
                                 
                                    RoundedRectangle(cornerRadius: 10,style: .continuous)
                                        .fill(.ultraThinMaterial)
                                    
                                }
                                .sheet(isPresented: $isPresented) {
                                    
                                    Text("Q")
                                }
                            
                            songList()
                        }
                        
                        
                    }
                    .padding()
                    .padding(.top)
                    
                } onDissmiss: {
                    
                    
                }

                
                
            
           
        }
    }
    @ViewBuilder
    func songList()->some View{
        
        
        VStack{
            
                
                ForEach(albums){album in
                    
                    HStack{
                        
                        Text("#\(getIndex(album:album) + 1) ")
                            .font(.title.bold())
                        
                        Image(album.albumImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60,height:60)
                            .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
                        
                        
                        VStack(alignment: .leading,spacing: 15) {
                            
                            Text(album.albumName)
                                .font(.title3.bold())
                                
                            
                            HStack{
                                
                                 Image(systemName: "beats.headphones")
                                    .font(.system(size: 10))
                                
                                Text("333333")
                            }
                          .frame(maxWidth: .infinity,alignment: .leading)
                            
                         
                            
                            
                        }
                        
                        
                        Button {
                            
                        } label: {
                            
                             Image(systemName: "suit.heart.fill")
                                .font(.title3)
                        }
                        
                        Button {
                            
                        } label: {
                            
                             Image(systemName: "ellipsis")
                                .font(.title3)
                        }

                        
                        
                        
                    }
                    
                   
                    
                }
            
        }
        .padding(.top,10)
      
        
     
        
        
    }
    func getIndex(album : Album)->Int{
        
        return albums.firstIndex { calbum in
            calbum.id == album.id
        } ?? 0
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
