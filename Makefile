CI ?= false
BUILD_TYPE ?= Debug
GRADLE_ARGS ?= --build-cache

ifeq ($(CI), true)
  GRADLE_ARGS += --console 'plain'
endif

all: clean lint test assemble bundle
.PHONY: all

assemble:
	./gradlew assemble${BUILD_TYPE} ${GRADLE_ARGS}
.PHONY: assemble

bundle:
	./gradlew bundle${BUILD_TYPE} ${GRADLE_ARGS}
.PHONY: bundle

clean:
	./gradlew clean ${GRADLE_ARGS}
.PHONY: clean

lint:
	./gradlew lint${BUILD_TYPE} ${GRADLE_ARGS}
.PHONY: lint

test:
	./gradlew test${BUILD_TYPE}UnitTest ${GRADLE_ARGS}
.PHONY: test
