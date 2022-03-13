from .schema import Schema
from datetime import date
from typing import Optional


class BoxTypeBase(Schema):
    name: str
    short_name: Optional[str] = None
    yomi: Optional[str] = None
    name_eng: Optional[str] = None
    bundle_size: Optional[int] = None


class BoxTypeCreate(BoxTypeBase):
    pass


class BoxTypeUpdate(BoxTypeBase):
    pass


class BoxTypeSort(Schema):
    id: int
    order_num: Optional[int]


class BoxType(BoxTypeBase):
    id: int
    order_num: Optional[int]
    search_str: str = None
    active: bool = True
    created_at: date
    created_by: int = None
