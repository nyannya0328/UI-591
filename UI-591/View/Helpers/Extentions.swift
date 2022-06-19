//
//  Extentions.swift
//  UI-591
//
//  Created by nyannyan0328 on 2022/06/19.
//

import SwiftUI

extension View{
    @ViewBuilder
    func BottomSheet<Content : View>(
    
        presentationDentes : Set<PresentationDetent>,
        isPresented : Binding<Bool>,
        dragIndicatior : Visibility = .visible,
        largesUndimmedIdentifire : UISheetPresentationController.Detent.Identifier = .large,
        isTranslateBG : Bool = false,
        interactiveDisabel : Bool = true,
        sheeetCorneRadius : CGFloat?,
        @ViewBuilder content : @escaping()->Content,
        onDissmiss : @escaping()->()
        
        
        
    
    
    
    
    
    ) -> some View{
        
        
        self
        sheet(isPresented: isPresented) {
            
            onDissmiss()
            
         
        } content:{
            
            content()
                .presentationDetents(presentationDentes)
                .presentationDragIndicator(dragIndicatior)
                .interactiveDismissDisabled(interactiveDisabel)
                .onAppear{
                    
                    guard let windows = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
                        
                        return
                    }
                    

                    
                    if let controller = windows.windows.first?.rootViewController?.presentedViewController,let sheet = controller.presentationController as? UISheetPresentationController{

                        
                        
                        if isTranslateBG{
                            controller.view?.backgroundColor = .clear
                            
                        }
                        
                        controller.presentingViewController?.view.tintAdjustmentMode = .normal
                        sheet.largestUndimmedDetentIdentifier = largesUndimmedIdentifire
                        sheet.preferredCornerRadius = sheeetCorneRadius
                        
                    
                        
                    
                    }
                    else{
                        
                        
                        print("S")
                    }
                }
        }
        
        
    }
    
    
}
