import argparse
import sys   
def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--name", required=True)
    args = parser.parse_args()    
    if not args.name.strip():
        sys.exit(2)              
    print(f"Hello, {args.name}!")
