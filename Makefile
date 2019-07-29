JET_VERSION ?= 2.11.0
JET_SHA256SUM ?= a228babd74c45a52acbc15aae6d4aaf8e2cc552c06a57c6fad8664ad4357a190

build:
	docker build \
    --build-arg JET_VERSION=$(JET_VERSION) \
    --build-arg JET_SHA256SUM=$(JET_SHA256SUM) \
    -t tobiashm/codeship-jet:$(JET_VERSION) \
    .
