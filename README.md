# Observable Swift

`Observable` on Swift. 
Class: https://github.com/iqbalansyor/ObservableSwift/tree/master/ObservableSwift/Observable

##### Hopefully, it can be an alternative to ViewModel's Action and Protocol without much hassles.

##### TODO
- Creating a dummy flow to better understanding using of this class with view model
- Adding documentation how to using this class on `.md` (v)

##### How to use it

###### Initializer
```let stringPassed: Observable<String> = Observable(value: "initial value")```

###### Publish value
```viewModel.stringPassed.value = "String Passed"```

###### Trigger block on `Void`
```viewModel.voidPassed.next()```

###### Subscribe value
```viewModel.stringPassed.subscribe(observer: self) { [weak self] (text) in // Change value here }```

##### Observable on Objective-C
Previous research `ObservableProtocol` on Objective-C: https://github.com/iqbalansyor/ObserverProtocol

###### Limitation of Objective-C:
- Generic type can't provide for primitive type (`BOOL`, `float`, `Void` and etc)

#### Create an `issue` if anything you want to ask or contribute.

#### Reference
- https://colindrake.me/post/an-observable-pattern-implementation-in-swift/
- https://github.com/ReactiveX/RxSwift
