//
//  Observable.swift
//  Traveloka
//
//  Created by Iqbal.ansyori on 28/02/19.
//  Copyright © 2019 Traveloka. All rights reserved.
//

import Foundation

/// User this instance to observe the its `value`
/// - Note: Use `subscribe` to store its `observer` block. The block will be called when `value` changed.
/// - Reference: https://colindrake.me/post/an-observable-pattern-implementation-in-swift/

public final class Observable<T> {
    
    // MARK: Public properties
    
    /// Value of this `Observable` instance
    /// Change this will trigger observer's block
    var value: T {
        didSet {
            trigerObserverBlock(with: value)
        }
    }
    
    typealias ObserverBlock = (_ value: T) -> ()
    typealias ObserverEntry = (observer: String, block: ObserverBlock)
    
    private var observers: Array<ObserverEntry>

    
    init(value: T) {
        self.value = value;
        observers = []
    }
    
    // MARK: Public methods
    
    /// Trigerred `block` when subscribe `Void` type
    /// Only work for `Void`
    
    func next() {
        if (T.self == Void.self) {
            observers.forEach { (entry: ObserverEntry) in
                let (_, block) = entry;
                block(value)
            }
        }
    }
    
    /// Subscribe changes of the `value`
    ///
    /// - Parameters:
    ///   - observer: instance of the observer
    ///   - block: will trigger the block when `value` changed
    func subscribe(observer: AnyObject, block: @escaping ObserverBlock) -> Observable  {
        let entry: ObserverEntry = (observer: hashFor(object: observer), block: block)
        observers.append(entry)
        
        return self
    }
    
    /// Unsubscribe the `value` changes.
    ///
    /// - Parameter observer: instance of the observer
    func unsubscribe(observer: AnyObject) {
        let filtered = observers.filter { (entry: ObserverEntry) -> Bool in
            let (owner, _) = entry
            return owner != hashFor(object: observer)
        }
        
        observers = filtered
    }
    
    /// Trigger first value to observer's `block
    func triggerFirst() {
        trigerObserverBlock(with: value)
    }
    
    // MARK: Private methods
    
    private func hashFor(object: AnyObject) -> String {
        return String(UInt(bitPattern: ObjectIdentifier(object)))
    }
    
    private func trigerObserverBlock(with value: T) {
        observers.forEach { (entry: ObserverEntry) in
            let (_, block) = entry;
            block(value)
        }
    }
}
