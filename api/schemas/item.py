from typing import Optional, List
from .schema import Schema
import uuid
from datetime import date
from .file import Image
from .size_group import SizeGroup
from .quality_group import QualityGroup


class ItemBase(Schema):
    name: str
    name_eng: Optional[str] = None
    short_name: Optional[str] = None
    yomi: Optional[str] = None


class ItemCreate(ItemBase):
    default_unit: int = None
    units: List[int] = []
    size_group_id: Optional[int] = None
    quality_group_id: Optional[int] = None


class ItemUpdate(ItemBase):
    default_unit: int = None
    units: List[int] = []
    size_group_id: Optional[int] = None
    quality_group_id: Optional[int] = None


class ItemSort(Schema):
    id: int
    order_num: Optional[int]


class Master(Schema):
    id: int
    name: str


class MyItem(ItemBase):
    id: int
    uuid: uuid.UUID
    order_num: Optional[int]
    search_str: str
    default_unit: Master = None
    images: List[Image] = []
    size_group: SizeGroup = None
    quality_group: QualityGroup = None
    active: bool = True
    created_at: date
    created_by: int = None


class ItemUnit(MyItem):
    units: List[Master] = None


class Item(MyItem):
    units: List[int] = None
