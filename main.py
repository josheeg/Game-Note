"""A Python CLI hello world program."""

import argparse


def main() -> None:
    parser = argparse.ArgumentParser(description="A Python CLI hello world program.")
    parser.add_argument(
        "--name",
        default="World",
        help="Name to greet (default: World)",
    )
    args = parser.parse_args()
    print(f"Hello, {args.name}!")


if __name__ == "__main__":
    main()
