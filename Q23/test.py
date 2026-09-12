import pytest
from divide import divide

def test_divide_by_zero():
    with pytest.raises(ValueError):
        divide(1, 0)