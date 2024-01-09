install:
	poetry install

lint:
	poetry run flake8 hexlet_python_package

selfcheck:
	poetry check

check: selfcheck test lint

build: check
	poetry build

test-coverage:
	FUNCTION_VERSION=right pytest --cov-report term-missing --cov=src/right tests/test_solution.py

test:
	FUNCTION_VERSION=right PASSED_TESTS=3 pytest tests/test_of_test.py
	FUNCTION_VERSION=wrong1 PASSED_TESTS=0 pytest tests/test_of_test.py
	FUNCTION_VERSION=wrong2 PASSED_TESTS=0 pytest tests/test_of_test.py
	FUNCTION_VERSION=wrong3 PASSED_TESTS=0 pytest tests/test_of_test.py

.PHONY: install test lint selfcheck check build
