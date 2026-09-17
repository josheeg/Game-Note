from src.main import get_standard_greeting, get_custom_greeting

def test_standard_greeting() -> None:
    assert get_standard_greeting() == "Hello, World!"

def test_custom_greeting() -> None:
    assert get_custom_greeting("Alice") == "Hello, Alice!"