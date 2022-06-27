#if USE_SWIFT_CONCURRENCY_WAITER

struct DispatchPredicate {
    static func onQueue<X>(_: X) -> Self {
        return DispatchPredicate()
    }

    static func notOnQueue<X>(_: X) -> Self {
        return DispatchPredicate()
    }
}

func dispatchPrecondition(condition: DispatchPredicate) {}

extension XCTWaiter {
    struct BlockingQueue {
        init(label: String) {}

        func sync<T>(_ body: () -> T) -> T {
            body()
        }
        func async(_ body: @escaping () -> Void) {
            body()
        }
    }

    typealias DispatchQueue = BlockingQueue

    struct RunLoop {
        static let current = RunLoop()
    }

    class Thread: Equatable {
        var threadDictionary: [String: Any] = [:]

        static let current: Thread = Thread()

        static func == (lhs: Thread, rhs: Thread) -> Bool {
            return true
        }
    }
}

extension WaiterManager {
    typealias DispatchQueue = XCTWaiter.DispatchQueue
    typealias Thread = XCTWaiter.Thread
}

#endif
