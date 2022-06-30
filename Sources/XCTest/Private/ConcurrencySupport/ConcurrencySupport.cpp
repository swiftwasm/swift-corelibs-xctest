#define SWIFT_CC_swift __attribute__((swiftcall))
#define SWIFT_CC(CC) SWIFT_CC_##CC

#define SWIFT_ATTRIBUTE_FOR_IMPORTS __attribute__((__visibility__("default")))
#define SWIFT_EXPORT_FROM_ATTRIBUTE(LIBRARY) SWIFT_ATTRIBUTE_FOR_IMPORTS
#define SWIFT_EXPORT_FROM(LIBRARY) SWIFT_EXPORT_FROM_ATTRIBUTE(LIBRARY)


SWIFT_EXPORT_FROM(swift_Concurrency)
extern void *_Nullable swift_task_enqueueGlobal_hook;

extern "C" SWIFT_EXPORT_FROM(swift_Concurrency) SWIFT_CC(swift)
void swift_task_asyncMainDrainQueue [[noreturn]]();

SWIFT_CC(swift)
extern "C" void XCTMainRunLoopMain(void) {
    // If the global executor is handled by outside environment (e.g. JavaScript),
    // we can't donate thread because it will stop the outside event loop.
    if (swift_task_enqueueGlobal_hook == nullptr) {
        swift_task_asyncMainDrainQueue();
    }
}
