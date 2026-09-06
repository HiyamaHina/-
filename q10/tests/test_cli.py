import pytest
from greetlab.cli import main

def test_blank_name_exits_with_code_2(monkeypatch):
    with pytest.raises(SystemExit) as exc_info:
        monkeypatch.setattr("sys.argv", ["cli.py", "--name", "   "])
        main()
    assert exc_info.value.code == 2
