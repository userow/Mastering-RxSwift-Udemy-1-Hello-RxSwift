import UIKit
//import Combine
import RxSwift

//_ = Observable.from([1,2,3,4,5 ])

//let smt: Publishers.
//
//let observable = Observable.just(1)
//
//let observable2 = Observable.of(1,2,3)
//
//let observable3 = Observable.of([1,2,3])
//
//let observable4 = Observable.from([1,2,3,4,5,6])
//
//observable4.subscribe { event in
//	if let element = event.element {
//		print(element)
//	}
//}
//
//observable3.subscribe { event in
//	if let element = event.element {
//		print(element)
//	}
//}
//
//let subs4 = observable4.subscribe(onNext: { element in
//	print(element)
//})
//
//subs4.dispose()


//let disposeBag = DisposeBag()
//
//Observable.of("A", "B", "C")
//	.subscribe {
//	print($0)
//}.disposed(by: disposeBag)
//
//
//Observable<String>.create { observer in
//	observer.onNext("A")
//	observer.onCompleted()
//	observer.onNext("?")
//	return Disposables.create()
//}.subscribe(onNext: { print($0) }, onError: { print($0) }, onCompleted: { print("completed") }, onDisposed: { print("disposed") }).disposed(by: disposeBag)

/// 13 - PublishSubject
class PublishSubjTest {
	static func run() {
		print("13 - PublishSubject")
		let disposeBag = DisposeBag()

		let subject = PublishSubject<String>()
		subject.onNext("Issue 1")

		subject.subscribe { event in
			print(event)
		}

		subject.onNext("Issue 2")
		subject.onNext("Issue 3")

		subject.onCompleted()

		subject.dispose()

		subject.onNext("Issue 4")
	}
}
PublishSubjTest.run()

/// 14 - BehaviorSubject
class BehaviorSubjTest {
	static func run() {
		print("14 - BehaviorSubject")
		let disposeBag = DisposeBag()

		let subject = BehaviorSubject<String>(value: "Initial Value")

		subject.disposed(by: disposeBag)

		subject.onNext("Last Issue")

		subject.subscribe { event in
			print(event)
		}

		subject.onNext("Issue 1")
	}
}
BehaviorSubjTest.run()

/// 15 - Replay subject
class ReplaySubjTest {
	static func run() {
		print("15 - Replay subject")
		let disposeBag = DisposeBag()

		let subject = ReplaySubject<String>.create(bufferSize: 3)

		subject.disposed(by: disposeBag)

		subject.onNext("Issue 1")
		subject.onNext("Issue 2")
		subject.onNext("Issue 3")
		subject.onNext("Issue 4")

		subject.subscribe { event in
			print("sub 1 - \(event)")
		}

		subject.onNext("Issue 5")
		subject.onNext("Issue 6")
		subject.onNext("Issue 7")
		subject.onNext("Issue 8")

		subject.subscribe { event in
			print("sub 2 - \(event)")
		}
	}
}
ReplaySubjTest.run()

/// 16 - Value
class ValueTest1 {
	static func run() {
		print("16 - Variable - 1")
		let disposeBag = DisposeBag()

		let variable = Variable("Ibnitial Value")

		variable.asObservable().subscribe { event in
			print(event)
		}

		variable.value = "Test"
	}
}
ValueTest1.run()

class ValueTest2 {
	static func run() {
		print("16 - Variable - 2")
		let disposeBag = DisposeBag()

		let variable = Variable([String]())
		variable.value.append("Item 1")

		variable.asObservable().subscribe { event in
			print(event)
		}

		variable.value.append("Item 2")
	}
}
ValueTest2.run()


import RxCocoa

/// 17 - BehaviorRelay
class BehaviorRelTest1 {
	static func run() {
		print("17 - BehaviorRelay - 1")

		let disposeBag = DisposeBag()

		let relay = BehaviorRelay(value: "Initial Value")

		relay.asObservable().subscribe { event in
			print(event)
		}

		relay.accept("Next Value")
	}
}
BehaviorRelTest1.run()

/// 17 - BehaviorRelay - 2
class BehaviorRelTest2 {
	static func run() {
		print("17 - BehaviorRelay - 2")

		let disposeBag = DisposeBag()

		let relay = BehaviorRelay(value: ["Item 1"])

		relay.asObservable().subscribe { event in
			print(event)
		}

		relay.accept(relay.value + ["Item 2"])
	}
}
BehaviorRelTest2.run()
