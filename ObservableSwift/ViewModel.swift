//
//  ViewModel.swift
//  ObservableSwift
//
//  Created by Iqbal.ansyori on 07/05/19.
//  Copyright © 2019 Iqbal.ansyori. All rights reserved.
//

import Foundation

class ViewModel {
    
    let stringPassed: Observable<String> = Observable(value: "initial value")
    
    let voidPassed: Observable<Void> = Observable(value: ())
    
}
