from .schema import Schema
from datetime import date
from typing import Optional, List


class QualityBase(Schema):
    name: str
    name_eng: Optional[str] = None
    yomi: Optional[str] = None
    short_name: Optional[str] = None


class QualityCreate(QualityBase):
    quality_group_id: int


class QualityUpdate(QualityBase):
    quality_group_id: int


class QualitySort(Schema):
    id: int
    order_num: Optional[int]


class QualityGroupBasicInfo(Schema):
    id: int
    name: str


class Quality(QualityBase):
    id: int
    order_num: Optional[int]
    search_str: str = None
    active: bool = True
    quality_group: QualityGroupBasicInfo
    created_at: date
    created_by: int = None


class QualitiesGroupedByQualityGroup(Schema):
    id: int
    name: str
    name_eng: str = None
    yomi: str = None
    short_name: str = None
    order_num: Optional[int]
    search_str: str
    is_default: bool
    qualities: List[Quality]
