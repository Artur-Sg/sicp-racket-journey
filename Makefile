install:
	raco pkg install sicp
	raco pkg install review

test:
	raco test sicp | grep error

lint:
	@echo "check codestyle"
	@(for f in $$(find sicp -name '*.rkt'); do raco review $$f; done)

.PHONY: test
