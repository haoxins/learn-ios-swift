
pre-build:
	mkdir -p build

build: pre-build
	xcrun -sdk iphoneos \
		swiftc \
		-target armv7-apple-ios9.0 \
		uikit.swift -o build/uikit.o

clean:
	rm -rf build

.PHONY: build clean test
