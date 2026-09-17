"""Integration tests for main module."""
import subprocess
import sys


def test_main_executes_without_error() -> None:
    """Verify main.py can be executed and produces output."""
    result = subprocess.run(
        [sys.executable, "-m", "src.main"],
        capture_output=True,
        text=True,
        check=False,
    )
    
    # Standard greeting should print to stdout
    assert result.returncode == 0
    assert "Hello, World!" in result.stdout


def test_custom_greeting_with_argument() -> None:
    """Verify main.py accepts custom name argument."""
    result = subprocess.run(
        [sys.executable, "-m", "src.main", "TestUser"],
        capture_output=True,
        text=True,
        check=False,
    )
    
    # Custom greeting should print to stdout
    assert result.returncode == 0
    assert "Hello, TestUser!" in result.stdout