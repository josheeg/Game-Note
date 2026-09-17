import sys

def get_standard_greeting() -> str:
    """Request 1: Default console hello world message."""
    return "Hello, World!"

def get_custom_greeting(name: str) -> str:
    """Request 2: Personalized hello world message."""
    return f"Hello, {name}!"

def main() -> None:
    if len(sys.argv) > 1:
        print(get_custom_greeting(sys.argv[1]))
    else:
        print(get_standard_greeting())

if __name__ == "__main__":
    main()