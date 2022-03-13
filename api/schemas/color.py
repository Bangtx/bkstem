from typing import Optional
from .schema import Schema


class Color(Schema):
    id: int
    code: str
    name: str
    name_eng: Optional[str] = None
    short_name: Optional[str] = None
    order_num: Optional[int] = None
