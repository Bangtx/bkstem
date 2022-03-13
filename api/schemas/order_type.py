from .schema import Schema
from typing import Optional


class OrderType(Schema):
    id: int
    name: str
    name_eng: Optional[str] = None
    is_order: bool
