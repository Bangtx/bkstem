from .schema import Schema
from datetime import date
from typing import Optional
from .item import Item
from .variety import Variety
from .quality import Quality
from .size import Size
from .unit import Unit


class BaseQuickInput(Schema):
    code: int


class QuickInput(BaseQuickInput):
    id: int
    item: Item
    variety: Variety = None
    size: Size = None
    quality: Quality = None
    quantity: int = None
    unit: Unit = None

    order_num: int = None
    search_str: str = None
    active: bool = True
    created_at: date
    created_by: int = None


class QuickInputCreate(BaseQuickInput):
    item: int
    variety: Optional[int] = None
    size: Optional[int] = None
    quality: Optional[int] = None
    unit: Optional[int] = None
    quantity: int = None


class QuickInputUpdate(BaseQuickInput):
    item: int
    variety: Optional[int] = None
    size: Optional[int] = None
    quality: Optional[int] = None
    unit: Optional[int] = None
    quantity: int = None
