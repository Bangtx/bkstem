from .schema import Schema
from datetime import date
from typing import Optional


class QualityGroupBase(Schema):
    name: str
    name_eng: Optional[str] = None
    yomi: Optional[str] = None
    short_name: Optional[str]


class QualityGroupCreate(QualityGroupBase):
    pass


class QualityGroupSort(Schema):
    id: int
    order_num: Optional[int]


class QualityGroupUpdate(QualityGroupBase):
    pass


class QualityGroup(QualityGroupBase):
    id: int
    order_num: Optional[int]
    search_str: str = None
    active: bool = True
    is_default: bool
    created_at: date
    created_by: int = None
