// https://github.com/Quick/Quick

import Quick
import Nimble
import Trail

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("it passes these tests") {

            it("can do maths") {
                expect(2) == 2
            }

            it("can read") {
                expect("number") == "number"
            }

            it("will eventually fail") {
                expect("time").toEventually( equal("done") )
            }
          
            context("these will pass") {

                it("can do maths") {
                    expect(23) == 23
                }

                it("can read") {
                    expect("🐮") == "🐮"
                }

                it("will eventually pass") {
                    var time = "passing"

                    dispatch_async(dispatch_get_main_queue()) {
                        time = "done"
                    }

                    waitUntil { done in
                        NSThread.sleepForTimeInterval(0.5)
                        expect(time) == "done"

                        done()
                    }
                }
            }
        }
    }
}
