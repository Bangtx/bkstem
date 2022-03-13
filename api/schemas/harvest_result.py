from typing import Optional
from .schema import Schema
from datetime import date, datetime


class HarvestResultBase(Schema):
    harvest_date: date
    stems: float
    desired_price: float
    quantity: float = None
    boxes: float = None


class HarvestResultCreate(HarvestResultBase):
    item_id: int
    size_id: int = None
    color_id: int = None
    quality_id: int = None
    unit_id: int
    variety_id: int
    remark: str = None
    desired_price: float = None


class HarvestResultUpdate(HarvestResultCreate):
    pass


class Master(Schema):
    id: int
    name: str
    search_str: str


class ColorMaster(Schema):
    id: int
    code: str
    name: str


class HarvestResult(HarvestResultBase):
    id: int
    item: Master
    variety: Master
    size: Master = None
    unit: Master
    quality: Master = None
    color: ColorMaster = None
    created_at: datetime
    ordered_stems: Optional[float]
    ordered_boxes: Optional[float]
    remark: str = None
    desired_price: float = None
